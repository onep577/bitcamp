<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>

결제창입니다<br>

<c:forEach begin="0" end="${fn:length(list) -1 }" step="1" varStatus="i">
ID : ${list[i.index].id }, PWD : ${list[i.index].pwd }
<br>
</c:forEach>

<br><br>

신용카드 : <input type="radio" name="payment" value="card"><br>
무통장입금 : <input type="radio" name="payment" value="vbank"><br>
카카오페이 : <input type="radio" name="payment" value="kakaopay"><br>
<!-- 실시간 계좌이체 : <input type="radio" name="payment" value="trans"><br> -->
휴대요금 결제 : <input type="radio" name="payment" value="phone"><br><br>
<input type="button" value="결제하기" onclick="paymens()"><br><br>


<script type="text/javascript">
function paymens(){
	var radioVal = $('input[name="payment"]:checked').val();
	//alert(radioVal);
	
	var IMP = window.IMP; // 생략가능
	IMP.init('imp50599923');  // 가맹점 식별 코드

	IMP.request_pay({
	    pg : 'html5_inicis',
	    pay_method : radioVal,
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : 150,
	    buyer_email : 'onep577@naver.com',
	    buyer_name : '구매자이름',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남대로 비트캠프',
	    buyer_postcode : '123-456'
	}, function(rsp) {
	    if ( rsp.success ) {
	        var msg = '결제가 완료되었습니다.';
	        msg += '\n고유ID : ' + rsp.imp_uid;
	        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	        msg += '\n결제 금액 : ' + rsp.paid_amount + '원';
	        msg += '\n카드 승인번호 : ' + rsp.apply_num;
	        msg += '\n결제상황 : ' + rsp.status;
	        msg += '\n결제수단 : ' + rsp.pay_method;
	        msg += '\n가상계좌 : ' + rsp.vbank_num;

	        location.href = '/payment/paymentAf?paid_amount='+rsp.paid_amount+'&imp_uid='+rsp.imp_uid
	        		+'&status='+rsp.status+'&pay_method='+rsp.pay_method+'&receipt_url='+rsp.receipt_url
	        		+'&vbank_num='+rsp.vbank_num+'&vbank_name='+rsp.vbank_name
	        		+'&vbank_date='+rsp.vbank_date+'&vbank_holder='+rsp.vbank_holder; //완료페이지로 이동

	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '\n에러내용 : ' + rsp.error_msg;
	    }

	    alert(msg);
	});
}

</script>






</body>
</html>