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
String lastday = (String)request.getAttribute("lastday");
String date = (String)request.getAttribute("date");
System.out.println("date : " + date);

String year = date.substring(0, 4);
String month = date.substring(4, 6);
String day = date.substring(6, 8);
String hour = date.substring(8, 10);
String minute = date.substring(10);

if(month.length() == 2){
	month.substring(1);
}
if(day.length() == 2){
	day.substring(1);
}

System.out.println("year : " + year);
System.out.println("month : " + month);
System.out.println("day : " + day);
System.out.println("hour : " + hour);
System.out.println("minute : " + minute);

날짜 시간 다시 구하자
%>

<form action="calwriteAf.do" id="calwriteForm" method="post">
<table class="list_table">
<col width="30%"><col width="70%">

<tr>
	<td colspan="2">
	<select>
	<%
	for(int i=Integer.parseInt(year)-5; i<Integer.parseInt(year)+5; i++) {
		%>
		<option <%=year.equals(i+"")?"selected='selected'":"" %>><%=i %></option>
		<%		
	}
	%>
	</select>년도&nbsp;
	
	<select>
	<%
	for(int i=1; i<12; i++) {
		%>
		<option <%=month.equals(i+"")?"selected='selected'":"" %>><%=i %></option>
		<%		
	}
	%>
	</select>월&nbsp;
	
	<select>
	<%
	for(int i=1; i<Integer.parseInt(lastday); i++) {
		%>
		<option <%=day.equals(i+"")?"selected='selected'":"" %>><%=i %></option>
		<%		
	}
	%>
	</select>일&nbsp;
	
	<select>
	<%
	for(int i=1; i<24; i++) {
		%>
		<option <%=hour.equals(i+"")?"selected='selected'":"" %>><%=i %></option>
		<%		
	}
	%>
	</select>시&nbsp;
	
	<select>
	<%
	for(int i=1; i<60; i++) {
		%>
		<option <%=minute.equals(i+"")?"selected='selected'":"" %>><%=i %></option>
		<%		
	}
	%>
	</select>분&nbsp;
	
	</td>
</tr>

<tr>
	<th>작성자</th><td><label>${userId }</label></td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" size="100%" name="title" id="_title">
	</td>
</tr>
<tr>
	<th>내용</th>
	<td>	
		<textarea rows="20" cols="100%" name="content" id="_content"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2"><input type="button" id="_calwriteBtn" value="추가"></td>
</tr>
</table>
</form>

<script type="text/javascript">
$("#_calwriteBtn").click(function () {
	alert("ddd");
});

$("#calwriteForm").att
</script>

</body>
</html>