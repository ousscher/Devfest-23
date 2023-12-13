const express = require('express');
const router = express.Router();
const admin = require('../controllers/adminControllers')
const {getFile} = require('../controllers/fileSharingControllers')


router.patch('/updateUser' , admin)

router.get('/file',getFile)

module.exports = router;