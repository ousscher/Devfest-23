const FileSharing = require('../models/paimentModel')
const Appartement = require('../models/appartement')
const cloudinary = require('cloudinary')


const createFile = async(req , res)=>{
    const {image , lotNumber} = req.body

    try {
        if(!image || !lotNumber){
            throw Error('Please fill All the filed')
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

        const data = await FileSharing.create({image:{
            public_id : result.public_id,
            url : result.secure_url
        } , lot : existeApr._id})
        res.status(201).json({data})

    } catch (error) {
        res.status(500).json({error : error.message})
    }

}

const getFile = async(req,res)=>{
    const{lotNumber} = req.params
    try {
        const apr = await Appartement.findOne({lotNumber})
        if(!apr){
            throw Error('appartement doesn\'n existe')
        }
        const fileData = await FileSharing.findOne({lot : apr._id})
        res.status(200).json({fileData})
    } catch (error) {
        res.status(500).json({error : error.message})
    }
}

module.exports = {createFile , getFile}