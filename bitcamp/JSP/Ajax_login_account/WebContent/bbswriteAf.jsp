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
String id = (String)session.getAttribute("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

BbsDao dao = BbsDao.getInstance();
boolean b = dao.bbsWrite(id, title, content);
%>

<script type="text/javascript">
if(<%=b %>){
	location.href = "bbslist.jsp";
}
</script>

</body>
</html>