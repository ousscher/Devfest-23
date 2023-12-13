const mongoose = require('mongoose')

const FileSchema = new mongoose.Schema({
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
    lot : {
        type : mongoose.Schema.Types.ObjectId,
        ref :'Appartment'
    }
},{timestamps : true})

const FileSharing = mongoose.model('Paiment' , FileSchema)

module.exports = FileSharing