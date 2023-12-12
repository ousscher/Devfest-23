const User = require('../models/UserModel')
const Appartement = require('../models/appartement')

const admin = async(req,res,next)=>{
    const {rest , lotNumber } = req.body

    try {

        if(!rest || !lotNumber){
            throw Error('Please fill all the fields')
        }

        const apr_id = await Appartement.findOne({lotNumber})

        const user_id = await User.findOne({lot : apr_id._id})

        const data = await User.findByIdAndUpdate(user_id.id , {rest} , { new: true })

        res.status(200).json({data})
    } catch (err) {
        res.status(500).json({err})
    }

}

module.exports = admin