// allows the read of the variables.env file using the require of "dotenv" dependency
require('dotenv').config({path:'variables.env'});

const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');// serve to change the format of the body request

const routes = require('./routes');
const server = express();
server.use(cors());
server.use(bodyParser.urlencoded({extended:false}));

server.use('/api', routes);

server.listen(process.env.PORT, ()=> {
    console.log(`servidor rodando em http://localhost:${process.env.PORT}`);
});