require('dotenv').config();
const express = require ('express');
const mongoose = require('mongoose');
const app = express();
const connectDB = require('./models/activate')
// const workoutRoutes = require('./routes/workouts');
const userRoutes = require('./routes/user')

app.use(express.json());

app.use((req , res , next)=>{
    console.log(req.path , req.method);
    next();
});

//routes
app.use('/api/user' ,userRoutes );
const start = ()=>{
    connectDB(process.env.MONGO_URI)
    .then(()=>{
            app.listen(process.env.PORT , ()=>{
                console.log('connect to db and listening on port  4000');
            });
        })
    .catch((err)=>{
        console.log(err);
    })
}
start();
//listening for requests
