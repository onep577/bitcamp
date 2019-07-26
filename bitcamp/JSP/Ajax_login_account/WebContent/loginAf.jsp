<%@page import="dto.MemberDto"%>
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

MemberDao dao = MemberDao.getInstance();
MemberDto dto = dao.checkLogin(id, password);

String msg = null;
if(dto == null){
	out.println("로그인 실패");
	return;
}

String findid = dto.getId();
String findpw = dto.getPassword();

boolean b = findid.equals(id);
boolean b2 = findpw.equals(password);

if(b == true && b2 == true){
	msg = "로그인 성공";
}else{
	msg = "로그인 실패";
}

out.println(msg);
System.out.println("로그인 : " + msg);

%>

</body>
</html>