const express = require ('express');
const router = express.Router();
const UserController = require('../controllers/UserController');

//login route
router.post(  '/login', UserController.loginUser);
//signup route
router.post('/signup' , UserController.signupUser)

module.exports = router;