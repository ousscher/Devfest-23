const Paiment = require('../models/paimentModel')
const Appartement = require('../models/appartement')
const cloudinary = require('cloudinary')


const createPaiment = async(req , res)=>{
    const {image , deadline , payed , lotNumber} = req.body

    try {
        if(!image || !deadline  || !payed || !lotNumber){
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

        const data = await Paiment.create({image:{
            public_id : result.public_id,
            url : result.secure_url
        } , deadline , payed , lot : existeApr._id})
        res.status(201).json({data})

    } catch (error) {
        res.status(500).json({error : error.message})
    }

}

const getPaiment = async(req,res)=>{
    const{lotNumber} = req.params
    try {
        const apr = await Appartement.findOne({lotNumber})
        if(!apr){
            throw Error('appartement doesn\'n existe')
        }
        const paimentData = await Paiment.findOne({lot : apr._id})
        res.status(200).json({paimentData})
    } catch (error) {
        res.status(500).json({error : error.message})
    }
}

module.exports = {createPaiment , getPaiment}