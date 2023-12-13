const express = require('express');
const router = express.Router();
const {createPaiment} = require('../controllers/paimentController')

router.post('/', createPaiment)

module.exports = router;