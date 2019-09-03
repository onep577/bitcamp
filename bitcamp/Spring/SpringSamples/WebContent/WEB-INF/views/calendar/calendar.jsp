<%@page import="bit.com.a.util.CalUtil"%>
<%@page import="bit.com.a.model.CalendarDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	CalUtil util = new CalUtil();

// 날짜변경 할 수 있는 버튼
String pp = (String)request.getAttribute("pp");
String p = (String)request.getAttribute("p");
String n = (String)request.getAttribute("n");
String nn = (String)request.getAttribute("nn");

// 해당 날짜
int month = (Integer)request.getAttribute("month");
int year = (Integer)request.getAttribute("year");
int dayOfWeek = (Integer)request.getAttribute("dayOfWeek");
Calendar cal = (Calendar)request.getAttribute("cal");

List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("list");

System.out.println("list.size() : " + list.size());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form>
<table class="list_table">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<!-- 오늘 날짜와 날짜변경 할 수 있는 버튼 -->
<tr height="100">
	<td colspan="7" align="center">
		<%=pp %>&nbsp;<%=p %>
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
		</font>
		<%=n %>&nbsp;<%=nn %>
	</td>
</tr>

<!-- 달력의 시작인 요일이 나온다 -->
<tr height="100">
	<td align="center">일</td>
	<td align="center">월</td>
	<td align="center">화</td>
	<td align="center">수</td>
	<td align="center">목</td>
	<td align="center">금</td>
	<td align="center">토</td>
</tr>

<!-- 윗칸 -->
<tr height="100" align="left" valign="top">
<%
for(int i = 1; i < dayOfWeek; i++){
	%>
	<td>&nbsp;</td>
	<%
}
%>

<%-- 날짜 --%>
<%
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1; i <= lastDay; i++){
	%>
	<td class="mydate" onclick="func(<%=""+year+util.two(month+"")+util.two(i+"") %>)">
	<%=util.callist(year, month, i) %>&nbsp;&nbsp;<%=util.showPen(year, month, i) %>
	<%=util.makeTable(year, month, i, list) %>
	</td>
	<%
	if((i + dayOfWeek - 1)%7 == 0 && i != lastDay){
		%>
		</tr><tr height="100" align="left" valign="top">
		<%
	}
}
%>


<%-- 밑칸 --%>
<%
for(int i = 0; i < (7 - (dayOfWeek + lastDay - 1)%7 )%7; i++){
	%>
	<td>&nbsp;</td>
	<%
}
%>


</tr>

</table>
</form>




<script type="text/javascript">
$(".mydate").mouseover(function () {
	$(this).css("background-color", "yellow");
});
$(".mydate").mouseout(function (){
	$(this).css("background-color", "#fff");
});

function func(date){
	//alert(date);
	location.href="callist.do?date="+date;
}
</script>

</body>
</html>