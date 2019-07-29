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
int seq = Integer.parseInt(request.getParameter("seq"));

BbsDao dao = BbsDao.getInstance();
boolean b = dao.delete(seq);
System.out.println("삭제 : " + b);


session.setAttribute("id", sessionid);


if(b){
	%>
	<script type="text/javascript">
	location.href="bbslist.jsp";
	</script>
	<%
}
%>

</body>
</html>