var oracledb = require("oracledb");
var express = require("express");

var app = express.Router();

var bodyParser = require("body-parser");

// session
var session = require('express-session');

var util = require("../util.js");
var oracle = require("../oracle.js");

app.use(bodyParser.urlencoded({extended:true}));

// session
app.use(session({
                    secret:'keyboard cat',  // 암호화
                    resave:false,
                    saveUninitialized:true   
}));

app.get('/', function (req, resp) {
   console.log("/ 접속 성공");
    
   resp.render('index.html');
});

app.get('/login', function (req, resp) {
    console.log("/login 접속 성공");

    resp.render('login.html');
});

app.get('/regi', function (req, resp) {
    console.log("/regi 접속 성공");

    resp.render('regi.html');
});

app.get('/idcheck', function (req, resp) {
    console.log("/idcheck 접속 성공");

    var id = req.query.id;  // get 방식
//    var id = req.body.id;   // post 방식
    console.log("id:" + id);

    var dbconn = util.getConn();
    dbconn.execute("select count(*) from member where id='" + id + "'", function (err, result) {
        if(err) console.log('에러발생');

        console.log('결과:' + result.rows);
        if(result.rows == 0){
            resp.send( { result:'OK' } );        
        }else{
            resp.send( { result:'NO' } );            
        }
    });
});

app.post('/regiAf', function (req, resp) {
    console.log('/regiAf 접속 성공');

    // parameter
    // req.query.id -> get
    // req.body.id -> post
    var id = req.body.id;
    var pwd = req.body.pwd;
    var name = req.body.name;
    var email = req.body.email;

    console.log(id + " " + pwd + " " + name + " " + email);

    // db insert
    var sql = " INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH) "
            + " VALUES('" + id + "','" + pwd + "','" + name + "','" + email + "', 3) ";
    var dbconn = util.getConn();

    dbconn.execute( sql, function (err, result) {
        if(err) console.log("등록 중 에러 발생!");
        
        console.log("등록 성공!");
    });

    // move
    resp.redirect('login');
});

app.post('/loginAf', function (req, resp) {
    console.log('/loginAf 접속 성공');
    
    var id = req.body.id;
    var pwd = req.body.pwd;

    console.log(id + " " + pwd);

    var dbconn = util.getConn();

    var sql = "SELECT ID, NAME, EMAIL, AUTH FROM MEMBER WHERE ID=:id AND PWD=:pwd";

    dbconn.execute(sql, [id, pwd], {outFormat:oracledb.OBJECT}, function (err, result) {
                    // {"ID":"aaa", }
        if(err){
            console.log("아이디나 패스워드가 틀렸습니다");            
        } 

        // 조사
        if(result.rows != 0){        

            json = JSON.stringify(result.rows[0]);
            console.log("json:" + json);

            var arr = JSON.parse(json);
            console.log("id:" + arr.ID);

            // session 저장
            req.session.user_id = arr.ID;
            console.log("session user_id:" + req.session.user_id);
            
            // bbslist 이동
            resp.redirect('bbslist');

        }else{
            // login 이동

        }
    });

});




module.exports = app;
