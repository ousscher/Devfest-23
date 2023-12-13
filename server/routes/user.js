const express = require('express');
const router = express.Router();
const { loginUser, signupUser , getUser } = require('../controllers/UserController');

//login route
router.post('/login', loginUser);
//signup route
router.post('/signup', signupUser)



module.exports = router;