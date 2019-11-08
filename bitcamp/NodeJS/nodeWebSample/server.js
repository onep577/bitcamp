// server.js

var express = require("express");
var app = express();

// 사용자 모듈 추가
// member.js - controller역할
var member = require("./router/member.js");
// bbs.js
var bbs = require("./router/bbs.js");

// app.use( 모듈명 );
app.use(member);
app.use(bbs);

// views 등록
app.set("views", __dirname + "/views");

// ejs 사용 선언(세팅)
app.set("view engine", "ejs");
app.engine("html", require("ejs").renderFile);

// listener를 통해서 app을 통해서 즉, express로 동작하겠다
var server = app.listen(8800, function () {
    console.log("server start port number 8800");
});
