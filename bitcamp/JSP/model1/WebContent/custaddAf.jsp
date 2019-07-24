<%@page import="dao.CustuserDao"%>
<%@page import="dto.CustuserDto"%>
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
String name = request.getParameter("name");
String addr = request.getParameter("addr");

//System.out.println("id : " + id);
//System.out.println("name : " + name);
//System.out.println("addr : " + addr);

CustuserDao dao = CustuserDao.getInstance();

int count = dao.addCustuser(id, name, addr);
//System.out.println("count : " + count);

pageContext.forward("custuserlist.jsp");

%>

</body>
</html>