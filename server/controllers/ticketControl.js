const Ticket = require("../models/ticket");
const Appartement = require("../models/appartement");
const addTicket = async (req, res) => {
  try {
    const { type, content, title, lotNumber } = req.body;

    if (!type) {
      throw Error("fill the type field");
    }
    const apr = await Appartement.findOne({ lotNumber });

    if (!apr) {
      throw Error(`there is no appartment with this Lot Number : ${lotNumber}`);
    }

    const data = await Ticket.create({
      type,
      content,
      title,
      lotNumber: apr._id,
      status : flase
    });

    res.status(201).json({data});
  } catch (error) {
    res.status(500).send({error : error.message});
  }
};

const getTicket = async (req, res) => {
  const { lotNumber } = req.params;

  try {
    const apr = await Appartement.findOne({ lotNumber });

    if (!apr) {
      throw Error("There is no appartement with this lot");
    }

    const data = await Ticket.findOne({ lotNumber: apr._id });

    // io.emit("new-notification", notifications);

    res.status(200).send({ data });
  } catch (error) {
    res.status(500).send({ error: error.message });
  }
};
const deleteTicket = async (req, res) => {
  try {
    await Ticket.deleteMany({});
    res.status(200).send("All ticket deleted");
  } catch (error) {
    res.status(500).send(error);
  }
};
module.exports = { addTicket, getTicket, deleteTicket };
