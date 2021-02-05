const express = require('express');
const app = express();
const ConnectToDatabase = require('./config/connectToDatabase.ts');

ConnectToDatabase();

app.use(express.json({ extended: false }));

app.use("/api/users", require('./routes/users.ts'));

let PORT = process.env.PORT || 3000;

app.listen(PORT, () => 
    console.log(`the server is running on the port: ${PORT}`)
);

