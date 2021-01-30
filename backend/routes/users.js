const express = require("express");
const router = express.Router();
const jwt = require('jsonwebtoken');
const bcryptjs = require('bcryptjs');
const { check,validationResult } = require('express-validator');

router.post(
    '/signup',
    [
        check('email','E-mail is required').isEmail(),
        check('password','Password is required').not.isEmpty()
    ],
    async (req,res) => {
        try{
            const { email,password } = req.body;
            const error = validationResult(req);
            if(errors.isEmpty())
            {
                
            }
        } catch (error){
            console.log(error.message);
            return res.status(500).json({ msg : "Server Error....."});
        }
    }
)

module.exports = router;