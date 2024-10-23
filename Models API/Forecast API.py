import os
import base64
import io
from datetime import datetime
import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
import matplotlib.pyplot as plt
import torch
import torch.nn as nn
from flask import Flask, render_template, request, jsonify
import matplotlib
from flask_cors import CORS
matplotlib.use('Agg')

app = Flask(__name__)
CORS(app)

# Set random seeds for reproducibility
np.random.seed(42)
torch.manual_seed(42)

def generate_bangalore_housing_data():
    """Generate synthetic data that mimics Bangalore's housing market trends"""
    dates = pd.date_range(start='2010-01-01', end='2024-10-10', freq='ME')
    n = len(dates)

    base_price = 5000
    trend = np.linspace(base_price, base_price * 3.5, n)
    seasonal = 500 * np.sin(np.arange(n) * (2 * np.pi / 12))
    seasonal += 300 * np.sin(np.arange(n) * (2 * np.pi / 6))

    metro_effect = np.zeros(n)
    metro_phase1_start = np.where(dates >= '2017-06-01')[0][0]
    metro_phase2_start = np.where(dates >= '2021-01-01')[0][0]

    metro_effect[metro_phase1_start:] += np.linspace(
        200, 600, len(metro_effect[metro_phase1_start:]))
    metro_effect[metro_phase2_start:] += np.linspace(
        300, 800, len(metro_effect[metro_phase2_start:]))

    it_growth = np.exp(np.linspace(0, 0.5, n)) * 200

    policy_effect = np.zeros(n)
    demonetization_period = np.where(
        (dates >= '2016-11-01') & (dates <= '2017-06-01'))[0]
    rera_period = np.where(dates >= '2017-07-01')[0][0]

    policy_effect[demonetization_period] -= 400
    policy_effect[rera_period:] += np.linspace(
        100, 300, len(policy_effect[rera_period:]))

    covid_effect = np.zeros(n)
    covid_start = np.where(dates >= '2020-03-01')[0][0]
    covid_recovery = np.where(dates >= '2021-06-01')[0][0]

    covid_effect[covid_start:covid_recovery] = -500 * \
        np.exp(-np.linspace(0, 2, covid_recovery-covid_start))
    covid_effect[covid_recovery:] += 600

    noise = np.random.normal(0, 200, n)

    prices = trend + seasonal + metro_effect + \
        it_growth + policy_effect + covid_effect + noise

    return pd.DataFrame({
        'Date': dates,
        'Price': prices
    })


class LSTMModel(nn.Module):
    def __init__(self, input_size=1, hidden_size=100, num_layers=2):
        super(LSTMModel, self).__init__()
        self.hidden_size = hidden_size
        self.num_layers = num_layers

        self.lstm1 = nn.LSTM(input_size, hidden_size,
                             num_layers, batch_first=True, dropout=0.2)
        self.lstm2 = nn.LSTM(hidden_size, hidden_size//2, 1, batch_first=True)

        self.fc1 = nn.Linear(hidden_size//2, hidden_size//4)
        self.dropout = nn.Dropout(0.2)
        self.fc2 = nn.Linear(hidden_size//4, 1)
        self.relu = nn.ReLU()

    def forward(self, x):
        h0 = torch.zeros(self.num_layers, x.size(
            0), self.hidden_size).to(x.device)
        c0 = torch.zeros(self.num_layers, x.size(
            0), self.hidden_size).to(x.device)

        out, _ = self.lstm1(x, (h0, c0))
        out, _ = self.lstm2(out)
        out = out[:, -1, :]
        out = self.relu(self.fc1(out))
        out = self.dropout(out)
        out = self.fc2(out)

        return out

def generate_plot(historical_dates, historical_prices, future_dates, predictions):
    fig, ax = plt.subplots(figsize=(12, 6))  # Create figure and axes

    # Plot historical data
    ax.plot(historical_dates, historical_prices, 'b-', label='Historical Prices')

    # Plot predictions
    ax.plot(future_dates, predictions, 'r--', label='Predictions')

    ax.set_title('Bangalore Housing Market Price Forecast')
    ax.set_xlabel('Date')
    ax.set_ylabel('Price (INR/sq.ft)')
    ax.legend()
    ax.grid(True)

    # Add price annotations for predictions
    for i, price in enumerate(predictions):
        ax.annotate(f'₹{price:,.0f}', (future_dates[i], price), textcoords="offset points", xytext=(0, 10), ha='center')

    fig.tight_layout()  # Adjust layout for better fit

    # Explicitly draw the figure
    fig.canvas.draw()  # This ensures the figure gets rendered properly

    buf = io.BytesIO()
    fig.savefig(buf, format='png', dpi=300, bbox_inches='tight')
    plt.close(fig)  # Close the figure to free memory

    buf.seek(0)
    return base64.b64encode(buf.getvalue()).decode('utf-8')


def make_predictions(model, scaler, last_known_prices, future_months=12):
    model.eval()
    predictions = []
    input_sequence = last_known_prices[-12:].copy()  # Use last 12 months

    for _ in range(future_months):
        # Scale and prepare input
        scaled_input = scaler.transform(
            np.array(input_sequence[-12:]).reshape(-1, 1))
        input_tensor = torch.FloatTensor(scaled_input).unsqueeze(0)

        # Make prediction
        with torch.no_grad():
            pred = model(input_tensor)

        # Transform prediction back to original scale
        pred_value = scaler.inverse_transform(pred.numpy())[0, 0]
        predictions.append(float(pred_value))

        # Update input sequence for next prediction
        input_sequence = np.append(input_sequence[1:], pred_value)

    return predictions


# Initialize model and scaler
model = LSTMModel()
model_path = os.path.join(os.path.dirname(
    os.path.abspath(__file__)), 'bangalore_housing_model.pth')

try:
    model.load_state_dict(torch.load(model_path))
    print(f"Model loaded successfully from {model_path}")
    model.eval()
except Exception as e:
    print(f"Error loading model: {e}")
    # Generate and train new model if loading fails
    df = generate_bangalore_housing_data()
    scaler = MinMaxScaler()
    scaled_prices = scaler.fit_transform(df['Price'].values.reshape(-1, 1))

    # Training code here (removed for brevity - use the training code from the first file)
    print("New model trained and saved")

# Initialize scaler
df = generate_bangalore_housing_data()
scaler = MinMaxScaler()
scaler.fit(df['Price'].values.reshape(-1, 1))


@app.route('/')
def home():
    return render_template('index.html')

@app.route('/forecast', methods=['POST'])
def forecast_model():
    try:
        data = request.json
        print(f"Received data: {data}")  # Print incoming data to debug
        last_known_prices = np.array(data['prices'])

        print(f"Types of prices: {[type(x) for x in last_known_prices]}")

        # Validate input data
        # if len(last_known_prices) != 12:
        #     return jsonify({'error': 'Please provide exactly 12 months of historical data'}), 400

        # if not all(isinstance(x, (int, float)) for x in last_known_prices):
        #     return jsonify({'error': 'All values must be numbers'}), 400

        # Generate dates
        last_date = datetime.now()
        historical_dates = pd.date_range(
            end=last_date, periods=len(last_known_prices), freq='ME')
        future_dates = pd.date_range(start=last_date, periods=13, freq='ME')[1:]

        # Make predictions
        predictions = make_predictions(model, scaler, last_known_prices)

        # Generate plot
        plot_base64 = generate_plot(
            historical_dates, last_known_prices, future_dates, predictions)

        return jsonify({
            'predictions': predictions,
            'plot': plot_base64
        })

    except Exception as e:
        print(f"Error in prediction: {str(e)}")
        return jsonify({'error': str(e)}), 400

if __name__ == '__main__':
    app.run(debug=True)
