// oracle.js

var oracledb = require('oracledb');
var util = require("./util.js");

oracledb.autoCommit = true;

oracledb.getConnection({
    user:'hr',
    password:'hr',
    host:'localhost',
    database:'xe'
}, function (err, conn) {
    if(err) console.log('접속실패 ' + err);

    console.log('접속성공');

    util.setConn(conn);
});