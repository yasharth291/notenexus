const mongooses = require('mongoose');

let Userschema = mongooses.Schema({
    email: {
        type : String,
        required : true 
    },
    password:{
        type : String,
        required : true
    },
    names:{
        type : String,
        required : true
    },
    college:{
        type : String,
        required : true
    }
});

module.exports = Userschema = mongooses.model('user',Userschema);