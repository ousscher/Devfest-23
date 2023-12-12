const Appartement = require('../models/appartement')

const aprPost= async(req ,res)=>{
    const {location , bloc , etage , lotNumber , typeAppartement} = req.body
    
    try {

        if(!location || !bloc || !etage || !lotNumber || !typeAppartement){
            throw Error('Please fill all rhe fields')
        }

        const existeLot = await Appartement.findOne({lotNumber})

        if(existeLot){
            throw Error('There is another lot with this number')
        }
        const data = await Appartement.create({location , bloc , etage , lotNumber , typeAppartement})
            res.status(201).json({data})
    } catch (error) {
        res.status(500).json({error : error.message})
    }
}

module.exports = aprPost