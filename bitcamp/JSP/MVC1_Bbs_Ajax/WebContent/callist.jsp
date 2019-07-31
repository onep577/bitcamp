<%@page import="java.util.List"%>
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
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

if(month.length() <2){
	month = "0"+month;
}
if(day.length() <2){
	day = "0"+day;
}

String rdate = year+month+day;
System.out.println("rdate : " + rdate);

CalendarDao dao = CalendarDao.getInstance();
List<CalendarDto> list = dao.getcallist(rdate);
%>

<h3><%=month %>월 <%=day %>일 전체 일정</h3>

<%
if(list.size() == 0){
%>
<h3>일정이 없습니다</h3>
<%
}else{
	for(int i = 0; i < list.size(); i++){
%>
		title <input type="text" value="<%=list.get(i).getTitle() %>" readonly="readonly">
		content <input type="text" value="<%=list.get(i).getContent() %>" readonly="readonly">
		<br><br>
<%
	}
}
%>

</body>
</html>