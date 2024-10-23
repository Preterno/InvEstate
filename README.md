# InvEstate Platform

InvEstate is a REITs (Real Estate Investment Trust) platform where users can browse real estate listings dynamically generated from a PostgreSQL database, sign up, log in, and invest in properties. The platform features AI-powered price prediction and market forecasting, an AdminJS-based admin panel for managing listings, and a static portfolio dashboard for visualizing investments. Additionally, there is a Cashfree payment gateway integration for handling transactions.

## Key Features

### Investment & Portfolio Management
- Browse dynamic real estate listings from PostgreSQL database
- Static portfolio dashboard for investment tracking
- Secure Cashfree payment gateway integration (Test Mode)
- Investment diversification visualization
- User data storage in PostgreSQL database

### AI-Powered Market Intelligence
- **Price Prediction Model**: Estimates current property prices based on:
  - Location
  - Total area
  - Number of bedrooms
  - Number of bathrooms
- **Market Forecasting Model**: Projects future property values using:
  - Takes previous 12-month price per sq/ft data
  - Forecasts prices for next 12 months

### Platform Features
- User authentication system (signup/login)
- AdminJS-powered administrator panel
- Authorization middleware for protected routes
- Responsive property listing interface

## Tech Stack

### Backend & Database
- Node.js with Express
- PostgreSQL with Sequelize ORM
- Flask APIs for AI models
- AdminJS with Sequelize adapter

### Frontend & UI
- EJS (Embedded JavaScript)
- Responsive design
- Interactive data visualizations

### Security & Integration
- express-session for session management
- bcrypt for password hashing
- Cashfree payment gateway (Sandbox mode)

## Requirements

- Node.js (v14 or later)
- PostgreSQL
- Python 3.7+ (for AI models)

## Setup Instructions

### Clone the repository
```bash
git clone https://github.com/Preterno/InvEstate.git
cd InvEstate
```

### Install dependencies
```bash
npm install
```

### Set up environment variables
Create a `.env` file at the root of your project:
```
CASHFREE_APP_ID=YOUR_CASHFREE_APP_ID
CASHFREE_SECRET_KEY=YOUR_CASHFREE_SECRET_KEY
BASE_URL=http://localhost:3000
SESSION_SECRET=your_session_secret
DB_NAME=InvEstate
DB_USER=your_postgres_user
DB_PASSWORD=your_postgres_password
DB_HOST=localhost
DB_DIALECT=postgres
ADMIN_EMAIL=admin_email
ADMIN_PASSWORD=admin_password
ADMIN_COOKIE_SECRET=your_admin_cookie_secret
```

### Database Setup
```bash
createdb InvEstate
```

You can either:
1. Run migrations for a fresh database:
```bash
npm run db:migrate
```

2. Or import the included database dump for pre-populated data:
```bash
psql InvEstate < InvEstate.sql
```

The included SQL dump contains:
- Pre-populated property listings with complete details
- Database schema for properties and users
- Properties with details like area, ROI, investment minimums, property type and risk levels

### Running the Application
```bash
node server.js
```
The application will be available at http://localhost:3000

## Routes & Features

### Main Platform Routes
- **Home:** `/`
- **Property Listings:** `/listing` (protected)
- **Property Details:** `/listing/:id` (protected)
- **Dashboard:** `/dashboard` (protected)
- **Models:** `/models` (access to price prediction and market forecast)

### Authentication Routes
- **Signup:** `/signup`
- **Login:** `/login`

### Admin & Payment Routes
- **Admin Panel:** `/admin` (admin authentication required)
- **Payment Initiation:** `/payment?amt=:amount` (protected)
- **Payment Status:** `/payment-status`

## Payment Testing (Sandbox Mode)

The platform currently uses Cashfree's sandbox environment for testing:

1. Navigate to `/payment?amt=10000` after login
2. System generates a test order ID
3. Redirects to Cashfree's test environment
4. Completes with redirect to `/payment-status`

## Current Limitations

- Portfolio dashboard features static data visualization
- Payment gateway operates in test mode only

## Project Structure

The AI models are implemented as Flask APIs in the following structure:
- `models api/`: Contains both Flask APIs
  - `prediction.py`: Property price prediction
  - `forecast.py`: Market value forecasting
- `models/`: Contains the trained model files

[Previous sections remain the same until the end...]

## Contributors

- **Mohammed Aslam** - Backend Development • [Connect on LinkedIn](https://www.linkedin.com/in/aslam8483) 
- **Pendem Sreevardhan** - Frontend Development • [Connect on LinkedIn](http://www.linkedin.com/in/sreevardhan-pendem)
- **CV Kushal Kumar** - Frontend Development • [Connect on LinkedIn](https://www.linkedin.com/in/cv-kushal-kumar)
- **Gaurav Malave** - Machine Learning Models • [Connect on LinkedIn](http://www.linkedin.com/in/gaurav-malave)
