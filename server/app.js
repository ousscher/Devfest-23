require('dotenv').config();
const express = require ('express');
const mongoose = require('mongoose');
const app = express();
const connectDB = require('./models/activate')
const aprRouter = require('./routes/appartementRoute')
const adminRouter = require('./routes/adminRouter')
const progressRouter = require('./routes/progressRouter')
const paimentRouter = require('./routes/paimentRouter')
const getRouters = require('./routes/getRouters')
// const workoutRoutes = require('./routes/workouts');
const userRoutes = require('./routes/user')
const cors = require('cors');


app.use(cors()); // Active CORS pour toutes les routes

app.use(express.json());


app.use((req , res , next)=>{
    console.log(req.path , req.method);
    next();
});


//routes
app.use('/api/user' ,userRoutes )
app.use('/api/apartement' , aprRouter)
app.use('/api/admin' , adminRouter)
app.use('/api/progress' , progressRouter)
app.use('/api/paiment' , paimentRouter)
app.use('/api/get' , getRouters)



const start = ()=>{
    connectDB(process.env.MONGO_URI)
    .then(()=>{
            app.listen(process.env.PORT , ()=>{
                console.log("connect to db and listening on port ${process.env.PORT}");
            });
        })
    .catch((err)=>{
        console.log(err);
    })
}
start();
//listening for requests
