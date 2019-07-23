<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
String str = "Hello World";
%>

<h2><%=str%></h2>

<%
out.println("<h2>" + str + "</h2>");
%>

<%
out.println(str);
%>


</body>
</html>