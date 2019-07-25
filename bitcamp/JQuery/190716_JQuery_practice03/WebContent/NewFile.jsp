<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 
String name = request.getParameter("_name");
String zipcode = request.getParameter("zipcode");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String delivery[] = request.getParameterValues("delivery");
String bills = request.getParameter("bills");
String magazine = request.getParameter("magazine");
 */
String name = request.getParameter("_name");
String zip1 = request.getParameter("zip1");
String zip2 = request.getParameter("zip2");
String address = request.getParameter("address");
String phone1 = request.getParameter("phone1");
String phone2 = request.getParameter("phone2");
String phone3 = request.getParameter("phone3");
String delivery[] = request.getParameterValues("delivery");
String bills = request.getParameter("bills");
String magazine = request.getParameter("magazine");

System.out.println("bills : " + bills);


if(bills == null){
	bills = "영수증 비요청";
}else{
	bills = "영수증 요청";
}

if(delivery != null && delivery.length > 0){
	for(int i = 0;i < delivery.length; i++){
		System.out.println("배달 : " + delivery[i]);
	}
}

System.out.println("이름 : " + name
					+ " 우편번호 : " + zip1 + "-" + zip2
					+ ", 주소 : " + address
					+ ", 전화번호 : " + phone1 + "-" + phone2 + "-" + phone3
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