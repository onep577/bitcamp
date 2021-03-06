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
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">ID</td>
	<td bgcolor="#FFB2D9"><%=dto.getId() %></td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Name</td>
	<td bgcolor="#FFB2D9"><%=dto.getName() %></td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Address</td>
	<td bgcolor="#FFB2D9"><%=dto.getAddress() %></td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>

<tr bgcolor="#c0c0c0">
	<td>고객정보 변경</td>
	<td>
		<table>
		<tr>
			<td>
				<form action="custupdate.jsp" method="get">
					<input type="hidden" name="update" value="<%=dto.getId() %>">
					<input type="submit" value="수정">
				</form>
			</td>
			<td>
				<form action="custdelete.jsp" method="get">
					<input type="hidden" name="delete" value="<%=dto.getId() %>">
					<input type="submit" value="삭제">
				</form>
			</td>
			<td>
				<form action="custuserlist.jsp" method="get">
					<input type="button" value="취소" onclick="location.href='custuserlist.jsp'">
				</form>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>

</body>
</html>