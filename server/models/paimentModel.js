const mongoose = require('mongoose')

const PaimentSchema = new mongoose.Schema({
    image:{
        public_id:{
            type : String,
            required : true,
        },
        url:{
            type : String,
            required : true,
        }
    },
    deadline : {
        type : Date,
        required : true
    },
    payed : {
        type : Date,
        required : true
    },
    lot : {
        type : mongoose.Schema.Types.ObjectId,
        ref :'Appartment'
    }
},{timestamps : true})

const Paiment = mongoose.model('Paiment' , PaimentSchema)

module.exports = Paiment