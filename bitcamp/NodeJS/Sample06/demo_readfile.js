var http = require("http");
var fs = require("fs");

http.createServer(function (req, resp) {
    
    fs.readFile(__dirname + "/demo.html", function (err, data) {
        if(err) console.log(err);

        console.log("readfile success");
        
        if(req.method == 'GET'){
            resp.writeHead(200, {"Content-Type":"text/html; charset=utf-8"});
            resp.write( data );
            resp.end();
        }
    });

}).listen(8800);


