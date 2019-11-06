var http = require('http');
var dt = require('./myModule.js');

http.createServer(function (req, res) {
    
    console.log('Server running http://127.0.0.1:8890');

    res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
    res.write('현재 날짜와 시간:'+ dt.myDateTime());
    res.end('hello node js');

}).listen(8890, '127.0.0.1');