<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
System.out.println("----------NewFile1.jsp로 이동");
String number = request.getParameter("number");
String date = request.getParameter("date");
String color = request.getParameter("color");
String range = request.getParameter("range");
String search = request.getParameter("search");

System.out.println("number : " + number);
System.out.println("date : " + date);
System.out.println("color : " + color);
System.out.println("range : " + range);
System.out.println("search : " + search);
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