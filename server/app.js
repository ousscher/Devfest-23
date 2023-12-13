require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const app = express();
const connectDB = require("./models/activate");
const aprRouter = require("./routes/appartementRoute");
const adminRouter = require("./routes/adminRouter");
const progressRouter = require("./routes/progressRouter");
const paimentRouter = require("./routes/paimentRouter");
const getRouters = require("./routes/getRouters");
const ticketRouter = require("./routes/TicketRouter");
// const workoutRoutes = require('./routes/workouts');
const userRoutes = require("./routes/user");
// Database connection
const startDatabaseConnection = async () => {
  try {
    await connectDB(process.env.MONGO_URI);
    console.log("Database connected successfully");
  } catch (err) {
    console.error("Database connection failed", err);
    process.exit(1);
  }
};

const cors = require("cors");

app.use(cors()); // Active CORS pour toutes les routes

app.use(express.json());

app.use((req, res, next) => {
  console.log(req.path, req.method);
  next();
});

// Routes setup
const notifRouter = require("./routes/notificationsRoutres");
const { addNotif } = require("./controllers/Notification");
const Notification = require("./models/Notification");
// app.use('/api/progress' , progressRouter)
// app.use('/api/paiment' , paimentRouter)
app.use("/api/user", userRoutes);
app.use("/api/ticket", ticketRouter);
app.use("/api/apartement", aprRouter);
app.use("/api/admin", adminRouter);
app.use("/api/notif", notifRouter);
app.use("/api/progress", progressRouter);
app.use("/api/paiment", paimentRouter);
app.use("/api/get", getRouters);

const start = () => {
  connectDB(process.env.MONGO_URI)
    .then(() => {
      app.listen(process.env.PORT, () => {
        console.log(`connect to db and listening on port ${process.env.PORT}`);
      });
    })
    .catch((err) => {
      console.log(err);
    });
};
start();
//listening for requests
