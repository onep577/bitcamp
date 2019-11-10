<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<form action="/noticelist" name="frmForm1" id="_frmFormSearch" method="GET">

<table style="width: 100%">
<tr>
<th>
<!-- 검색 -->
<div class="box_border" style="margin-top: 5px; margin-bottom: 10px">

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


<div align="right">
		<select id="_s_category" class="noticeselect" name="s_category">
			<option value="" selected="selected">선택</option>
		  <option value="title" <c:out value="${s_category == 'title'? 'selected':'' }"/>>제목</option>
	      <option value="content"<c:out value="${s_category == 'content'? 'selected':'' }"/>>내용</option>
	      <option value="writer"<c:out value="${s_category == 'writer'? 'selected':'' }"/>>작성자</option>
		</select>
	
		<input type="text" id="_s_keyword" class="faqinput" name="s_keyword" value="${s_keyword }">
		<span class="buttonsearch">
			<img id="_btnSearch" alt="" class="searchimg" src="/img/customer-img/searchb.png">
		</span>
</div>

<!-- hidden 을 통해서 값을 넘겨주기 -->
<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
</div>
<!-- 검색끝 -->
</th>
</tr>
</table>

<table class="list_table" style="width:100%">
<colgroup>
	<col width="80"><col width="500"><col width="80"><col width="80"><col width="80">
</colgroup>

<thead>
<tr>
	<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
</thead>

<tbody>
<c:if test="${empty noticelist}">
	<tr>
		<td colspan="4">검색결과가 없습니다. 다시 검색하여 주세요.</td>
	</tr>
</c:if>
<c:forEach var="notice" items="${noticelist }" varStatus="vs">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td style="text-align: left;">
		<a href="noticedetail?seq=${notice.seq}">
			${notice.title }
		</a>
	</td>
	<td>${notice.id }</td>
	<td> 
		<font size="2">${fn:substring(notice.wdate,0,10)}</font>
	</td>
	<td>${notice.readcount }</td>
	
</tr>
</c:forEach>

 <tr>
<th colspan="5">
<!-- 페이징 -->
<div id="paging_wrap" align="center">  
	<jsp:include page="/WEB-INF/views/customer/paging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }"/>
		<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
	</jsp:include>
</div>
<!-- 페이징끝 --> 

</th>
</tr>
 
 
 
<tr>
<th colspan="5">

</th>
</tr>

</tbody> 
</table>
</form>



<script type="text/javascript">

function goPage( pageNumber ) {
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "noticelist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frmFormSearch").attr("action", "noticelist").submit(); //

	
	
});

</script>