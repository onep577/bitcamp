var http = require("http");
var fs = require("fs");
var express = require("express");

var app = express();

var server = http.createServer(app);

server.listen(8800, function () {
    console.log("웹 서버 가동중");
});

// / 접근지정자면 여기로 오라
app.get("/", function (req, res) {
    console.log("/ 접속 성공!");

    fs.readFile(__dirname + "/index.html", function (err, data) {

    res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
    res.write( data );
    res.end();

    });

});

// /main 접근지정자면 여기로 오라
app.get("/main", function (req, res) {
    console.log("/main 접속 성공!");

    fs.readFile(__dirname + "/main.html", function (err, data) {

    res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
    res.write( data );
    res.end();

    });
});
