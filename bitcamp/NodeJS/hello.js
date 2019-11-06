/*
    JSP : server(jsp, model) <--> client(html, JS, JQuery, Vue, react)

    client -> server -> client
    클라이언트 코드에서 서버 코드(controller)로 접근 하려고 하면 불가능하다 (유일한 것은 Ajax이다)
    Ajax -> Restful (100%) -> ResponseBody

    @RestController라고 붙이면 그 순간 Ajax만 받는 컨트롤러가 된다 @ResponseBody를 안 붙여도 된다

    Restful방식의 장점. 넘겨주는 방식을 알면 뷰는 분리해서 만들 수 있다
    조각 조각 분업화 시킬 때 좋은 것이 Restful이다

    client --> server
    server --> client
    즉, client(server)
    즉, 서버를 클라이언트에서 제작한다 (서버에서 클라이언트 코드 제작한 것이 servlet이다. servlet에서 문자열로 클라이언트 코드 작성했을 때)
    외부 서버를 붙일 수 있지만 여기서는 우리 서버를 작성한다

*/

console.log("안녕하세요");

var a = 10;
var str = "롤로노아 조로";

console.log(str);
console.log("a = " + a);
console.log("a = %d", a);
console.log("==============================");

var Person = {}

Person['age'] = 25;
Person['name'] = '홍길동';
Person.mobile = '010-111-1111';

console.log("나이 : %d", Person.age);
console.log("나이 : %d", Person['age']);
console.log("이름 : %s", Person.name);
console.log("이름 : %s", Person['name']);
console.log("전화번호 : %s", Person.mobile);
console.log("전화번호 : %s", Person['mobile']);
console.log("==============================");

function mul(a, b){
    return a * b;
}

var c = mul(10, 20);
console.log("%d * %d = %d", 10, 20, c);
console.log("==============================");

var Human = {
    age : 24,
    name : '일지매',
    multi : function(a, b) {
        return a * b;
    }
};

// 여기서 인스턴스는 Human이다
console.log("이름 : " + Human.name);
console.log("곱셈 : %d", Human.multi(3, 4));

Human.age = 25;
console.log("나이 : %d", Human.age);
console.log("==============================");

var Users = [
    { name:'빈스모크 상디', age:'44' },
    { name:'몽키 D 루피', age:'20' }
]

console.log("첫번째 : %s %d", Users[0].name, Users[0].age);
console.log("두번째 : %s %d", Users[1].name, Users[1].age);

// Json에 데이터 추가 push.
// Json 데이터는 읽기 전용으로 많이 사용해서 추가를 많이 하진 않지만 알아두자
Users.push( { name:'니코 로빈', age:17 } );
console.log("두번째 : %s %d", Users[2].name, Users[2].age);

// 함수 추가
var func = function name(a, b) {
    return a + b;
}
Users.push(func);

console.log("함수호출 : %d", Users[3](11, 2));

// 요소(element) 수
console.log("요소 수 : " + Users.length);










