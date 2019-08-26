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

<h1 class="bbsTitle" align="center">게시판 글쓰기</h1>

<div class="bbsWrite" align="center">
<form>
<table class="tb" border="1">
<col width="20%"><col width="80%">
	<tr>
		<th>ID</th>
		<td>
			<label id="id">1</label>
		</td>
	</tr>
	<tr>
		<th>TITLE</th>
		<td>
			<input type="text" value="222">
		</td>
	</tr>
	<tr height="250px">
		<th>CONTENT</th>
		<td>
			<textarea rows="20%" cols="90%">333</textarea>
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
$("#write").click(function () {
	alert("click");
	
	var id = $("#id").val();
	var title = $("#title").val().trim();
	var content = $("#content").val().trim();
	
	location.href="bbsWriteAf.do";
});
</script>












</body>
</html>