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

CalendarDao dao = CalendarDao.getInstance();
boolean b = dao.delCalendar(seq);

if(b){
	%>
	<script type="text/javascript">
	alert("삭제성공");
	location.href="calendar.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("삭제실패");
	location.href="calendar.jsp";
	</script>
	<%
}
%>

</body>
</html>