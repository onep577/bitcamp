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
<%! String msg = ""; %>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");
String name = request.getParameter("name");
String email = request.getParameter("email");

MemberDao dao = MemberDao.getInstance();
boolean b = dao.addMember(id, password, name, email);

if(b){
	msg = "회원가입 성공";
}else{
	msg = "회원가입 실패";
}
out.println(msg);
System.out.println("회원가입 : " + msg);
%>

<script type="text/javascript">
if("<%=msg %>" == "회원가입 성공"){
	alert("회원가입 성공");
	location.href = "login.jsp";
}else{
	alert("회원가입 실패");
}
</script>

</body>
</html>