// Environment setup and necessary imports
require("dotenv").config();
const express = require("express");
const mongoose = require("mongoose");
const http = require("http");
const { Server } = require("socket.io");
const cors = require("cors");
const app = express();
const server = http.createServer(app);
const connectDB = require('./models/activate')
const aprRouter = require('./routes/appartementRoute')
const adminRouter = require('./routes/adminRouter')
const progressRouter = require('./routes/progressRouter')
const paimentRouter = require('./routes/paimentRouter')
const getRouters = require('./routes/getRouters')
// const workoutRoutes = require('./routes/workouts');
const userRoutes = require('./routes/user')
const cors = require('cors');


app.use(cors()); // Active CORS pour toutes les routes


app.use(express.json());
app.use(cors());
app.use((req, res, next) => {
  console.log(`${req.method} ${req.path}`);
  next();
});

// Routes setup
const userRoutes = require("./routes/user");
const aprRouter = require("./routes/appartementRoute");
const adminRouter = require("./routes/adminRouter");
const notifRouter = require("./routes/notificationsRoutres");
const paimentRouter=require("./routes/paimentRouter")
const progressRouter=require("./routes/progressRouter")
const { addNotif } = require("./controllers/Notification");
const Notification = require("./models/Notification");
// app.use('/api/progress' , progressRouter)
// app.use('/api/paiment' , paimentRouter)
app.use("/api/user", userRoutes);
app.use("/api/apartement", aprRouter);
app.use("/api/admin", adminRouter);
app.use("/api/notif", notifRouter);
app.use('/api/progress' , progressRouter)
app.use('/api/paiment' , paimentRouter)
app.use('/api/get' , getRouters)
// app.post("/api/notif/add", addNotif);
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
app.post("/api/notif/mark-read/:id", async (req, res) => {
  try {
    const notificationId = req.params.id;
    const notification = await Notification.findOneAndUpdate(
      { id: notificationId },
      { read: true },
      { new: true }
    );

    if (!notification) {
      return res.status(404).send("Notification not found");
    }
    io.emit("read-notification", notification);//routes


    res.status(200).send(`notification ${notificationId} marked as read`);
  } catch (error) {
    res.status(500).send(error);
  }
});
app.delete("/api/notif/delete-notif", async (req, res) => {
  try {
    await Notification.deleteMany({});
    io.emit("delete-notification", "all");
    res.status(200).send("All notifications deleted");
  } catch (error) {
    res.status(500).send(error);
  }
});
// Socket.IO integration
const io = new Server(server, {
  cors: { origin: "http://localhost:3000", methods: ["GET", "POST"] },
});

io.on("connection", (socket) => {
  console.log("A user connected");

  socket.on("disconnect", () => {
    console.log("User disconnected");
  });
});

// Server initialization
startDatabaseConnection().then(() => {
  const PORT = process.env.PORT || 4000;
  server.listen(PORT, () => {
    console.log(`Server listening on port ${PORT}`);
  });
});
// module.exports= {io}
