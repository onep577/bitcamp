<%@page import="dto.CalendarDto"%>
<%@page import="dao.CalendarDao"%>
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
String id = request.getParameter("id");
String title = request.getParameter("title");
String wdate = request.getParameter("wdate");
String content = request.getParameter("content");

String rdate = request.getParameter("rdate");
System.out.println("rdate : " + rdate);

String year = rdate.substring(0, 4);
String month = rdate.substring(5, 7);
String day = rdate.substring(8, 10);
String hour = rdate.substring(11, 13);
String minute = rdate.substring(14, 16);

rdate = year+month+day+hour+minute;

CalendarDto dto = new CalendarDto(seq, id, title, content, rdate, wdate);

CalendarDao dao = CalendarDao.getInstance();
boolean b = dao.updateCalendar(dto);

if(b){
	%>
	<script type="text/javascript">
	alert("수정 완료");
	location.href="calendar.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("수정 실패");
	location.href="calendar.jsp";
	</script>
	<%
}
%>

</body>
</html>