<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myHello.jsp</title>
</head>
<body>

<h1>myHello</h1>

<%
String name = (String)request.getAttribute("name");
out.println("name : " + name);
%>

<br><br><br>

<h2>${name }</h2>

</body>
</html>