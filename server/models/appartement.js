const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const bcrypt = require('bcrypt')

const appartementSchema = new Schema({
    location : {
        type : String , 
        required : true,
    }, 
    bloc : {
        type : Integer , 
        required : true, 
    } ,
    etage : {
        type : Integer , 
        required : true, 
    } ,
    lotNumber : {
        type : Integer , 
        required : true, 
    },
    typeAppartement : {
        type : String , 
        required : true, 
    } , 
});

const Appartment = mongoose.model('Appartement' , appartementSchema);
module.exports = Appartment;
