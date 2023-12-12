const mongoose = require('mongoose')

const progressSchema = new mongoose.Schema({
    image1:{
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
    }
})

const Progress = mongoose.model('progress', progressSchema)

module.exports = Progress