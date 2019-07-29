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
<%! String msg = ""; %>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");

MemberDao dao = MemberDao.getInstance();
boolean b = dao.getUserId(id);

if(b){
	// 원하는 아이디가 있을 때
	boolean b2 = dao.getUserpw(id, password);
	if(b2){
		// 원하는 아이디와 비밀번호가 있을 때
		msg = "로그인 성공";
		%>
		<script type="text/javascript">
		alert("로그인 성공");
		</script>
		<%
	}else{
		// 원하는 비밀번호가 없을 때
		msg = "로그인 실패";
		%>
		<script type="text/javascript">
		alert("로그인 실패 - 비밀번호가 틀렸습니다");
		</script>
		<%
	}
}else{
	// 원하는 아이디가 없을 때
	msg = "로그인 실패";
	%>
	<script type="text/javascript">
		alert("로그인 실패 - 아이디가 틀렸습니다");
	</script>
	<%
}

out.println(msg);
System.out.println("로그인 : " + msg);
%>

</body>
</html>