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
String id = request.getParameter("delete");
//System.out.println("id : " + id);

CustuserDao dao = CustuserDao.getInstance();
boolean b = dao.delcustuser(id);

if(b == true){
	System.out.println("삭제 됨");
}else{
	System.out.println("삭제 안됨");
}

pageContext.forward("custuserlist.jsp");
%>

</body>
</html>