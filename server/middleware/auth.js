const jwt = require('jsonwebtoken')
const User = require('../models/UserModel')

const requireAuth = async(req,res,next)=>{

    const { authorization } = req.headers

    try {

        if(!authorization){
            throw Error('You must be authorized')
        }

        const token = authorization.split(' ')

        const {_id} = jwt.verify(token[1] , process.env.SECRET)

        req.user = await User.findOne({_id}).select('_id')

        next()
        
    } catch (error) {
        res.status(500).json({error : error.message})
    }
}


module.exports = requireAuth