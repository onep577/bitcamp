/*
    MySQL, Mongo DB -> Node.js
    Oracle
*/

var oracledb = require("oracledb");

oracledb.getConnection({
    user:'hr',
    password:'hr',
    host:'localhost',
    database:'xe'
}, function (err, conn) {
    if(err){
        console.log("접속 실패", err);
        return;
    }
    //console.log("접속 성공!");

    conn.execute("select * from member", {}, {outFormat:oracledb.OBJECT}, function (err, result) {
        if(err) throw err;

        console.log("query read 성공");
        // 밑에 네개는 사용할 수 있지만 너무 불편하다
        console.log(result);
        console.log(result.rows);   // rows가 array로 넘어온다
        console.log(result.rows[0]);
        console.log(result.rows[0][0]);


        // outFormat:oracledb.OBJECT 추가후
        dataStr = JSON.stringify(result);
        console.log(dataStr);

        arrStr = JSON.stringify(result.rows);

        var arr = JSON.parse(arrStr);
        console.log(arr);

        console.log(arr[0].ID + ", " + arr[0].PWD);
    });
});

