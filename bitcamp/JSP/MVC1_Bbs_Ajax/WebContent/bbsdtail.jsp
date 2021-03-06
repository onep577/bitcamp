<%@page import="dto.BbsDto"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<%
String sessionid = (String)session.getAttribute("id");
String _seq = request.getParameter("seq");
int seq = Integer.parseInt(_seq);

BbsDao dao = BbsDao.getInstance();

boolean b = dao.readcount(seq);
System.out.println("b : " + b);

BbsDto dto = dao.getWrite(seq);

session.setAttribute("id", sessionid);
%>

<form action="bbsupdate.jsp">
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
	<input type="text" name="title" value="<%=dto.getTitle() %>" readonly="readonly">
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
	<textarea name="content" cols="50" rows="15" readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td>
	</td>
	<td colspan="2">
	<input type="button" id="reply" value="댓글">
	<b><input type="submit" value="수정"></b>
	<b><input type="button" id="delete" value="삭제"></b>
	<input type="button" value="목록으로 돌아가기" onclick="location.href='bbslist.jsp'">
	</td>
</tr>
</table>
</form>


<script type="text/javascript">
$("b").hide();
<%
if(sessionid.equals(dto.getId())){
	%>
	$("b").show();
	<%
}
%>

$("#delete").click(function () {
	location.href="bbsdelete.jsp?seq="+<%=seq %>;
});

$("#reply").click(function () {
	location.href="bbsanswer.jsp?seq="+<%=seq %>;
});
</script>



</body>
</html>