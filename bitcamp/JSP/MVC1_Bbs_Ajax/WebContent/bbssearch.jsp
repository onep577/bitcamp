<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
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

String searchText = request.getParameter("searchText");
String search = request.getParameter("search");

BbsDao dao = BbsDao.getInstance();
List<BbsDto> list = dao.search(search, searchText);

session.setAttribute("id", id);
session.setAttribute("list", list);
%>

</body>
</html>