const userModel = require('../models/UserModel');

//login user
const loginUser = async (req , res)=>{
    res.json({mssg : 'login user'})
};

//signup User

const signupUser = async (req , res)=>{
    const {email , password} = req.body
    try{
        const user = userModel.signup(email , password);
        res.status(200).json({email , user})
    }catch(e){
        res.status(400).json({error : e.message})
    }
};

module.exports = {
    loginUser, 
    signupUser,
}