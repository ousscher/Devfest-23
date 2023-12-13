const Notification = require("../models/Notification");
// const {io} =require('../app')
// const addNotif = async (req, res) => {
//   try {
//     const newNotification = new Notification(req.body);
//     await newNotification.save();
//     io.emit("new-notification", newNotification);
//     res.status(201).send(newNotification);
//   } catch (error) {
//     res.status(500).send(error);
//   }
// };
const getNotif = async (req, res) => {
  try {
    const notifications = await Notification.find();
    // io.emit("new-notification", notifications);

    res.status(200).send(notifications);
  } catch (error) {
    res.status(500).send(error);
  }
};
const markRead = async (req, res) => {
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

    res.status(200).send(`notification ${notificationId} marked as read`);
  } catch (error) {
    res.status(500).send(error);
  }
};
const markReadAll = async (req, res) => {
  try {
    await Notification.updateMany({}, { read: true });
    res.status(200).send("All notifications marked as read");
  } catch (error) {
    res.status(500).send(error);
  }
};
const delteNotifications = async (req, res) => {
  try {
    await Notification.deleteMany({});
    res.status(200).send("All notifications deleted");
  } catch (error) {
    res.status(500).send(error);
  }
};
const newNotif = async (req, res) => {
  try {
    const unreadNotifications = await Notification.find({ read: false });
    res.status(200).send(unreadNotifications);
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = {

  getNotif,
  markRead,
  markReadAll,
  delteNotifications,
  newNotif,
};
