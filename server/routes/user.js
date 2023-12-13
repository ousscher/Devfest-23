const express = require('express');
const router = express.Router();
const { loginUser, signupUser , getUser } = require('../controllers/UserController');
const {createFile} = require('../controllers/fileSharingControllers')

//login route
router.post('/login', loginUser);
//signup route
router.post('/signup', signupUser)

router.post('/sharing', createFile)

module.exports = router;