import express from "express";
import bodyParser from "body-parser";
import { Sequelize, DataTypes } from "sequelize";
import expressLayouts from "express-ejs-layouts";
import AdminJS from "adminjs";
import { buildAuthenticatedRouter } from "@adminjs/express";
import bcrypt from "bcrypt";
import session from "express-session";
import AdminJSSequelize from "@adminjs/sequelize";
import { config } from "dotenv";
import { randomBytes, createHash } from "crypto";
import axios from "axios";

config();

const CASHFREE_BASE_URL = "https://sandbox.cashfree.com/pg";
const CASHFREE_APP_ID = process.env.CASHFREE_APP_ID;
const CASHFREE_SECRET_KEY = process.env.CASHFREE_SECRET_KEY;

const app = express();
app.use(expressLayouts);
app.set("layout", "layout");
app.set("view engine", "ejs");
app.use(express.static("public"));

app.use(
  session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
  })
);

const sequelize = new Sequelize(
  process.env.DB_NAME,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: process.env.DB_DIALECT,
  }
);

const User = sequelize.define(
  "User",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    email: {
      type: DataTypes.STRING,
      unique: true,
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "users",
    timestamps: false,
  }
);

const Property = sequelize.define(
  "Property",
  {
    id: {
      type: DataTypes.INTEGER,
      primaryKey: true,
      autoIncrement: true,
    },
    name: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false,
    },
    photos: {
      type: DataTypes.ARRAY(DataTypes.TEXT),
      allowNull: false,
    },
    total_area: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    bedrooms: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    bathrooms: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    target_closing_date: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    property_type: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    investment_minimum: {
      type: DataTypes.DECIMAL(12, 2),
      allowNull: false,
    },
    roi: {
      type: DataTypes.DECIMAL(5, 2),
      allowNull: false,
    },
    project_cost: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    risk_level: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    equity_investment: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    senior_loan: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    tableName: "properties",
    timestamps: false,
  }
);

AdminJS.registerAdapter(AdminJSSequelize);
const adminJs = new AdminJS({
  resources: [
    {
      resource: Property,
      options: {
        properties: {
          photos: {
            type: "string",
            isArray: true,
          },
        },
      },
    },
  ],
  rootPath: "/admin",
});

const adminRouter = buildAuthenticatedRouter(
  adminJs,
  {
    authenticate: async (email, password) => {
      if (
        email === process.env.ADMIN_EMAIL &&
        password === process.env.ADMIN_PASSWORD
      ) {
        return { email: process.env.ADMIN_EMAIL };
      }
      return null;
    },
    cookiePassword: process.env.ADMIN_COOKIE_SECRET,
  },
  null,
  {
    resave: false,
    saveUninitialized: true,
    secret: process.env.ADMIN_COOKIE_SECRET,
    cookie: { secure: false },
  },
  {
    after: {
      auth: (response, request, context) => {
        const { adminUser } = context.session;
        if (adminUser) {
          const redirectTo = context.session.returnTo || "/admin";
          delete context.session.returnTo;
          return { redirectUrl: redirectTo };
        }
        return response;
      },
    },
  }
);

const portfolioData = {
  quickStats: {
    totalInvested: "₹7,25,000",
    currentYearReturns: "12.8%",
    priorYearsReturns: "10.5%",
    totalReturns: "₹92,800",
    ongoingProjects: 12,
    propertiesInvested: 15,
    expectedReturns: "13.5%",
    realizedEarnings: "₹45,750",
  },
  diversification: {
    "Micro Residential": 40,
    "Commercial REITs": 25,
    "Fractional Office": 20,
    "Warehouse Units": 10,
    "Mixed Development": 5,
  },
  investments: [
    {
      name: "Whitefield Tech Park REIT",
      amount: "₹55,000",
    },
    {
      name: "Electronic City Apartment Pool",
      amount: "₹75,000",
    },
    {
      name: "Marathahalli Retail Space",
      amount: "₹65,000",
    },
    {
      name: "Bannerghatta Road Housing",
      amount: "₹50,000",
    },
    {
      name: "Hebbal Commercial Complex",
      amount: "₹60,000",
    },
    {
      name: "Bommasandra Warehouse",
      amount: "₹70,000",
    },
    {
      name: "HSR Layout Shop Space",
      amount: "₹80,000",
    },
    {
      name: "Sarjapur Road Apartments",
      amount: "₹45,000",
    },
    {
      name: "Outer Ring Road Office REIT",
      amount: "₹50,000",
    },
    {
      name: "KR Puram Metro Complex",
      amount: "₹75,000",
    },
    {
      name: "Devanahalli Warehouse",
      amount: "₹50,000",
    },
    {
      name: "Hennur Road Housing",
      amount: "₹50,000",
    },
  ],
  growthData: [
    { month: "May 2024", value: 725000, forecasted: false },
    { month: "Jun 2024", value: 742000, forecasted: false },
    { month: "Jul 2024", value: 758000, forecasted: false },
    { month: "Aug 2024", value: 775000, forecasted: false },
    { month: "Sep 2024", value: 792000, forecasted: false },
    { month: "Oct 2024", value: 810000, forecasted: false },
    { month: "Nov 2024", value: 828000, forecasted: true },
    { month: "Dec 2024", value: 847000, forecasted: true },
  ],
  scenarioData: [
    { month: "May 2024", base: 725000, bullish: 725000, bearish: 725000 },
    { month: "Jun 2024", base: 742000, bullish: 748000, bearish: 736000 },
    { month: "Jul 2024", base: 758000, bullish: 770000, bearish: 746000 },
    { month: "Aug 2024", base: 775000, bullish: 795000, bearish: 755000 },
    { month: "Sep 2024", base: 792000, bullish: 820000, bearish: 765000 },
    { month: "Oct 2024", base: 810000, bullish: 848000, bearish: 775000 },
    { month: "Nov 2024", base: 828000, bullish: 878000, bearish: 785000 },
    { month: "Dec 2024", base: 847000, bullish: 910000, bearish: 795000 },
  ],
};

app.use(adminJs.options.rootPath, adminRouter);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.get("/", async (req, res) => {
  const propertyPrimaryKeys = [33, 24, 27, 4, 8, 10, 12, 9];
  const featuredProperties = await Property.findAll({
    where: {
      id: propertyPrimaryKeys,
    },
  });
  const loggedin = req.session.userId ? true : false;

  res.render("index", {
    showLoginSignup: !loggedin,
    loggedin,
    featuredProperties,
    index: true,
  });
});

let firstTimeLogin = false;

app.post("/signup", async (req, res) => {
  const { name, email, password, confirmPassword } = req.body;
  try {
    const existingUser = await User.findOne({ where: { email } });
    if (existingUser) {
      return res.status(400).send("User already exists");
    }
    if (password !== confirmPassword) {
      return res.status(400).send("Password and confirm password don't match");
    }
    const hashedPassword = await bcrypt.hash(password, 10);

    const newUser = await User.create({
      name,
      email,
      password: hashedPassword,
    });
    firstTimeLogin = true;
    req.session.userId = newUser.id;
    res.redirect("/login");
  } catch (error) {
    console.error("Signup error:", error);
    res.status(500).send("Server error");
  }
});

app.get("/signup", (req, res) => {
  if (req.session.userId) {
    res.redirect("/dashboard");
  } else {
    res.render("signup", { showLoginSignup: false });
  }
});

app.post("/login", async (req, res) => {
  const { email, password } = req.body;
  try {
    const user = await User.findOne({ where: { email } });
    if (!user) {
      return res.status(400).send("Invalid email or password");
    }

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).send("Invalid email or password");
    }

    req.session.userId = user.id;

    const redirectUrl = req.query.redirect || "/listing";
    console.log(req.query);
    return res.redirect(redirectUrl);
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).send("Server error");
  }
});

app.get("/login", (req, res) => {
  if (!firstTimeLogin && req.session.userId) {
    res.redirect("/dashboard");
  } else {
    res.render("login", { showLoginSignup: false });
  }
});

const authMiddleware = (req, res, next) => {
  if (!req.session.userId) {
    const redirectUrl = encodeURIComponent(req.originalUrl);
    return res.redirect(`/login?redirect=${redirectUrl}`);
  }
  next();
};

app.get("/listing", authMiddleware, async (req, res) => {
  try {
    const propertyPrimaryKeys = [33, 24, 27, 5, 8, 10, 12, 9];

    const featuredProperties = await Property.findAll({
      where: {
        id: propertyPrimaryKeys,
      },
    });
    const properties = await Property.findAll();
    const groupedProperties = properties.reduce((groups, property) => {
      const propertyType = property.property_type;
      if (!groups[propertyType]) {
        groups[propertyType] = [];
      }
      groups[propertyType].push(property);
      return groups;
    }, {});
    res.render("listingpage", {
      loggedin: true,
      groupedProperties,
      featuredProperties,
    });
  } catch (error) {
    console.error("Error fetching properties:", error);
    res.status(500).send("Error fetching properties");
  }
});

app.get("/models", (req, res) => {
  res.render("forms");
});

app.get("/listing/:id", authMiddleware, async (req, res) => {
  const { id } = req.params;
  try {
    const property = await Property.findByPk(id);
    if (!property) {
      return res.status(404).send("Property not found");
    }
    res.render("property-listing-page", { loggedin: true, property });
  } catch (error) {
    console.error("Error fetching property:", error);
    res.status(500).send("Error fetching property");
  }
});

app.get("/dashboard", authMiddleware, async (req, res) => {
  const loggedin = true;
  const userId = req.session.userId;
  const user = await User.findByPk(userId);
  res.render("dashboard", { user: req.session, loggedin, user, portfolioData });
});

app.get("/logout", authMiddleware, (req, res) => {
  if (req.session) {
    req.session.destroy();
  }
  res.render("logout");
});

function generateOrderId() {
  const uniqueId = randomBytes(16).toString("hex");
  const hash = createHash("sha256");
  hash.update(uniqueId);
  const orderId = hash.digest("hex");
  return orderId.substring(0, 12);
}

app.get("/payment", authMiddleware, async (req, res) => {
  const { amt } = req.query;
  console.log("Payment initiated with amount:", amt);

  try {
    const orderId = await generateOrderId();
    console.log("Generated order ID:", orderId);

    const payload = {
      order_id: orderId,
      order_amount: parseFloat(amt),
      order_currency: "INR",
      customer_details: {
        customer_id: "aslam",
        customer_name: "Mohammed Aslam",
        customer_phone: "9999999999",
        customer_email: "aslam@gmail.com",
      },
      order_meta: {
        return_url: `${process.env.BASE_URL}/payment-status?order_id=${orderId}`,
        merchant_name: "InvEstate",
      },
      order_tags: {
        source: "web",
      },
    };

    console.log(
      "Sending request to Cashfree:",
      JSON.stringify(payload, null, 2)
    );

    const response = await axios.post(`${CASHFREE_BASE_URL}/orders`, payload, {
      headers: {
        "x-client-id": CASHFREE_APP_ID,
        "x-client-secret": CASHFREE_SECRET_KEY,
        "x-api-version": "2022-09-01",
        "Content-Type": "application/json",
      },
    });

    console.log("Cashfree response:", JSON.stringify(response.data, null, 2));

    res.json({
      order_id: orderId,
      payment_session_id: response.data.payment_session_id,
      order_status: response.data.order_status,
    });
  } catch (error) {
    console.error("Payment creation error:", {
      message: error.message,
      response: error.response?.data,
      status: error.response?.status,
    });
    res.status(500).json({
      error: "Payment initialization failed",
      details: error.response?.data || error.message,
    });
  }
});

app.get("/payment-status", async (req, res) => {
  const { order_id } = req.query;
  console.log("Checking payment status for order:", order_id);

  try {
    const response = await axios.get(
      `${CASHFREE_BASE_URL}/orders/${order_id}/payments`,
      {
        headers: {
          "x-client-id": CASHFREE_APP_ID,
          "x-client-secret": CASHFREE_SECRET_KEY,
          "x-api-version": "2022-09-01",
        },
      }
    );

    console.log("Payment status response:", response.data);

    if (response.data[0].payment_status === "SUCCESS") {
      res.redirect("/success");
    } else {
      res.redirect("/failure");
    }
  } catch (error) {
    console.error(
      "Payment status check error:",
      error.response?.data || error.message
    );
    res.redirect("/failure");
  }
});

app.get("/success", authMiddleware, (req, res) => {
  res.render("partials/success");
});

app.get("/failure", authMiddleware, (req, res) => {
  res.render("partials/failure");
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
  console.log(`AdminJS panel is available at http://localhost:${PORT}/admin`);
});
