<%@page import="sample01.YouClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//YouClass cls = (YouClass)request.getAttribute("you"); // 짐 풀러!!
// getAttribute는 object 리턴값을 가지고있다
// pageContext는 forward를 부를 수 있다
YouClass cls = (YouClass)request.getSession().getAttribute("you");
// 짐 풀러 보다는 session에서 꺼내준다는 개념이 더 강하다

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

ycls:<%=cls.toString() %> <!-- 짐 푸른거 보여줘 -->



</body>
</html>