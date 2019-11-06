
/*
$("#btn").click(function)
onclick = "func()"

$("#btn").on("click", function () {
});

$(document).on("click", "#btn", function() {
});

*/


// on이라는 함수는 자동으로 호출된다
// process.on("exit", function () {
//     console.log("이벤트 발생");
// });

//process.exit();

/*
setTimeout(function () {
    console.log("5초후에 동작함");
    process.exit();
}, 5000);
*/


// 이벤트를 발생시킬 때 eventsEmitter가 감독한다
var events = require("events");
var eventsEmitter = new events.EventEmitter();  // 배포자


// // event handler 생성
// var myEventHandler = function () {
//     console.log("event 실행");
// };

// //myEventHandler();
// // 이벤트에 이벤트 핸들러를 할당
// eventsEmitter.on("myevent", myEventHandler);    // 세션과 비슷하다
// console.log("이벤트 핸들어를 할당");

// // 이벤트를 발생
// eventsEmitter.emit("myevent");



var connectHandler = function () {  // == eventsEmitter.on("connect", connectHandler);
    console.log("connectHandler 연결 성공1");   // 3

    eventsEmitter.emit("data_received");        // 4
}

// 등록
eventsEmitter.on("connect", connectHandler);    // 2

eventsEmitter.on("data_received", function () { // 5
    console.log("connectHandler 연결 성공2");
});

eventsEmitter.emit("connect");  // 1


