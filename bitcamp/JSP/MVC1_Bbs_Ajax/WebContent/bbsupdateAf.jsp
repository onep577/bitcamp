<%@page import="dao.BbsDao"%>
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
String sessionid = (String)session.getAttribute("id");
String title = request.getParameter("title");
String content = request.getParameter("content");
int seq = Integer.parseInt(request.getParameter("seq"));

BbsDao dao = BbsDao.getInstance();
boolean b = dao.update(seq, title, content);

%>
<script type="text/javascript">
<%

if(b){
	%>
	alert("수정 성공");
	location.href = "bbslist.jsp";
	<%
}else{
	%>
	alert("수정 실패");
	<%
}
%>

</script>
</body>
</html>