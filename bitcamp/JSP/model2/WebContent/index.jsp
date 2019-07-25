<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <a href="custuserlist.jsp">고객목록</a> -->

<%
response.sendRedirect("custusercontrol?command=list");
// list로 구분한다
%>

</body>
</html>