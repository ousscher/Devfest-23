const Notification = require("../models/Notification");
const express = require("express");
const router = express.Router();
const {

  getNotif,
  markRead,
  markReadAll,
  delteNotifications,
  newNotif,
} = require("../controllers/Notification");
// const http = require("http");
// const socketIo = require("socket.io");
// const server = http.createServer(router);
// const cors = require("cors");
// const io = socketIo(server, {
//   cors: {
//     origin: "http://localhost:3000", // The URL of your React app
//     methods: ["GET", "POST"],
//   },
// });

// io.on("connection", (socket) => {
//   console.log("A user connected");

//   socket.on("disconnect", () => {
//     console.log("User disconnected");
//   });
// });
// const addNotif = async (req, res) => {
//   try {
//     const newNotification = new Notification(req.body);
//     await newNotification.save();
//     // io.emit("new-notification", newNotification);
//     console.log("notif sended");
//     res.status(201).send("notif send");
//   } catch (error) {
//     res.status(500).send(error);
//   }
// };
// router.post("/addNotif", addNotif);
router.get("", getNotif);
router.get("/new-notif", newNotif);
router.post("/mark-read/:id", markRead);
router.post("/mark-read-all", markReadAll);
// router.delete("/delete-notif", delteNotifications);
module.exports = router;
