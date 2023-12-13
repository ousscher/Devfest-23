const express = require('express');
const router = express.Router();
const { getUser } = require('../controllers/UserController');
const {getPaiment} = require('../controllers/paimentController')
const {getProgress} = require('../controllers/progressControllers')

const requireAuth = require('../middleware/auth')

router.use(requireAuth)

router.get('/user/:lotNumber', getUser)
router.get('/paiment/:lot', getPaiment)
router.get('/progress/:lot', getProgress)

module.exports = router