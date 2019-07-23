<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Date date = new Date();
String str = null;

date.setHours( 23 );

if(date.getHours() >= 4 && date.getHours() < 12){
	str = "안녕히 주무셨어요";
}else if(date.getHours() >= 12 && date.getHours() < 21){
	str = "안녕하세요";
}else if(date.getHours() >= 21 && date.getHours() < 24){
	str = "안녕히 주무세요";
}

out.println("<p>현재는" + date.getHours() % 12 + "시입니다</p>");
out.println("<p>" + str + "</p>");

%>

</body>
</html>