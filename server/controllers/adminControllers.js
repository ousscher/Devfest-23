const User = require('../models/UserModel');
const Appartement = require('../models/appartement');

const admin = async (req, res, next) => {
    const { payed, lotNumber } = req.body;

    try {
        if (!payed || !lotNumber) {
            throw Error('Please fill all the fields');
        }

        const apr = await Appartement.findOne({ lotNumber });

        if (!apr) {
            throw Error('There is no lot with this number');
        }

        const user = await User.findOne({ lot: apr._id });

        if (!user) {
            throw Error('User not found for the given lot');
        }

        // Push the payment to the array
        user.paiment.push(payed);

        // Save the updated document
        let data = await user.save();
        const somme = user.paiment.reduce((somme, currentValue) => {
            return somme + currentValue;
        }, 0);
        const rest = apr.price - somme

        data = await User.findOneAndUpdate({email : user.email}, {rest}, { new: true })
        

        res.status(200).json({ data });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
};

module.exports = admin;
