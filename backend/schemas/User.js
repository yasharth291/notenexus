const mongoose = require('mongoose');

let UserSchema = mongoose.Schema({
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