require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const http = require("http");
const { Server } = require("socket.io");
const cors = require("cors");
const app = express();
const server = http.createServer(app);
const connectDB = require("./models/activate");
const Notification = require("./models/Notification");
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

app.use(cors()); 

app.use(express.json());

app.use((req, res, next) => {
  console.log(req.path, req.method);
  next();
}); 
// exemple for send notification
app.post("/api/notif/add", async (req, res) => {
  try {
    const newNotification = new Notification(req.body);
    await newNotification.save();
    io.emit("new-notification", newNotification);
    console.log("notif sended");
    res.status(201).send("notif send");
  } catch (error) {
    res.status(500).send(error);
  }
});

const io = new Server(server, {
  cors: { origin: "http://localhost:3000", methods: ["GET", "POST"] },
});
io.on("connection", (socket) => {
  console.log("A user connected");
  socket.on("disconnect", () => {
    console.log("User disconnected");
  });
});

// Routes setup
const notifRouter = require("./routes/notificationsRoutres");
const { addNotif } = require("./controllers/Notification");
app.use('/api/progress' , progressRouter)
app.use('/api/paiment' , paimentRouter)
app.use("/api/user", userRoutes);
app.use("/api/ticket", ticketRouter);
app.use("/api/apartement", aprRouter);
app.use("/api/admin", adminRouter);
app.use("/api/notif", notifRouter);
app.use("/api/progress", progressRouter);
app.use("/api/paiment", paimentRouter);
app.use("/api/get", getRouters);

startDatabaseConnection().then(() => {
    const PORT = process.env.PORT || 4000;
    server.listen(PORT, () => {
      console.log(`Server listening on port ${PORT}`);
    });
  });
//listening for requests
