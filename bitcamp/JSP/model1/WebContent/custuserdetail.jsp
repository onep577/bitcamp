<%@page import="javax.websocket.SendResult"%>
<%@page import="dto.CustuserDto"%>
<%@page import="dao.CustuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
</head>
<body>

<%
String id = request.getParameter("id");
//System.out.println("id : " + id);

CustuserDao dao = CustuserDao.getInstance();
CustuserDto dto = dao.getOnelist(id);

%>

<table>
<tr>
	<td>ID</td>
	<td><%=dto.getId() %></td>
</tr>
<tr>
	<td>Name</td>
	<td><%=dto.getName() %></td>
</tr>
<tr>
	<td>Address</td>
	<td><%=dto.getAddress() %></td>
</tr>
</table>

<form action="custupdate.jsp">
<button id="update" name="update" value="<%=dto.getId() %>">수정</button>
</form>

<form action="custdelete.jsp">
<button id="delete" name="delete" value="<%=dto.getId() %>">삭제</button>
</form>

<input type="button" value="취소" onclick="location.href='custuserlist.jsp'">


</body>
</html>