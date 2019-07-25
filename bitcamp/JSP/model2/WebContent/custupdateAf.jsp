<%@page import="dto.CustuserDto"%>
<%@page import="dao.CustuserDao"%>
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
String address = request.getParameter("addr");
System.out.println("id : " + id);
System.out.println("name : " + name);
System.out.println("address : " + address);

CustuserDao dao = CustuserDao.getInstance();
boolean b = dao.updatecustuser(id, name, address);

if(b == true){
	System.out.println("수정 성공");
}else{
	System.out.println("수정 실패");
}

pageContext.forward("custuserlist.jsp");
%>

</body>
</html>