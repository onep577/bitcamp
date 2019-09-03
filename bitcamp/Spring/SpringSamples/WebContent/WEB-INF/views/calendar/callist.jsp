<%@page import="java.util.List"%>
<%@page import="bit.com.a.model.CalendarDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table {
    border-collapse: collapse;
}

table, td, th {
    border: 1px solid black;
}
.sunday{
color: red; 
text-align: left;
vertical-align: top;
}
.satday{
color: blue; 
text-align: left;
vertical-align: top;
}
.otherday{
color: black; 
text-align: left;
vertical-align: top;
}
.days2{
font-size:20px;
color: #4D6BB3; 
text-align: center;
vertical-align: middle;
}
.days3{
font-size:20px;
color: #4D6BB3; 
text-align: center;
vertical-align: middle;
background-color:#4D6BB3; color:#FFFFFF; line-height:1.7em; font-weight:normal;
}

.innerTable {
    border: 0px ;
}
</style>

</head>
<body>

<br>

<%
List<CalendarDto> list = (List<CalendarDto>)request.getAttribute("list");
String year = (String)request.getAttribute("year");
String month = (String)request.getAttribute("month");
String day = (String)request.getAttribute("day");

System.out.println("list.size() : " + list.size());
System.out.println("year : " + year + ", month : " + month + ", day : " + day);
%>

<div style="text-align: left;">
<%=year %>년 <%=month %>월 <%=day %>일 일정보기
</div>

<br>
<table class="list_table" style="width: 85%">
<col width="100"><col width="200"><col width="450"><col width="50">

<tr bgcolor="#09bbaa">
	<th>번호</th><th>시간</th><th>제목</th><th>삭제</th>
</tr>

<%
for(int i=0; i<list.size(); i++){
	if(list.size() == 0){
%>
<tr>
	<td colspan="4">오늘 일정이 없습니다</td>
</tr>
<%
	}else if(list.size() != 0){
%>
<tr>
	<td><%=i+1 %></td>
	<td><%=year %>년 <%=month %>월 <%=day %>일 <%=list.get(i).getRdate().substring(8, 10) %>시 <%=list.get(i).getRdate().substring(10) %>분</td>
	<td style="text-align: left;">
		<a href="caldetail.do?seq=<%=list.get(i).getSeq() %>">
			<%=list.get(i).getTitle() %>
		</a>
	</td>
	
	<td>
		<form action="caldelete.do" method="get">
			<input type="hidden" name="seq" value="<%=list.get(i).getSeq() %>">
			<input type="submit" value="일정삭제">
		</form>
	</td>	
</tr>
<%
	}
}
%>




</table>



</body>
</html>

