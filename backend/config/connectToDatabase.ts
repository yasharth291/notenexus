const mongoose = require('mongoose');
const config = require('config');

const connectToDatabase = async () => {
    try{
        await mongoose.connect(
            config.get('mongoURI'),
            {
                useCreateIndex: true,
                useUnifiedTopology: true,
                useFindAndModify: true,
                useNewUrlParser: true
            }
        )
        console.log("MongoDB is connected");
    } catch(error){
        console.log(error);
        process.exit(1);
    }
}

module.exports = connectToDatabase;