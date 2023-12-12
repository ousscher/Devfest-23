const mongoose = require("mongoose");
const Counter = require("./counter");
const notificationSchema = new mongoose.Schema({
  id: { type: Number, default: 0, unique: true },
  type: String,
  message: String,
  date: { type: Date, default: Date.now },
  read: { type: Boolean, default: false },
});

notificationSchema.pre("save", async function (next) {
  if (this.isNew) {
    const inc = await Counter.findByIdAndUpdate(
      { _id: "notificationID" },
      { $inc: { seq: 1 } },
      { new: true, upsert: true }
    );
    this.id = inc.seq;
  }
  next();
});

const Notification = mongoose.model("Notification", notificationSchema);

module.exports = Notification;
