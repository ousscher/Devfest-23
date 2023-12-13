const express = require('express');
const router = express.Router();
const createProgress = require('../controllers/progressControllers')

router.post('/', createProgress)

module.exports = router;