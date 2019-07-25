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
CustuserDto dto = (CustuserDto)request.getAttribute("custdto");
%>

<form action="custusercontrol">
	<input type="hidden" name="command" value="updateAf">
<table>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">ID</td>
	<td bgcolor="#FFB2D9">
		<%=dto.getId() %>
		<input type="hidden" name="id" value="<%=dto.getId() %>">
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Name</td>
	<td bgcolor="#FFB2D9">
		<input type="text" name="name" value="<%=dto.getName() %>">
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Address</td>
	<td  bgcolor="#FFB2D9">
		<input type="text" name="addr" value="<%=dto.getAddress() %>">
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td colspan="2"  bgcolor="#c0c0c0">
		<table>
		<tr>
			<td>
				<input type="submit" value="수정완료">
				<button name="command" value="cancel">취소</button>
			</td>
		</tr>
		</table>
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
</table>
</form>


</body>
</html>