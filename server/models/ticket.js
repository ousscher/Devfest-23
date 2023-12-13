const mongoose = require("mongoose");
const ticketSchema = new mongoose.Schema(
  {
    ticketType: {
      type: String,
      required: true,
    },
    title: {
      type: String,
    },
    content: {
        type : String
    },
    lot: {
        type : mongoose.Schema.Types.ObjectId,
        ref : 'Appartement'
    },
    status : {
        type : Boolean,
    }
  },
  { timestamps: true }
);

const Ticket = mongoose.model("Ticket", ticketSchema);

module.exports = Ticket;
