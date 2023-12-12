const User = require('../models/UserModel')
const Appartement = require('../models/appartement')

const admin = async(req,res,next)=>{
    const {rest , lotNumber } = req.body

    try {

        if(!rest || !lotNumber){
            throw Error('Please fill all the fields')
        }

        const apr_id = await Appartement.findOne({lotNumber})
        console.log(apr_id)

        if(!apr_id){
            throw Error('there is no lot with this number')
        }

        const user = await User.findOne({lot : apr_id._id})

        const data = await User.findByIdAndUpdate(user.id , {rest} , { new: true })

        res.status(200).json({data})
    } catch (error) {
        res.status(500).json({error : error.message})
    }

}

module.exports = admin