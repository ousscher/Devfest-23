const express = require("express");
const router = express.Router();
const {addTicket,getTicket,deleteTicket}=require('../controllers/ticketControl')
router.post("/newTicket",addTicket)
router.get("/:lotNumber",getTicket)
router.delete("/delete",deleteTicket)
module.exports=router