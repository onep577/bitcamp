<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>caldetail.jsp</h1>
<%
String date = (String)request.getAttribute("date");
System.out.println("AAAAA : " + date);
%>

<table class="list_table" style="width:85%;">

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tr>
	<th>아이디</th>
	<td style="text-align: left"></td>
</tr>
<tr>
	<th>제목</th>
	<td style="text-align: left"></td>
</tr>
<tr>
	<th>일정</th>
	<td style="text-align: left"></td>
</tr>
<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea  name='content' rows="20" cols="60" 
	readonly="readonly"></textarea></td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="button" value='수정하기' onclick="modifydate('');"/>
		<input type="button" value='삭제하기' onclick="deletedate('');"/>
	</td>
</tr>

</table>

<%-- <a href='${urls}'>일정보기</a> --%>

<script type="text/javascript">
function modifydate(seq){
	location.href='calupdate.do?seq='+seq;
}
function deletedate(seq){
	location.href='caldel.do?seq='+seq;
}
</script>

</body>
</html>