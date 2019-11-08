var oracledb = require("oracledb");
var express = require("express");

// express가 상호간에 연결 되었다
var app = express.Router();

// 파싱한다
var bodyParser = require("body-parser");

// session
var session = require("express-session");

// 현재 위치는 member.js 한칸 나가서 util.js를 찾자
var util = require("../util.js");
var oracle = require("../oracle.js");

// 파라미터 쓰기 위해 설정
app.use(bodyParser.urlencoded({extended:true}));

// session
app.use(session({
    secret:'keyboard cat',  // 세션 암호화 설정
    resave:false,
    saveUninitialized:true
}));

app.get("/", function (req, resp) {
    console.log("/ 접속 성공");

    // 여기서 던져줘야 한다 파일의 String을 던져줬는데 더 간단한 방법이 있다
    // 화면에 index.html 파일을 던져줬다
    resp.render("index.html");
});

// 로그인 창으로 이동
app.get("/login", function (req, resp) {
    console.log("/login 접속 성공");

    resp.render("login.html");
});

// 회원가입 창으로 이동
app.get("/regi", function (req, resp) {
    console.log("/regi 접속 성공");

    resp.render("regi.html");
});

// ajax id 중복확인
app.get("/idcheck", function (req, resp) {
    // console.log("/idcheck 접속 성공");

    // get방식으로 받을 때 query로 받는다, post방식은 body로 받는다
    var idcheck = req.query.id;
    console.log("id : " + idcheck);

    conn = util.getConn();

    conn.execute("SELECT COUNT(*) FROM MEMBER WHERE ID='" + idcheck + "' ",
                     function(err, result){
                        if(err){
                            console.log("ajax 도중 에러 발생 : " + err);
                        }else{
                            // result는 json으로 온다
                            console.log("ajax 성공 결과 : " + result.rows);
                            if(result.rows == 0){
                                resp.send( { result: 'OK' } );
                            }else if(result.rows == 1){
                                resp.send( { result: 'NO' } );
                            }
                        }
                    }
                );
    // ajax는 뷰를 넘겨주지 않는다
    // resp.render("regi.html");
});

// 회원가입 창으로 이동
app.post("/regiAf", function (req, resp) {
    console.log("/regiAf 접속 성공");

    conn = util.getConn();

    // post방식 -> req.body.id, get방식 -> req.query.id
    var id = req.body.id;
    var pwd = req.body.pwd;
    var name = req.body.name;
    var email = req.body.email;
    var auth = req.body.auth;

    conn.execute("INSERT INTO MEMBER(ID, PWD, NAME, EMAIL, AUTH) VALUES('"+id+ "','" + pwd + "','" + name + "','" + email + "'," + auth+")",
                    function(err, data){
                        if(err){
                            console.log("등록 도중 에러방생");
                        }else{
                            console.log("등록 성공");
                        }
                    }
                );
    resp.render("login.html");
});

// 로그인 후 리스트로 이동
app.post("/loginAf", function (req, resp) {
    console.log("/loginAf 접속 성공");
    
    var id = req.body.id;
    var pwd = req.body.pwd;

    console.log("id : " + id + ", pwd : " + pwd);

    conn = util.getConn();

    // 게시판으로 가는데 왜 member를 꺼내나? session에 넣어서 언제든지 꺼내 쓰기 위해
    var sql = "SELECT ID, NAME, EMAIL, AUTH FROM MEMBER WHERE ID=:id AND PWD=:pwd";

    // [id, pwd] 배열로 들어간다
    conn.execute(sql, [id, pwd], {outFormat:oracledb.OBJECT}, function (err, result) {
        // {"ID":"aaa", "PWD":"pwd", "NAME":"name", "EMAIL":"email", "AUTH":"auth" }
        if(err) { console.log("아이디나 패스워드가 틀렸습니다"); }

        // 조사
        if(result.rows != 0){
            json = JSON.stringify(result.rows[0]);
            console.log("json : " + json);

            var arr = JSON.parse(json);
            // arr.id하면 undefined나온다 꼭 대문자로 쓰자
            console.log("id : " + arr.ID);
            
            // session 저장
            // user_id는 마음대로 정했다. 둘 다 된다
            //req.session.user_id = req.body.id;
            req.session.user_id = arr.ID;
            console.log("session user_id : " + req.session.user_id);
            
            // bbslist로 이동
            resp.redirect("bbslist");
        }else{
            // login으로 이동
            resp.render("login.html");
        }

    });

});





// 외부로 내보내기
module.exports = app;
