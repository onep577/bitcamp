<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// Java 영역 == Scriptlet

// submit으로 name을 받았을 때
/* String id = request.getParameter("__id");
System.out.println("id = " + id); */

// java script, JQuery로 id를 받았을 때
String id = request.getParameter("id");
System.out.println("id = " + id);
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