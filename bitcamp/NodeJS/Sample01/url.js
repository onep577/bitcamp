
console.log("url1.js");

var url1 = require('url');       // import에서 url을 불러와라 즉, import이다

var addr = 'http://localhost:8090/default.html?year=2019&month=11';

// parse 문자열 -> JSon, String리퀴? JSon -> 문자열
var q = url1.parse(addr, true);

console.log(q.host);
console.log(q.pathname);
console.log(q.search);

var qdata = q.query;            // Json 데이터가 object로 넘어온다
console.log( qdata );           
console.log( qdata.year );


