const User = require('../models/UserModel');
const bcrypt = require('bcrypt')
const Appartement = require('../models/appartement')
const jwt = require('jsonwebtoken')

const createToken = (payload)=>{
    const token = jwt.sign(payload , process.env.JWT_SECRET,{expiresIn : '3d'})
    return token
}

//login user
const loginUser = async (req , res)=>{
    const {email , password} = req.body

    try {
        if(!email || !password){
            throw Error('Please fill all the fieldes')
        }

        const exist = await User.findOne({email})
        console.log(exist)
        if(!exist){
            throw Error('Incorrect email')
        }

        const passwordMatch = await bcrypt.compare(password, exist.password);
        console.log(passwordMatch)
        if (!passwordMatch) {
        throw new Error('Invalid password');
        }


        const payload = { userId: exist._id }
        const token = createToken(payload)

        res.status(200).json({userName : exist.userName , token : token})

    } catch (error) {
        res.status(500).json({error : error.message})
    }
};

//signup User

const signupUser = async (req , res)=>{
    const {userName , email , password , lotNumber , phoneNumber} = req.body
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
        const existeApr = await Appartement.findOne({lotNumber})

        if(!existeApr){
            throw Error ('This apartement is not exist')
        }

        const existAprUser = await User.findOne({lot : existeApr._id})

        if(existAprUser){
            throw Error(`The appartement is already for ${existAprUser.userName}`)
        }

        const salt = await bcrypt.genSalt(10)
        const hashPassword = await bcrypt.hash(password , salt)

        

        const data = await User.create({userName , email , password : hashPassword , lot : existeApr._id})
        const payload = { userId: data._id }
        const token = createToken(payload)
        
        res.status(201).json({userName : data.userName , token : token})
        
    } catch (error) {
        res.status(500).json({error : error.message})
    }
    
};


const getUser = async(req,res)=>{

    const {lotNumber} = req.params

    try {
        const apr = await Appartement.findOne({lotNumber})
        if(!apr){
            throw Error('appartement doesn\'n existe')
        }
        const userData = await User.findOne({lot : apr._id})
        res.status(200).json({userData})
    } catch (error) {
        res.status(400).json({error : error.message})
    }
}

module.exports = {
    loginUser, 
    signupUser,
    getUser
}