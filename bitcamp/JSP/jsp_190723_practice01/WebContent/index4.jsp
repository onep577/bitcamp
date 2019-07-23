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
String name = request.getParameter("name");
String birth = request.getParameter("birth");
%>

<p>-- 사용자의 입력을 출력한다 --</p>
<ul>
	<li>이름 :  <%=name %> </li>
	<li>생년월일 :  <%=birth %> </li>
</ul>

</body>
</html>