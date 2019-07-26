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
%>

<c:set var="custdto" value="${custdto}"></c:set>

<form action="custusercontrol">
<table>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">ID</td>
	<td bgcolor="#FFB2D9">
		${custdto.id }
		<input type="hidden" name="id" value="${custdto.id }">
	</td>
</tr>

<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Name</td>
	<td bgcolor="#FFB2D9">
		<input type="text" name="name" value="${custdto.name }">
	</td>
</tr>

<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="yellow">Address</td>
	<td  bgcolor="#FFB2D9">
		<input type="text" name="addr" value="${custdto.address }">
	</td>
</tr>

<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr>
	<td bgcolor="#c0c0c0">
			
				<input type="hidden" name="command" value="updateAf">
				<input type="submit" value="수정완료">
		</td>
		
			</form>
		<td bgcolor="#c0c0c0">
			<form action="custusercontrol">
				<input type="hidden" name="command" value="cancle">
				<input type="submit" value="취소">
			</form>
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
</table>
</form>


</body>
</html>