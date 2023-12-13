const Progress = require('../models/progressModel')
const cloudinary = require('cloudinary')

const createProgress = async(req,res)=>{
    const {image , descreption , progressType , lotNumber} = req.body
    try {
        if(!image || !progressType){
            throw Error('Please add the type of the progress')
        }
        const existeApr = await Appartement.findOne({lotNumber})

        if(!existeApr){
            throw Error ('There is no appartement with this number')
        }
        const result = await cloudinary.uploader.uplaod({
            image : {
                folder :"processImages"
            }
        })
        const data = await Progress.create({image:{
            public_id : result.public_id,
            url : result.secure_url
        },descreption , progressType ,lot : existeApr._id})
        res.status(201).json(data)

    } catch (error) {
        res.status(500).json({error : error.message})
    }
}

const getProgress = async(req,res)=>{
    const{lotNumber} = req.params
    try {
        const apr = await Appartement.findOne({lotNumber})
        if(!apr){
            throw Error('appartement doesn\'n existe')
        }
        const progressData = await Progress.findOne({lot : apr._id})
        res.status(200).json({progressData})
    } catch (error) {
        res.status(500).json({error : error.message})
    }
}


module.exports = {createProgress , getProgress}