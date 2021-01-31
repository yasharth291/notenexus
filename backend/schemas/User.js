const mongoose = require('mongoose');

const UserSchema = mongoose.Schema({
    email: {
        type : String,
        required : true 
    },
    password:{
        type : String,
        required : true
    }
});

module.exports = UserSchema = mongoose.model('user',UserSchema);