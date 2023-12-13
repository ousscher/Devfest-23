const express = require("express");
const router = express.Router();
const {addTicket,getTicket,deleteTicket, getTickets}=require('../controllers/ticketControl')
router.post("/newTicket",addTicket)
router.get("/:lotNumber",getTicket)
router.get("",getTickets)
router.delete("/delete",deleteTicket)
module.exports=router