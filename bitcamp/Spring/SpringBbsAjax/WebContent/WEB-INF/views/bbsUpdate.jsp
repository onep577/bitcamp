<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<style type="text/css">
.bbsTitle{
	background-color: red;
}
.bbsWrite{
	background-color: yellow;
}
.tb{
	width: 80%;
	height: 50%;
}
</style>

</head>
<body>

<h1 class="bbsTitle" align="center">게시판 글 보기</h1>

<div class="bbsWrite" align="center">
<form id="frm">
<table class="tb" border="1">
<col width="20%"><col width="80%">
	<tr>
		<th>아이디</th>
		<td>
			<label id="id">${userId }</label>
			<input type="hidden" name="seq" id="seq" value="${dto.seq }">
		</td>
	</tr>
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="title" id="title" value="${dto.title }">
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
			<textarea rows="20%" cols="90%" name="content" id="content">${dto.content }</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="button" id="update" value="수정완료">&nbsp;&nbsp;
			<input type="button" onclick="location.href='bbsList.do'" value="게시판으로">
		</td>
	</tr>
</table>
</form>
</div>



<script type="text/javascript">
$(document).ready(function () {	
	$("#update").click(function () {
		$("#frm").attr("action","bbsUpdateAf.do").submit();
	});
});
</script>



</body>
</html>