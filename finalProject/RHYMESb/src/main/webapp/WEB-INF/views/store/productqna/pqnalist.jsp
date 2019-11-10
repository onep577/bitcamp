<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<table>
<colgroup>
			<col width="90%"><col width="10%">
</colgroup>
<tr>
	<td>
<pre style="font-size: 12px;font-family: 'Noto Sans'; line-height:1.8em; color: #4c4c4c;" >
<strong>PRODUCT Q&A</strong>
-상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.
-배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 rhymes 내 1:1 문의에 남겨주세요.
</pre>
	</td>
	<td>
	<div style="float: right;">
	<button type="button" class="pqna-btn1" id="_btnWrite" onclick="PqnaWrite(${pp_seq },'${loginid }')">상품문의</button>
	</div>	
	</td>
</tr>

</table>

<div id="button.wrap">
					
		
		<form action="" name="frmForm1" id="_frmFormSearch" method="get">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>        
		
		<!--비밀글 -->
		<jsp:useBean id="spqna" class="com.rhymes.app.customer.util.PqnaSecret" scope="page"/>     
		<!-- 답변 -->
		<jsp:useBean id="uqna" class="com.rhymes.app.customer.util.PqnaArrow" scope="page"/>    
		 
		    
		<table class="list_table" style="width:100%" >
		<colgroup>
			<col width="100"><col width="700"><col width="150"><col width="150">
		</colgroup>
		<thead>
		<tr>
			<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th>
		</tr>
		</thead>
		
		<tbody>
		<c:if test="${empty pqnalist }">
			<tr>
				<td colspan="4">문의가 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="pqna" items="${pqnalist }" varStatus="vs">
		<tr class="_hover_tr">
			<td>${vs.count }</td>
			<td style="text-align: left; cursor: pointer;" onclick="pqnadetail(${pqna.seq},${pqna.secret},'${pqna.id}','${loginid}' )">
			
			<!-- 비밀글 이미지-->
			<jsp:setProperty property="secret" name="spqna" value="${pqna.secret }"/>
			<jsp:getProperty property="arrow" name="spqna"/> <!-- getSecret 호출 -->		
			<!-- 답변 이비지-->
			<jsp:setProperty property="depth" name="uqna" value="${pqna.depth }"/>
			<jsp:getProperty property="arrow" name="uqna"/> <!-- getArrow 호출 -->		
					${pqna.title }
			</td>
			<td>${pqna.id }</td>
			<td>${fn:substring(pqna.wdate,0,10)}</td>
		</tr>
		<tr class="detail" id='detail${pqna.seq}'>
			<td></td>
			<td colspan="2" align="left">
			<div style="white-space:pre-line;">
			${pqna.content }
			</div>
			</td>
			<td>
		
		<c:if test="${pqna.id eq loginid }">
			<div>
			<span class="button blue">
				<button type="button" class="pqna-btn2" onclick="PqnaUpdate('${pqna.seq }')">수정</button>
			</span>
			<span class="button blue">
				<button type="button" class="pqna-btn2" onclick="PqnaDelete('${pqna.seq }')">삭제</button>
			</span>
			</div>
		</c:if>
			</td>
		</tr>
		</c:forEach>
		
		<tr>
		<th colspan="4" align="center">
		<!-- 페이징 -->
		<div id="paging_wrap"> 
			<jsp:include page="/WEB-INF/views/store/productqna/product_paging.jsp" flush="false">
				<jsp:param name="pageNumber" value="${pageNumber }"/>
				<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
				<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
				<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
			</jsp:include>
			
		<!-- hidden 을 통해서 값을 넘겨주기 -->
		<input type="hidden" name="pageNumber" id="_pageNumber" value="0"> 
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">	
		</div>
		<!-- 페이징끝 --> 
		</th>
		</tr>
		
		</tbody>
		</table>
	
		</form>

</div>    


<!-- 상품문의 -->
<script type="text/javascript">
/* 클릭시 내용보이기 */
$(".detail").hide();

function pqnadetail(seq,secret,id,loginid){
	if(secret==0){
	if($("#detail"+seq).css("display")=="none"){
		$(".detail").hide();
		$("#detail"+seq).show();
	
	}else{
		$("#detail"+seq).hide();
	}
	}else if(secret==1){
		
		if(id == loginid){
			if($("#detail"+seq).css("display")=="none"){
				$(".detail").hide();
				$("#detail"+seq).show();
			
			}else{
				$("#detail"+seq).hide();
			}
		}else{
			alert("비밀글 입니다.");	
		}
		
	}
}
/* 버튼 */
function PqnaAnswer( seq, p_seq ) {
	location.href = "/productqna/pqnaanswer?seq="+seq+"&p_seq="+p_seq;
}
function PqnaDelete( seq ) {
	location.href = "/productqna/pqnadelete?seq=" + seq;
} 
function PqnaUpdate( seq ) {
	location.href = "/productqna/pqnaupdate?seq=" + seq;
}
function PqnaWrite( p_seq ,loginid) {
	if(loginid != ''){
		location.href = "/productqna/pqnawrite?p_seq="+p_seq;
	}else{
		alert('로그인 후 이용 가능합니다');
	}
	
	
}

/* $("#_btnWrite").click(function () {  
	location.href = "/productqna/pqnawrite";
}); */

function goPage(pageNumber) {
	
	$("#_pageNumber").val(pageNumber);  // 들어오는 값을 가져옴 
	$("#_frmFormSearch").attr("action", "pqnalist").submit(); //
	
}

</script>  