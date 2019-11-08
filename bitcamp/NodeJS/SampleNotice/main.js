var http = require("http");
var express = require("express");
var fs = require("fs");
var oracledb = require("oracledb");
var ejs = require("ejs");

// 우리가 언제든 사용 할 수 있도록 app으로 넘겨받는다
var app = express();

// 이걸 안하면 auto commit이 안된다
oracledb.autoCommit = true;

// 서버 생성
var server = http.createServer(app);

// db가 컨넥션 된 인스턴스값이 필요하다
var dbconn;

// Parameter ??
var bodyParser = require("body-parser");
app.use(bodyParser.urlencoded( {extended:true} ));

// db connection
oracledb.getConnection({
   user:'hr',
   password:'hr',
   host:'localhost',
   database:'xe'
}, function (err, conn) {
    if(err) console.log("접속 실패" + err);

    console.log("DB 접속 성공");
    // dbconn은 외부에서 쓰기 위해
    dbconn = conn;
});

// data를 던져주기만 한다
app.get("/", function (req, resp) {
    
    fs.readFile(__dirname + "/writeForm.html", function (err, data) {
        // data를 client로 던져준다
        console.log("/writeForm.html 접속 성공");

        resp.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
        resp.write(data);
        resp.end();
    });

});

// data를 던져주기만 한다
app.post("/regist", function (req, resp) {
    console.log("/regist 접속 성공");

    // parameter -> data 수집
    // 다른 접근 방법도 있다. 이렇게 접근할 때는 var bodyParser 부분 두줄이 꼭 설정 되어있어야 한다
    // req.body.값 값은 name으로 넘어온다
    var writer = req.body.writer;
    var title = req.body.title;
    var content = req.body.content;
    console.log("writer : " + writer);
    console.log("title : " + title);
    console.log("content : " + content);
    
    // DB insert
    // ''를 꼭 붙여주자. preparsedStatement 처럼 자동 ''가 안되니 꼭 해야한다
    dbconn.execute("INSERT INTO NOTICE(WRITER, TITLE, CONTENT) VALUES('"+writer+ "','" + title + "','" + content +"')",
                    function (err, result) {
                        if(err) {
                            console.log("등록 중 에러 발생" + err);
                        }
                        else{
                            // auto commit이라서 자동으로 db에 들어갔다
                            console.log("등록 성공");
                            // 이동
                            // controller에서 controller로 이동할 때 처럼 하지만 여기서는 정확히 controller는 아니다
                            resp.redirect("noticelist");
                        }
                    }
                );

});

// data를 던져주기만 한다
app.get("/noticelist", function (req, resp) {
    console.log("/noticelist 접속 성공");

    // db에서 산출
    // {outFormat:oracledb.OBJECT} 여기서 json 데이터가 넘어온다
    dbconn.execute("SELECT * FROM NOTICE", {}, {outFormat:oracledb.OBJECT}, function (err, result) {
        if(err) console.log("조회 실패 : " + err);

        console.log(result);
        console.log(result.rows);

        // 문자열로 바꿔주는 것
        json = JSON.stringify(result.rows);
        // json으로 바꿔주는 것
        var arr = JSON.parse(json);

        console.log(arr);

        fs.readFile(__dirname + "/noticelist.ejs", "utf-8", function (err, data) {
            // 이 파일을 넘겨줄 때 데이터를 가지고 간다
            if(err) console.log("읽기 실패 : " + err);
            resp.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});

            // render는 파일명과 한꺼번에 넘길 때, end는 fs.readFile에서 넘길 때
            // 둘 다 addAttribute? 결과 값은 똑같은 때 넘기는 과정은 다르다
            resp.end(ejs.render(data, { list:arr }));
        });
    });

});

// detail
app.get("/detail/:writer", function (req, resp) {
    console.log("/detail 접속 성공");
    var writer = req.params.writer;
    console.log("writer : " + writer);

    fs.readFile('detail.html', 'utf-8', function (error, data) {
        dbconn.execute('select * from products where writer = ?', [req.params.writer], function (error, result) {
            console.log("result : " + result);
            //resp.send(ejs.render(data, {
            //    data: result[0]
            //}))
        })
    });

    // db에서 산출
//    dbconn.execute("SELECT * FROM NOTICE WHERE WRITER=?", [writer], function (err, result) {
        //if(err) console.log("조회 실패 : " + err);

        //console.log(result);
        //console.log(result.rows);

        // // 문자열로 바꿔주는 것
        // json = JSON.stringify(result.rows);
        // // json으로 바꿔주는 것
        // var arr = JSON.parse(json);

        // console.log(arr);

        //  fs.readFile(__dirname + "/detail.html", "utf-8", function (err, data) {
        //      // 이 파일을 넘겨줄 때 데이터를 가지고 간다
        //      if(err) console.log("읽기 실패 : " + err);
        //      resp.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});

        //      // render는 파일명과 한꺼번에 넘길 때, end는 fs.readFile에서 넘길 때
        //      // 둘 다 addAttribute? 결과 값은 똑같은 때 넘기는 과정은 다르다
        //      resp.end(ejs.render(data, { list:arr }));
        //  });
//    });

});

// 수정
// update
app.get("/update/:writer", function (req, resp) {
    console.log("/update 접속 성공");
    var writer = req.params.writer;
    console.log("writer : " + writer);
});

// 삭제
// delete
app.get("/delete/:writer", function (req, resp) {
    console.log("/delete 접속 성공");
    var writer = req.params.writer;
    console.log("writer : " + writer);
});

// 서버 리스너
server.listen(8800, function () {
    console.log("웹 서버 실행중...");
});
