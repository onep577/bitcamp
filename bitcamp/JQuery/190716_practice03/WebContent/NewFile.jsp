<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String name = request.getParameter("name");
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String delivery = request.getParameter("delivery");
String bills = request.getParameter("bills");
String magazine = request.getParameter("magazine");

if(bills.equals("true")){
	bills = "영수증 요청";
}else{
	bills = "영수증 비요청";
}

System.out.println("이름 : " + name + ", 우편번호 : " + zipcode
					+ ", 주소 : " + address + ", 전화번호 : " + phone
					+ ", 배달 : " + delivery
					+ ", 영수증 : " + bills + ", 매거진 : " + magazine);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>