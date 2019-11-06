
// 파일 입출력
var fs = require("fs");

// 현재 작업하는 파일의 경로
console.log(__dirname);
// "test.txt"만 적는다면 기본 위치는 E:\NodeSamples 이다 왜? launch.json에 "cwd":"${workspaceFolder}" 라고 적어서

// write file
// callback 이걸 수행한 뒤 자동적으로 돌아오는 값 만약 callback이 있다면 함수일 가능성이 크다
// 첫번째 - 현재 폴더에 생성 (하지만 하나 하나 경로를 적어줘야하는 번거로움 ...),
// fs.writeFile("./test.txt", "테스트 테스트", function (err) {
// 두번째 - 현재 작업하는 위치를 붙인다
// fs.writeFile(__dirname + "/test.txt", "테스트 테스트", function (err) {
//     // 파일로 읽어들여 만든다
//     // writeFile은 없으면 만든다 readFile은 없으면 없는데로...
//     if(err) return console.error(err);

//     console.log("파일 생성 기입 성공");
// });


//append file
// fs.appendFile(__dirname + "/test.txt", ", 추가 문자열", function (err) {
//     if(err) return console.error(err);

//     console.log("추가 기입 성공");
// });

// // read file
// var fdata = fs.readFileSync(__dirname + "/test.txt");
// console.log( fdata.toString() );

// // read file
// // options에 encoding이 있다 맞춰줘야 하는 경우가 많다
// var fdata1 = fs.readFile(__dirname + "/test.txt", 'utf-8', function (err, datas) {
//     if(err) return console.error(err);

//     console.log( datas );
// });

// delete file
// fs.unlink(__dirname + "/test.txt", function (err) {
//     if(err) return console.error(err);

//     console.log("파일을 삭제하였습니다");
// });
