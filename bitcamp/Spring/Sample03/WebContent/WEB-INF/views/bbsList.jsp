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
	background-color: purple;
	padding-right: 100px;
}
.bbsList{
	/* background-color: blue; */
}
.tb{
	background-color: yellow;
	width: 100%;
	text-align: center;
}
</style>

</head>
<body>

<h1 class="bbsTitle" align="center">게시판</h1>

<div class="bbsWrite" align="right">
<input type="button" style="width: 120px; height: 40px; font-size: 20px;" id="bbsWrite" value="글쓰기">
</div>

<div class="bbsList" align="center">
<table class="tb" border="1">
<col width="5%"><col width="70%"><col width="10%"><col width="15%">
	<tr>
		<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
	</tr>
	<tr>
		<td>1</td><td>11</td><td>111</td><td>1111</td>
	</tr>
	<tr>
		<td>2</td><td>22</td><td>222</td><td>2222</td>
	</tr>
</table>
</div>






<script type="text/javascript">
$(document).ready(function () {
	$("#bbsWrite").click(function () {
		//alert("click");
		location.href="bbsWrite.do";
	});
});
</script>









</body>
</html>