
var express = require("express");
var app = express();

app.get('/', function (req, res) {
    console.log('/ 접속 성공!');

    res.end('Hello Node js');
});

var listener = app.listen(8899, function () {
    console.log( listener.address().port );
});
