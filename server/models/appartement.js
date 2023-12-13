const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const bcrypt = require('bcrypt')

const appartementSchema = new Schema({
    location: {
        type: String,
        required: true,
    },

    bloc: {
        type: Number,
        required: true,
    },
    etage: {
        type: Number,
        required: true,
    },
    lotNumber: {
        type: Number,
        required: true,
    },
    typeAppartement: {
        type: String,
        required: true,
    },
    price : {
        type : Number ,
        required : true
    }
});

const Appartment = mongoose.model('appartement', appartementSchema);
module.exports = Appartment;
