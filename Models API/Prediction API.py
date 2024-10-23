from flask import Flask, render_template, request, jsonify
import pickle
import json
import numpy as np
from flask_cors import CORS

# Initialize Flask app
app = Flask(__name__)
CORS(app)

# Load the trained model and columns.json
with open('banglore_home_prices_model.pickle', 'rb') as f:
    model = pickle.load(f)

with open('columns.json', 'r') as f:
    data_columns = json.load(f)['data_columns']

# A helper function to get model input from user input
def get_input_from_request(location, area, bhk, bath):
    try:
        loc_index = data_columns.index(location.lower())
    except ValueError:
        loc_index = -1  # If location is not found

    x = np.zeros(len(data_columns))
    x[0] = area
    x[1] = bhk
    x[2] = bath
    if loc_index >= 0:
        x[loc_index] = 1  # One hot encode location
    return x

@app.route('/')
def home():
    return render_template('predindex.html')  # Renders index.html from the templates folder

# Define a prediction route
@app.route('/predict', methods=['POST'])
def predict():
    # Get the data from the request
    data = request.json
    location = data['location']
    area = float(data['area'])
    bhk = int(data['bhk'])
    bath = int(data['bath'])

    # Prepare the input for the model
    input_features = get_input_from_request(location, area, bhk, bath)

    # Get the prediction from the model
    prediction = model.predict([input_features])[0]

    # Return the result as JSON
    return jsonify({'estimated_price': round(prediction, 2)})

# Run the Flask app
if __name__ == "__main__":
    app.run(debug=True, port=8080)
