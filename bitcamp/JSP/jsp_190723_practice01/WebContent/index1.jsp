<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.util.Calendar"%>
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
Calendar cal = new GregorianCalendar();
//Calendar cal = Calendar.getInstance();

out.println("<p>현재 시간은 " + cal + "입니다</p>");
%>

</body>
</html>