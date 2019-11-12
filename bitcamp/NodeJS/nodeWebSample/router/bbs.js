// 스탠다드
var oracledb = require("oracledb");
var express = require("express");

// express가 상호간에 연결 되었다
var app = express.Router();

// 사용자
// 현재 위치는 member.js 한칸 나가서 util.js를 찾자
var util = require("../util.js");
var oracle = require("../oracle.js");



// bbslist
app.get("/bbslist", function (req, resp) {
    console.log("/bbslist 접속 성공");

    // 세션 접근 여부 확인
    console.log("session user_id : " + req.session.user_id);

    var dbconn = util.getConn();

    var sql = "SELECT * FROM BBS";

    dbconn.execute(sql, {}, {outFormat:oracledb.OBJECT}, function (err, result) {
        if(err) { console.log("조회 실패"); }

        str = JSON.stringify(result.rows);
        var json = JSON.parse(str);

        console.log("1 : " + result.rows);
        console.log("2 : " + result.rows[0]);
        console.log("3 : " + result.rows[0].ID);

        // bbslist.ejs
        resp.render("bbslist.ejs");
    });


});


// 외부로 내보내기
module.exports = app;