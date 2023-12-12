const Progress = require('../models/progressModel')
const cloudinary = require('cloudinary')

const createProgress = async(req,res)=>{
    const {image , descreption , progressType} = req.body
    try {
        if(!image || !progressType){
            throw Error('Please add the type of the progress')
        }
        const result = await cloudinary.uploader.uplaod({
            image : {
                folder :"processImages"
            }
        })
        const data = await Progress.create({image:{
            public_id : result.public_id,
            url : result.secure_url
        },descreption , progressType})
        res.status(201).json(data)

    } catch (error) {
        res.status(500).json({error : error.message})
    }
}


module.exports = createProgress