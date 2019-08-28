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
	/* background-color: purple; */
	padding-right: 20px;
}
.bbsList{
	/* background-color: blue; */
}
.tb{
	/* background-color: yellow; */
	width: 100%;
	text-align: center;
}
.bbsDel{
	color: red;
}
</style>

</head>
<body>

<h1 class="bbsTitle" align="center">게시판</h1>
<h3 align="right">${userId }님 환영합니다</h3>

<div class="bbsWrite" align="right">
<input type="button" style="width: 60px; height: 40px; font-size: 15px; padding-bottom: 10px;" id="bbsWrite" value="글쓰기">
</div>

<div class="bbsList" align="center">
<table class="tb" border="1">
<col width="5%"><col width="70%"><col width="10%"><col width="15%">
	<tr>
		<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
	</tr>
	
	<c:if test="${empty list }">
	<tr>
		<td colspan="4">작성한 게시글이 없습니다</td>
	</tr>
	</c:if>
	
	<c:if test="${not empty list }">
	<c:forEach begin="0" end="${fn:length(list) -1 }" step="1" varStatus="i">
	<c:if test="${list[i.index].del eq 0 }">
	<tr>
		<td>${i.index +1 }</td>
		<td class="bbsDel">작성자에 의해 삭제된 게시글입니다</td>
		<td>${list[i.index].readcount }</td>
		<td>${list[i.index].id }</td>
	</tr>
	</c:if>
	<c:if test="${list[i.index].del ne 0 }">
	<tr>
		<td>${i.index +1 }</td>
		<td class="bbsData">
			<a style="cursor: pointer;">${list[i.index].title }</a>
			<input type="hidden" value="${list[i.index].seq }">
		</td>
		<td>${list[i.index].readcount }</td>
		<td>${list[i.index].id }</td>
	</tr>
	</c:if>
	</c:forEach>
	</c:if>
	
</table>
</div>



<form id="frm">
<select name="s_category" id="s_category">
	<option value="id">아이디</option>
	<option value="title">제목</option>
	<option value="content">내용</option>
</select>
<input type="text" name="keyword" id="keyword">
<input type="button" id="btn">
</form>



<script type="text/javascript">
$(document).ready(function () {
	$("#bbsWrite").click(function () {
		//alert("click");
		location.href="bbsWrite.do";
	});

	
	
	$(".bbsData").hover(function () {
			$(this).css("background","#ffaaff");
		}
	);	
	$(".bbsData").mouseout(function () {
			$(this).css("background","#ffffff");
		}
	);
	
	
	$(".bbsData").click(function () {
		// find 찾는 함수
		var seq = $(this).find("input[type='hidden']").val();
		//alert(seq);
		
		//location.href="bbsDetail.do?seq="+seq;
		$("#frm").attr("action","search.do").submit();
	});
});
</script>









</body>
</html>