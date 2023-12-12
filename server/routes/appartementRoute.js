const express = require('express')
const routers = express.Router()
const aprPost = require('../controllers/aprControllers')


routers.post('/', aprPost);
module.exports = routers