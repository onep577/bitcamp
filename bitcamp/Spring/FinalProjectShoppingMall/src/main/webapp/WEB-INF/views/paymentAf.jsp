<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// 결제금액
String paid_amount = request.getParameter("paid_amount");
// 아임포트 거래 고유 번호
String imp_uid = request.getParameter("imp_uid");
// 결제상태
String status = request.getParameter("status");
// 결제수단
String pay_method = request.getParameter("pay_method");
// 거래 매출 전표
String receipt_url = request.getParameter("receipt_url");



String vbank_num = "";
String vbank_date = "";
String vbank_holder = "";
String vbank_name = "";

if(!request.getParameter("vbank_num").equals("undefined")){
	// 가상계좌
	vbank_num = request.getParameter("vbank_num");
	// 가상계좌 입금기한
	vbank_date = request.getParameter("vbank_date");
	// 가상계좌 예금주
	vbank_holder = request.getParameter("vbank_holder");
	// 가상계좌 은행명
	vbank_name = request.getParameter("vbank_name");
}
request.setAttribute("vbank_num", vbank_num);
request.setAttribute("receipt_url", receipt_url);

// 결제 상태를 알기 쉽게 바꾸기
if(status.equals("ready")){
	status = "미결제";
}else if(status.equals("paid")){
	status = "결제완료";
}else if(status.equals("cancelled")){
	status = "결제취소, 부분취소포함";
}else if(status.equals("failed")){
	status = "결제실패";
}

// 결제수단을 알기 쉽게 바꾸기
if(pay_method.equals("card")){
	pay_method = "신용카드";
}else if(pay_method.equals("trans")){
	pay_method = "실시간계좌이체";
}else if(pay_method.equals("vbank")){
	pay_method = "무통장입금";
}else if(pay_method.equals("phone")){
	pay_method = "휴대폰소액결제";
}else if(pay_method.equals("point")){
	pay_method = "카카오페이";
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

결제 완료창입니다<br><br>

결제금액 : <%=paid_amount %>원<br>
결제고유번호 : <%=imp_uid %><br>
결제상태 : <%=status %><br>
결제수단 : <%=pay_method %><br>
<a href="${receipt_url }">매출전표</a><br><br>

<c:if test="${fn:length(vbank_num) eq 14 }">
가상계좌 은행명 : <%=vbank_name %><br>
가상계좌 : <%=vbank_num %><br>
가상계좌 입금기한 : <%=vbank_date %><br>
가상계좌 예금주 : <%=vbank_holder %>
</c:if>

<br><br>

</body>
</html>