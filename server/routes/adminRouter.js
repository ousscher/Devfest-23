const express = require('express');
const router = express.Router();
const admin = require('../controllers/adminControllers')

router.patch('/updateUser' , admin)

module.exports = router;