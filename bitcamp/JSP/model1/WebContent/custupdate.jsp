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
String id = request.getParameter("update");
//System.out.println("id : " + id);

CustuserDao dao = CustuserDao.getInstance();
CustuserDto dto = dao.getOnelist(id);

%>

<form action="custupdateAf.jsp">

<table>
<tr>
	<td>ID</td>
	<td>
		<%=dto.getId() %>
		<input type="hidden" name="id" value="<%=dto.getId() %>">
	</td>
</tr>
<tr>
	<td>Name</td>
	<td><input type="text" name="name" value="<%=dto.getName() %>"></td>
</tr>
<tr>
	<td>Address</td>
	<td>
		<input type="text" name="addr" value="<%=dto.getAddress() %>">
	</td>
</tr>
</table>

<button type="submit" name="update" value="<%=dto.getAddress() %>">수정완료</button>
<input type="button" id="move" value="취소">
</form>

<script type="text/javascript">
$("#move").click( function () {
	response.sendRedirect("custuserlist.jsp");
});
</script>

</body>
</html>