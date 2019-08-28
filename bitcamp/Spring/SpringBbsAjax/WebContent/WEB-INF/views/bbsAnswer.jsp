<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
.bbsTitle{
	/* background-color: red; */
}
.bbsWrite{
	/* background-color: yellow; */
}
.tb{
	width: 80%;
	height: 50%;
}
</style>

</head>
<body>

<h1 class="bbsTitle" align="center">게시글</h1>

<div class="bbsWrite" align="center">
<form id="frm">
<table class="tb" border="1">
<col width="20%"><col width="80%">
	<tr>
		<th>아이디</th>
		<td>
			<label id="id">${dto.id }</label>
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<label id="title">${dto.title }</label>
		</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td>
			<label>${dto.readcount }</label>
		</td>
	</tr>
	<tr>
		<th>작성일</th>
		<td>
			<label>${dto.wdate }</label>
		</td>
	</tr>
	<tr height="250px">
		<th>내용</th>
		<td>
			<label id="content">${dto.content }</label>
		</td>
	</tr>
</table>
</form>
</div>




<h1 class="bbsTitle" align="center">댓글쓰기</h1>

<div class="bbsWrite" align="center">
<form id="answerfrm">
<table class="tb" border="1">
<col width="20%"><col width="80%">
	<tr>
		<th>아이디</th>
		<td>
			<label id="answerid">${userId }</label>
			<input type="hidden" name="id" value="${userId }">
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="title" id="answertitle">
		</td>
	</tr>
	<tr height="250px">
		<th>내용</th>
		<td>
			<textarea rows="20%" cols="90%" name="content" id="answercontent"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="write" value="글쓰기">&nbsp;&nbsp;
			<input type="button" onclick="location.href='bbsList.do'" value="게시판으로">
		</td>
	</tr>
</table>
</form>
</div>





<script type="text/javascript">
$(document).ready(function () {	
	$("#write").click(function () {
		$("#answerfrm").attr("action", "bbsAnswerAf.do").submit();
	});
});
</script>



</body>
</html>