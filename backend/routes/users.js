const express = require("express");
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const { check,validationResult } = require('express-validator');
const UserSchema = require('../schemas/User');
const User = require("../schemas/User");


router.post(
    '/signup',
    [
        check('email','E-mail is required').isEmail(),
        check('password','Password is required').not().isEmpty(),
    ],
    async (req,res) => {
        try{
            const { email,password } = req.body;
            let user = await UserSchema.findOne({email : email});
            const errors = validationResult(req);
            if(!errors.isEmpty())
            {
                return res.status(401).json({errors : errors.array()});
            }

            if(user){
                return res.status(401).json({ msg : "There "})
            }

            user = new UserSchema({
                email,
                password
             });

            res.send('its is send');
        } catch (error){
            console.log(error.message);
            return res.status(500).json({ msg : "Server Error....."});
        }
    }
)

module.exports = router;