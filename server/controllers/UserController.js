const User = require('../models/UserModel');
const bcrypt = require('bcrypt')
const Appartement = require('../models/appartement')

//login user
const loginUser = async (req , res)=>{
    res.json({mssg : 'login user'})
};

//signup User

const signupUser = async (req , res)=>{
    const {userName , email , password , lotNumber} = req.body
    try {
        if(!userName || !email || !password){
            throw Error('All Fields Should Be Filled')
            return
        }
        if(password.length <= 6){
            throw Error('Your Password Is Too Easy')
            return
        }

        const existeEmail = await User.findOne({email})
        if(existeEmail){
            throw Error('The Email Is Already Used')
            return
        }

        const salt = await bcrypt.genSalt(10)
        const hashPassword = await bcrypt.hash(password , salt)

        const existeApr = await Appartement.findOne({lotNumber})

        if(!existeApr){
            throw Error ('There is no appartement with this number')
        }

        const data = await User.create({userName , email , password : hashPassword , lot : existeApr._id})
        console.log(data._id.toString())
        res.status(201).json({data})
        return data._id.toString()
    } catch (error) {
        res.status(500).json({error : error.message})
    }
    
};


const getUser = async(req,res)=>{

    const {lotNumber} = req.params
    const apr_id = await Appartement.findOne({lotNumber})._id

    try {

        const userData = await User.findOne({lot : apr_id})
        res.status(200).json({userData})
    } catch (error) {
        res.status(400).json({error})
    }
}

module.exports = {
    loginUser, 
    signupUser,
    getUser
}