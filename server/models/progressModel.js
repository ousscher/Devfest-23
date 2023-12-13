const mongoose = require('mongoose')

const progressSchema = new mongoose.Schema({
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
    descreption:{
        type:String
    },
    progressType : {
        type : String , 
        required : true
    },
    lot :{
        type : mongoose.Schema.Types.ObjectId,
        ref : 'Appartement'
    }
},{timestamps : true})

const Progress = mongoose.model('progress', progressSchema)

module.exports = Progress