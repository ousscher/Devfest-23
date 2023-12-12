const Appartement = require('../models/appartement')

const aprPost= async(req ,res)=>{
    const {location , bloc , etage , lotNumber , typeAppartement} = req.body
    
    try {
        const data = await Appartement.create({location , bloc , etage , lotNumber , typeAppartement})
            res.status(201).json({data})
    } catch (error) {
        res.status(500).json(err)
    }
}

module.exports = aprPost