<%@page import="bit.com.a.model.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);
// 오늘의 달, 1일
String syear = request.getParameter("year");
String smonth = request.getParameter("month");
int year = cal.get(Calendar.YEAR);
if(nvl(syear) == false){		// 파라미터가 넘어 왔을 때
	// 첫번째 들어온 게 아니라 두번째부터 체크한다
	year = Integer.parseInt(syear);
}
int month = cal.get(Calendar.MONTH) + 1; // 0부터 시작한다 원하는 값을 얻기 위해서는 +1 해야한다
if(nvl(smonth) == false){
	month = Integer.parseInt(smonth);
}
if(month < 1){
	month = 12;
	year--;
}
if(month > 12){
	month = 1;
	year++;
}
cal.set(year, month-1, 1);		// 년월일 셋팅 완료
// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
// <<		year--
String pp = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/left.gif'></a>",
						"calendar.jsp", year-1, month);
// <		month--
String p = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/prec.gif'></a>",
						"calendar.jsp", year, month-1);
// >		month++
String n = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/next.gif'></a>",
						"calendar.jsp", year, month+1);
// >>		year++
String nn = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/last.gif'></a>",
						"calendar.jsp", year+1, month);
MemberDto user = (MemberDto)session.getAttribute("login");
iCalendar dao = CalendarDao.getInstance();
List<CalendarDto> list = dao.getCalendarList(user.getId(), syear + two(month + ""));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>일정관리</h1>


</body>
</html>