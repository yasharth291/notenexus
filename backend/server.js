const express = require('express');
const app = express();
const connectToDatabase = require('./config/connectToDatabase');

connectToDatabase();

app.use(express.json({ extended: false }));

app.use("/api/users", require('./routes/users'));

let PORT = process.env.PORT || 3000;

app.listen(PORT, () => 
    console.log(`the server is running on the port: ${PORT}`)
);

