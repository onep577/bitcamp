var http = require('http');

// web server create
var server = http.createServer();

// port set == binding
// web server start
var port = 8800;
server.listen(port, function () {
    console.log("server start : %d", port);
});

// client connection event process
server.on("connection", function (socket) {
    // 네트워크를 하면 socket를 벗어날 수 없다. 웹도 네트워크다. 감춰져 있을 뿐
    var addr = socket.address();
    console.log("client connect : %s, %d", addr.address, addr.port);
});

// // client request event process
server.on("request", function (req, resp) {
    console.log("클라이언트 요청이 들어왔습니다");

    resp.writeHead(200, {"Content-Type":"text/html; charset=utf-8"});
    resp.write("<!DOCTYPE html>");
    resp.write("<html>");

    resp.write("<head>");
    resp.write("<title>응답 페이지</title>");
    resp.write("</head>");

    resp.write("<body>");
    resp.write("<h3>Server로부터 응답입니다</h3>");
    resp.write("</body>");
    
    resp.write("</html>");

});


