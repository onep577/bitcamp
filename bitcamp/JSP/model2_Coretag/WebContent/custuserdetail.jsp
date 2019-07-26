<%@page import="java.util.List"%>
<%@page import="javax.websocket.SendResult"%>
<%@page import="dto.CustuserDto"%>
<%@page import="dao.CustuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
//CustuserDto dto = (CustuserDto)request.getAttribute("custdto");
//System.out.println(dto.getId() + ", " + dto.getName() + ", " + dto.getAddress());
%>



<c:set var="custdto" value="${custdto}"></c:set>
<table>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">ID</td>
	<td bgcolor="#FFB2D9">${custdto.id }</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Name</td>
	<td bgcolor="#FFB2D9">${custdto.name }</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Address</td>
	<td bgcolor="#FFB2D9">${custdto.address }</td>
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
				<form action="custusercontrol" method="post">
					<input type="hidden" name="command" value="update">
					<input type="hidden" name="id" value="${custdto.id }">
					<input type="submit" value="수정">
				</form>
			</td>
			<td>
				<form action="custusercontrol" method="post">
					<input type="hidden" name="command" value="delete">
					<input type="hidden" name="id" value="${custdto.id }">
					<input type="submit" value="삭제">
				</form>
			</td>
			<td>
				<form action="custusercontrol" method="get">
					<input type="button" value="취소" onclick="location.href='custusercontrol?command=cancel'">
				</form>
			</td>
		</tr>
		</table>
	</td>
</tr>


</table>

</body>
</html>