<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
<table class="detail_table" style="line-height: 1.5em">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th rowspan="2">제목</th>
	<td colspan="3">${qna.category }</td>
</tr>
<tr>
	<td colspan="3">${qna.title }</td>
</tr>

<tr>
	<th>주문번호</th>
	<td>${qna.orderno }</td>
</tr>


<tr>
	<th>작성자</th>
	<td colspan="3">${qna.id }</td>
</tr>

<tr>
	<th>작성일</th>
	<td>${qna.wdate }</td>
	
	<c:if test="${0 eq qna.step }">
	<th>답변상태</th>
	<td>
		<c:if test="${1 eq qna.feedback }">
		답변완료
		</c:if>
		<c:if test="${0 eq qna.feedback }">
		미답변
		</c:if>
	</td>
	</c:if>
	 
</tr>
<tr>
	<td colspan="4">
	<div style="white-space:pre-line;" class="contentst">
	<img alt="" src="/upload/customer/${qna.filename }" style="height: 30%">
	${qna.content }
	</div>
	</td>
</tr>
</table>


<!-- 수정삭제버튼 -->
<c:if test="${0 eq qna.step }">
<div style="margin-bottom: 30px;">
<!-- 코어태그 추가하기 -->
	<button type="button"  class="customer-btn2" onclick="QnaUpdate('${qna.seq }')">수정</button>
	<button type="button"  class="customer-btn2" onclick="QnaDelete('${qna.seq }','${qna.step }','${qna.ref }')">삭제</button>
</div>
</c:if>

<script type="text/javascript">

function QnaDelete( seq ,step,ref ) {
	location.href = "qnadelete?seq="+seq+"&step="+step+"&ref="+ref;
}
function QnaUpdate( seq ) {
	location.href = "qnaupdate?seq="+seq;
}

</script>    