// server.js

var express = require('express');
var app = express();

// 사용자 모듈 추가
// member.js
var member = require('./router/member.js');
// bbs.js
var bbs = require('./router/bbs.js');

/////////////////////////////////////
var res = require('./router/res.js');
/////////////////////////////////////

// app.use( 모듈명 );
app.use(member);
app.use(bbs);

/////////////////
app.use(res);
/////////////////

// views 등록
app.set('views', __dirname + '/views');

// ejs 사용 선언
app.set('view engine', 'ejs');
app.engine('html', require('ejs').renderFile);

var server = app.listen(8000, function () {
   console.log("server start port number 8000"); 
});






