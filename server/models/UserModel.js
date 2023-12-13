const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const bcrypt = require('bcrypt')


const userSchema = new Schema({
    email : {
        type : String , 
        required : true,
    }, 
    password : {
        type : String , 
        required : true, 
    } ,
    userName : {
        type : String , 
        required : true, 
    } , 
    lot : {
        type : mongoose.Schema.Types.ObjectId,

        ref : 'Appartement'
    },
    paiment : {
        type : Array
    },
    phoneNumber : {
        type : String
    },
    rest : {
        type : Number
    }
});

module.exports = mongoose.model( 'User', userSchema);