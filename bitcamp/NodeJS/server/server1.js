
/*
    Javascript : JQuery, React, Vue (서버하고 연관이 없다) - 200

    node.js : 독립체 server + client

    python : Django(Web), AI, Bigdata(통계) - R
    자바스크립트 계열에서 완전한 독립체가 python이다
    파이썬에서 웹을 하기 위한 것이 장고이다
    R이 node.js, python과 비슷하다

    hadoop : 데이터 수집 -> 리눅스
    하둑은 리눅스에서 돈다 리눅스 환경이면 윈도우 환경이긴 하지만 콘솔이다
    속도는 빠르나 사용하기 쉽지 않다

    Spring framework(JSP) -> server == tomcat
*/

var http = require("http");     // import
// HyperText Transfer Protocol

var uc = require("upper-case");
// 이대로 디버그하면 에러난다. 터미널로 가서 명령어 입력
// 일반 모듈인 경우 npm install upper-case

// http, uc는 모듈에 대한 변수 또는 별명
// node.js - npm install 모듈명

// server -> binding(아이피, 포트넘버 설정) -> listen
http.createServer(function (req, res) {
    res.writeHead(200, {'Content-Type':'text/html; charset=utf-8' });
    res.write(uc('good morning'));
    // good morning에 문자열이 잔뜩 들어가서 나중에서 감당 못한다
    res.end();
}).listen(8899);

