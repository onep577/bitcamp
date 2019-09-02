<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<table class="list_table" style="width: 85%">
<colgroup>
	<col width="50"><col width="100"><col width="300"><col width="50">
	<col width="50"><col width="50"><col width="100"><col width="50">
</colgroup>

<thead>
<tr>
	<th>번호</th><th>작성자</th><th>제목</th><th>다운로드</th>
	<th>조회수</th><th>다운로드수</th><th>작성일</th><th>삭제</th>
</tr>
</thead>

<tbody>
<c:forEach var="pds" items="${pdslist }" varStatus="i">
<tr class="_hover_tr">
	<td>${i.count }</td>
	<td>${pds.id }</td>
	<td style="text-align: left;">
		<a href="pdsdetail.do?seq=${pds.seq }">
			${pds.title }
		</a>
	</td>
	<td>
		<input type="button" name="btnDown" value="다운로드"
			onclick="filedowns('${pds.filename}', '${pds.seq }')">
	</td>
	<td>${pds.readcount }</td>
	<td>${pds.downcount }</td>
	<td>
		<font size="1">${pds.regdate }</font>
	</td>
	<td>
		<img alt="이미지없음" src="image/del.png" data_file_seq="${pds.seq }"
			class="btn_fileDelete" id="_btn_fileDelete">
	</td>
</tr>
</c:forEach>
</tbody>

</table>

<!-- 추가버튼 -->
<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnAdd">자료추가</button>
	</span>
</div>

<!-- 다운로드 버튼 클릭시 -->
<form name="file_Down" action="fileDownload.do" method="post">
	<input type="hidden" name="filename">
	<input type="hidden" name="seq">
</form>

<script type="text/javascript">
function filedowns(filename, seq){
	var doc = document.file_Down;
	doc.filename.value = filename;
	doc.seq.value = seq;
	doc.submit();
}

$("#_btn_fileDelete").click(function () {
	//alert("click");
	location.href="";
});

$("#_btnAdd").click(function () {
	//alert("클릭");
	location.href="pdswrite.do";
});
</script>
