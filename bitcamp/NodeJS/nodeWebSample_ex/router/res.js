var express = require('express');
var app = express.Router();
var fs = require('fs');

app.get('/arrow', function (req, res) {
    fs.readFile(__dirname + '/../images/arrow.png', function (err, data) {
        if(err) console.log("등록중 에러가 발생했어요!!", err);          
        console.log(data);
        res.end(data);
    });
});

app.get('/style', function (req, res) {
    fs.readFile(__dirname + '/../css/style.css', function (err, data) {
        if(err) console.log("등록중 에러가 발생했어요!!", err);   
        console.log(data);
        res.end(data);
    });
});

module.exports = app;