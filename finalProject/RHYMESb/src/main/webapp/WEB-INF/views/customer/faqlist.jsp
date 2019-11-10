<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>





<form action="faqlist" name="frmForm1" id="_frmFormSearch" method="POST">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
<table style="width:100%" >
	<colgroup>
		<col width="50"><col width="100"><col width="600">
	</colgroup>
	<tr>
		<th>
			<select id="_s_category"  name="s_category" onchange="categorychange()" class="faqselect">
			  <option value="" selected="selected">선택</option>
			  <option value="01" <c:out value="${s_category == '01'? 'selected':'' }"/>>회원문의</option>
		      <option value="02"<c:out value="${s_category == '02'? 'selected':'' }"/>>주문/결제</option>
		      <option value="03"<c:out value="${s_category == '03'? 'selected':'' }"/>>취소/교환/반품</option>
		      <option value="04"<c:out value="${s_category == '04'? 'selected':'' }"/>>배송문의</option>
		      <option value="05"<c:out value="${s_category == '05'? 'selected':'' }"/>>쿠폰/적립금</option>
		      <option value="06"<c:out value="${s_category == '06'? 'selected':'' }"/>>서비스 이용 및 기타</option>
			</select>

	<!-- 검색 -->
	<span style="float: right;">
			<input type="text" id="_s_keyword" class="faqinput" name="s_keyword" value="">
			<span class="buttonsearch">
				<img id="_btnSearch" alt="" src="/img/customer-img/searchb.png" class="searchimg">
			</span>
	</span>
	<!-- hidden 을 통해서 값을 넘겨주기 -->
	<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<!-- 검색끝 -->
	
	</th>
	</tr>
</table>    
    
<table class="list_table" style="width:100%; line-height: 1.5em;" >
<colgroup>
	<col width="100"><col width="200"><col width="600"><col width="150">
</colgroup>
<thead>
<tr>
	<th>번호</th><th>카테고리</th><th colspan="2">제목</th>
</tr>
</thead>

<tbody>
<c:if test="${empty faqlist }">
	<tr>
		<td colspan="4">검색결과가 없습니다. 다시 검색하여 주세요.</td>
	</tr>
</c:if>
<c:forEach var="faq" items="${faqlist }" varStatus="vs">
<tr class="_hover_tr" onclick="faqdetail(${faq.seq});" style="cursor: pointer;">
	<td>${vs.count }</td>
	<td>${faq.category }</td>
	<td colspan="2" style="text-align: left;">
			${faq.title }
	</td>
</tr>
<tr class="detail" id='detail${faq.seq}'>
	<td>
		<img alt="" src="/img/customer-img/answer.PNG" height="15px" width="24px;" > 
	</td>
	<td colspan="3" align="left">
	<div style="white-space:pre-line;">${faq.content }
	</div>
	</td>
	
</tr>
</c:forEach>

<tr>
<th colspan="4" align="center">
<!-- 페이징 -->
<div id="paging_wrap"> 
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

<!-- 선만들려고 만든것 -->
<tr>
<th colspan="4">
</th>
</tr>

</tbody>
</table>

</form>

<script type="text/javascript">
/* 클릭시 내용보이기 */
$(".detail").hide();

function faqdetail(seq){
	
	if($("#detail"+seq).css("display")=="none"){
		$(".detail").hide();
		$("#detail"+seq).show();
	
	}else{
		$("#detail"+seq).hide();
	}
}

function categorychange(  ){
	document.frmForm1.submit();	
}


function goPage( pageNumber ) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "faqlist").submit(); //
	
}

$("#_btnSearch").click(function () {
	//alert("클릭");
	$("#_frmFormSearch").attr("action", "faqlist").submit(); //
});

</script>