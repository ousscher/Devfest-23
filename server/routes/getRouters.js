const express = require('express');
const router = express.Router();
const { getUser } = require('../controllers/UserController');

const requireAuth = require('../middleware/auth')

router.use(requireAuth)

router.get('/:lotNumber', getUser)

module.exports = router