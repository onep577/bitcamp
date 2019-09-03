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


<form id="calForm">
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
	<td style="text-align: left"><input type="text" name="title" id="_title" value="<%=dto.getTitle() %>" readonly="readonly">
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
	<td style="text-align: left"><textarea name="content" id="_content" rows="20" cols="60" readonly="readonly"><%=dto.getContent() %></textarea>
	<input type="hidden" name="rdate" id="_rdate" value="<%=dto.getRdate() %>">
	<input type="hidden" name="seq" id="_seq" value="<%=dto.getSeq() %>">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value='수정하기' onclick="calupdate('<%=dto.getSeq() %>');"/>
		<input type="button" value='삭제하기' onclick="caldelete('<%=dto.getSeq() %>');"/>
	</td>
</tr>

</table>
</form>



<script type="text/javascript">
var i = 0;
function calupdate(){
	$("#_title").removeAttr("readonly");
	$("#_content").removeAttr("readonly");
	i++;
	if(i > 1){
		$("#calForm").attr("action","calupdate.do").submit();
	}
}
function caldelete(seq){
	location.href="caldelete.do?seq="+seq;
}
</script>

</body>
</html>