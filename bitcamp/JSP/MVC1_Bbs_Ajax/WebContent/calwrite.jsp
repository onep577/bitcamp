<%@page import="java.util.Calendar"%>
<%@page import="dto.MemberDto"%>
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

<%!String id = null; %>

<%
String year = request.getParameter("year");
String month = request.getParameter("month");
String day = request.getParameter("day");

Calendar cal = Calendar.getInstance();

int calYear = cal.get(Calendar.YEAR);
int calMonth = cal.get(Calendar.MONTH) + 1;
int calDay = cal.get(Calendar.DATE);
int calHour = cal.get(Calendar.HOUR_OF_DAY);
int calMinnute = cal.get(Calendar.MINUTE);

id = (String)session.getAttribute("id");

//System.out.println("write id : " + id);
%>

<h1>일정추가 화면</h1>

<form id="frm">
<table style="border-style : solid">
<col width="50"><col width="150">

<tr>
	<td>
	ID
	</td>
	<td>
	<input type="text" name="id" value="<%=id %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	Title
	</td>
	<td>
	<input type="text" name="title">
	</td>
</tr>
<tr>
	<td>
	Date
	</td>
	<td>
		<select name="year">
		<%
			for(int i = calYear - 5;i < calYear + 6; i++){
				// 작거나 같다가 아니라 작다니까 +5 가 아니라 +6 한다
				%>
				<option <%=year.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
					
				<%
			}
		%>		
		</select>년
		
		<select name="month">
		<%
			for(int i = 1;i <= 12; i++){ // 1 ~ 12
				%>
				<option <%=month.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
					
				<%
			}
		%>		
		</select>월
		
		<select name="day">
		<%
			for(int i = 1;i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				// 1 ~ 마지막날
				%>
				<option <%=day.equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
					
				<%
			}
		%>		
		</select>일
		
		<select name="hour">
		<%
			for(int i = 0;i < 24; i++){ // 0 ~ 23
				%>
				<option <%=(calHour + "").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
					
				<%
			}
		%>		
		</select>시
		
		<select name="minute">
		<%
			for(int i = 0;i < 60; i++){ // 0 ~ 59
				%>
				<option <%=(calMinnute + "").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
					
				<%
			}
		%>		
		</select>분
	</td>
</tr>
<tr>
	<td colspan="2">
	Content
	</td>
</tr>
<tr>
	<td colspan="2">
	<textarea rows="20" cols="70" name="content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
	<input type="button" id="add" value="일정추가">
	</td>
</tr>

</table>
</form>





<script type="text/javascript">
$("#add").click( function() {
	$("#frm").attr("action", "calendarwriteAf.jsp").submit();
})

$(document).ready(function () {
	//serDay();
	$("select[name='month']").change( serDay );
});

function serDay(){
	// 년도와 달을 통해서 마지막 날짜를 구한다
	var year = $("select[name='year']").val() + "";
	var month = $("select[name='month']").val() + "";
	
	var lastday = ( new Date(year, month, 0) ).getDate();
	// 년도, 월, 일
	//alert(lastday);
	
	var str = "";
	for(i = 1; i <= lastday; i++){
		str += "<option value='" + i + "'>" + i + "</option>";
	}
	
	$("select[name='day']").html( str );
}
</script>












</body>
</html>