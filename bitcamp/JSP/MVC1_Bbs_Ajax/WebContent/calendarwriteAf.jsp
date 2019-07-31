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
String id = request.getParameter("id");
String title = request.getParameter("title");
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");
String hour = request.getParameter("hour");
String minute = request.getParameter("minute");
String content = request.getParameter("content");

if(month.length() < 2){
	month = "0"+month;
}
if(day.length() < 2){
	day = "0"+day;
}
if(hour.length() < 2){
	hour = "0"+hour;
}
if(minute.length() < 2){
	minute = "0"+minute;
}

String rdate = year+month+day+hour+minute;

System.out.println("id : " + id + 
					", title : " + title + 
					", year : " + year + 
					", month : " + month + 
					", day : " + day + 
					", hour : " + hour + 
					", minute : " + minute + 
					", content : " + content);


CalendarDao dao = CalendarDao.getInstance();
boolean b = dao.addCalendar(new CalendarDto(id, title, content, rdate));

String url = String.format("%s?year=%s&month=%s", 
		"calendar.jsp", year, month);

if(b){
	%>
	<script type="text/javascript">
	alert("성공적으로 일정을 추가하였습니다");
	location.href="<%=url %>";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("일정이 추가되지 않았습니다");
	location.href="<%=url %>";
	</script>
<%
}
%>

</body>
</html>