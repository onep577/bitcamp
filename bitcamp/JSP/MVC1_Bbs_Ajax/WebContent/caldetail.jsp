<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDao"%>
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
int seq = Integer.parseInt(request.getParameter("seq"));

CalendarDao dao = CalendarDao.getInstance();
CalendarDto dto = dao.getOneCalendar(seq);

String year = dto.getRdate().substring(0, 4);
String month = dto.getRdate().substring(4, 6);
String day = dto.getRdate().substring(6, 8);
String hour = dto.getRdate().substring(8, 10);
String minute = dto.getRdate().substring(10, 12);

String rdate = year+"-"+month+"-"+day+" "+hour+":"+minute;
%>

<h1>일정상세 화면</h1>

<table style="border-style : solid">
<col width="50"><col width="150">

<tr>
	<td>
	ID
	</td>
	<td>
	<input type="text" value="<%=dto.getId() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	Title
	</td>
	<td>
	<input type="text" value="<%=dto.getTitle() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	약속날짜
	</td>
	<td>
	<input type="text" value="<%=rdate %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	작성일
	</td>
	<td>
	<input type="text" value="<%=dto.getWdate() %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	CONTENT
	</td>
	<td>
	<textarea name="content" rows="20" cols="70" readonly="readonly"><%=dto.getContent() %>
	</textarea>
	</td>
</tr>
<tr>
	<td>
	<input type="button" id="go" value="일정관리로 돌아가기">
	</td>
	<td align="right">
	<input type="button" id="update" value="수정">
	<input type="button" id="delete" value="삭제">
	</td>
</tr>

</table>



<script type="text/javascript">
$("#go").click(function () {
	location.href="calendar.jsp";
});
$("#delete").click(function () {
	location.href="caldelete.jsp?seq="+<%=seq %>;
});
$("#update").click(function () {
	location.href="calupdate.jsp?seq="+<%=seq %>;
});
</script>



</body>
</html>