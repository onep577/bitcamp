<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<body>

<!-- arrow 생성 -->
<jsp:useBean id="ubbs" class="bit.com.a.util.BbsArrow"/>





<!-- 글목록 -->
<table class="list_table" style="width: 85%">
<col width="5%"><col width="70%"><col width="10%"><col width="15%">

<thead>
	<tr>
		<th>번호</th><th>제목</th><th>조회수</th><th>작성자</th>
	</tr>
</thead>

<tbody>
	<!-- 게시글이 없을 때 -->
	<c:if test="${empty list }">
	<tr>
		<td colspan="4">작성한 게시글이 없습니다</td>
	</tr>
	</c:if>
	
	
	
	<!-- 게시글이 있을 때 -->
	<c:if test="${not empty list }">
	<!-- setDepth를 호출 -->
	<jsp:setProperty property="depth" name="ubbs" value="${bbs.depth }"/>	
	<c:forEach begin="0" end="${fn:length(list) -1 }" step="1" varStatus="i">
	
	
	
	<!-- 게시글 한줄 시작 -->
	<tr class="_hover_tr">
		<td>${i.count }</td>
		<!-- getArrow 호출 -->
		<jsp:getProperty property="arrow" name="ubbs"/>
	
	<c:if test="${list[i.index].del eq 0 }">
		<td style="text-align: left;">작성자에 의해 삭제된 게시글입니다</td>
	</c:if>
	<c:if test="${list[i.index].del ne 0 }">
		<td style="text-align: left;">
			<a style="cursor: pointer;">${list[i.index].title } , ${list[i.index].del }</a>
			<input type="hidden" value="${list[i.index].seq }">
		</td>
	</c:if>	
	
		<td>${list[i.index].readcount }</td>
		<td>${list[i.index].id }</td>
	</tr>
	<!-- 게시글 한줄 끝 -->
	
	
	
	</c:forEach>
	</c:if>
	
	
	
</tbody>
</table>



<!-- 검색 -->
<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
<form name="frmForm1" id="_frmFormSearch" method="post">
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px;">
<tr>
	<td>검색:</td>
	<td style="padding-left: 5px;">
		<select id="_s_category" name="s_category">
			<option value="" selected="selected">선택</option>
			<option value="id">작성자</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
	</td>
	<td style="padding-left: 5px;">
		<input type="text" id="_s_keyword" name="s_keyword">
	</td>
	<td style="padding-left: 5px;">
		<span class="button blue">
			<button type="button" id="_btnSearch">검색</button>
		</span>
	</td>
</tr>
</table>

<input type="text" name="keyword" id="keyword">
<input type="button" id="btn" value="검색">
</form>
</div>




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
		
		location.href="bbsDetail.do?seq="+seq;
	});
	
	
	$("#btn").click(function () {
		if(keyword == null){
			alert("검색어를 입력해주세요");
			return;
		}else {
			$("#frm").attr("action","bbsList.do").submit();
		}
	});
});
</script>









</body>
</html>