var oracledb = require("oracledb");
var express = require("express");

var app = express.Router();

var util = require("../util.js");
var oracle = require("../oracle.js");

app.get('/bbslist', function (req, resp) {
    console.log('/bbslist 접속 성공');
    console.log("session user_id:" + req.session.user_id);

    var dbconn = util.getConn();

    var sql = "SELECT * FROM BBS";

    dbconn.execute(sql, {}, {outFormat:oracledb.OBJECT}, function (err, result) {
        if(err){
            console.log("조회 실패");            
        } 

        console.log(result);

        str = JSON.stringify(result.rows);
        var json = JSON.parse(str);

        console.log(json);

        // bbslist.ejs
        resp.render('bbslist.ejs', 
                {   
                    user:req.session.user_id,     
                    data:json
                }
        );
    });
    
});


module.exports = app;