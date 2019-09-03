<%@page import="bit.com.a.model.CalendarDto"%>
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
CalendarDto dto = (CalendarDto)request.getAttribute("dto");
%>

<table class="list_table" style="width:85%;">

<colgroup>
<col style="width:200px;"/>
<col style="width:auto;"/>
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left"><%=dto.getId() %>
	</td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left"><%=dto.getTitle() %>
	</td>
</tr>
<tr>
	<th>일정</th>
	<td style="text-align: left">
	<%=dto.getRdate().substring(0, 4) %>년
	<%=dto.getRdate().substring(4, 6) %>월
	<%=dto.getRdate().substring(6, 8) %>일
	<%=dto.getRdate().substring(8, 10) %>시
	<%=dto.getRdate().substring(10) %>분
	</td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea  name='content' rows="20" cols="60"
	readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value='수정하기' onclick="calupdate('<%=dto.getSeq() %>');"/>
		<input type="button" value='삭제하기' onclick="caldelete('<%=dto.getSeq() %>');"/>
	</td>
</tr>

</table>

<script type="text/javascript">
function calupdate(seq){
	alert(seq);
	location.href='calupdate.do?seq='+seq;
}
function caldelete(seq){
	location.href='caldelete.do?seq='+seq;
}
</script>

</body>
</html>