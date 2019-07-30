<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
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
int seq = Integer.parseInt(request.getParameter("seq"));
BbsDao dao = BbsDao.getInstance();
BbsDto dto = dao.getWrite(seq);
%>

<form action="bbsanswerAf.jsp">
<table>
<col width="100px"><col width="100px"><col width="100px">
<tr>
	<td>
	ID
	</td>
	<td colspan="2">
	<input type="text" name="id" value="<%=dto.getId() %>" readonly="readonly">
	<input type="hidden" name="seq" value="<%=seq %>">
	</td>
</tr>
<tr>
	<td>
	Title
	</td>
	<td colspan="2">
	<input type="text" name="title" value="<%=dto.getTitle() %>">
	</td>
</tr>
<tr>
	<td>
	작성일
	</td>
	<td colspan="2">
	<input type="text" name="wdata" value="<%=dto.getWdate() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	조회수
	</td>
	<td colspan="2">
	<input type="text" name="readcount"value="<%=dto.getReadcount() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td colspan="3">
	Content
	</td>
</tr>
<tr>
	<td colspan="3">
	<textarea name="content" cols="50" rows="15"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td>
	</td>
	<td colspan="2">
	<input type="submit" value="댓글완료">
	<input type="button" value="목록으로 돌아가기" onclick="location.href='bbslist.jsp'">
	</td>
</tr>
</table>
</form>

</body>
</html>