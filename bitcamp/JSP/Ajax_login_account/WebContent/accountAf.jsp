<%@page import="dao.MemberDao"%>
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
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");

MemberDao dao = MemberDao.getInstance();
boolean b = dao.addMember(id, password, name, email);

if(b){
	System.out.println("가입 성공");
}else{
	System.out.println("가입 실패");
}

response.sendRedirect("login.jsp");
%>

</body>
</html>