var http = require("http");
var fs = require("fs");
var express = require("express");
// npm install ejs

var app = express();

var server = http.createServer(app);

// view를 설정
// 앞에 views는 폴더명과 달라도 되지만 뒤에 views는 폴더명과 같아야한다
app.set("views", __dirname + "/views");

// css
var myCss = {
    style:fs.readFileSync(__dirname + "/css/my.css", "utf-8")
};

app.get("/", function (req, resp) {

    // 어떤 짐을 가져가겠느냐
    resp.render("index.ejs",
                {
                    title:"제목입니다",
                    mycss: myCss
                }
    );

});

// 실제 웹 서버가 들어가는 것
server.listen(8800, function () {
    console.log("웹 서버 동작 중...");
});
