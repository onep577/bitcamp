
var item1 = 'apple';

exports.item = item1;



var getName1 = function () {
    console.log(item1 + "입니다");
}
// 함수 내보내기
exports.getName = getName1;



var obj1 = {
    name : 'grape',
    price : 500,
    store : 'myMaket'
};
// object 내보내기
exports.obj = obj1;
