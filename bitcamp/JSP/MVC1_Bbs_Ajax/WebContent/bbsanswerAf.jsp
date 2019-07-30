<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@page import="dto.BbsDto"%>
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
int seq = Integer.parseInt(request.getParameter("seq"));
String id = request.getParameter("id");
String title = request.getParameter("title");
String content = request.getParameter("content");

System.out.println("댓글 완료 클릭한 후 id : " + id
		+ ", title : " + title + ", content : " + content + ", ");

BbsDao dao = BbsDao.getInstance();
BbsDto dto = new BbsDto(id, title, content, null, 0);
boolean b = dao.answer(seq, dto);

if(b){
	System.out.println("답글 : " + b);
	pageContext.forward("bbslist.jsp");
}else{
	System.out.println("답글 : " + b);
}
%>

</body>
</html>