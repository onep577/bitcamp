// oracle.js

// 모듈명이 oracledb라서 그냥 변수명이 똑같이 했다
var oracledb = require("oracledb");
// util이란 모듈을 불러왔다. 접근이 어디서나 될 수 있도록 하는 작업이다
var util = require("./util.js");

oracledb.autoCommit = true;

oracledb.getConnection({
    user:'hr',
    password:'hr',
    host:'localhost',
    database:'xe'
}, function (err, conn){
    // 우리의 목적은 conn을 웹으로 가지고 가는 것이다
    if(err) console.log("접속 실패 : " + err);
    console.log("접속 성공");

    util.setConn(conn);
});

