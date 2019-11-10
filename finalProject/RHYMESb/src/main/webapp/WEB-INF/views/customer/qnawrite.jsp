<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

   
<form id="_frmForm" action="qnaupload" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>    
<table class="detail_table">
<col width="150"><col width="200"><col width="100"><col width="300">

<tr>
	<th rowspan="2">제목</th>
	<td colspan="3">
		<select id="category" class="qnaselect" name="category">
		  <option value="" selected="selected">선택</option>
		  <option value="배송문의">배송문의</option>
	      <option value="취소/교환/반품">취소/교환/반품</option>
	      <option value="주문결제문의">주문결제문의</option>
	      <option value="회원정보문의">회원정보문의</option>
	      <option value="쿠폰/적립금">쿠폰/적립금</option>
	      <option value="서비스 이용 및 기타">서비스 이용 및 기타</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan="3"><input type="text" name="title" id="title" class="faqinput" style="width: 95%"></td>
</tr>

<tr>
	<th>주문번호</th>
	<td colspan="3"><input type="text" id="_OrderPickNum" class="faqinput" name="orderno" readonly>
	<input type="button" id="_OrderNum" class="orderbtn" value="주문조회">
	</td>
</tr>


<tr>
	<th>작성자</th>
	<td colspan="3">
	<input type="text" name="id" class="faqinput" value="${id }" readonly>
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
<pre style="font-size: 12px;font-family: 'Noto Sans'; line-height:1.8em; color: #4c4c4c">
<strong>1:1 문의 작성 전 확인해주세요!</strong> 

<strong>반품 / 환불</strong>
-제품 하자 혹은 이상으로 반품 (환불)이 필요한 경우 사진과 함께 구체적인 내용을 남겨주세요.

<strong>주문취소</strong>
-배송 단계별로 주문취소 방법이 상이합니다.
 [입금확인] 단계 : [마이페이지 > 주문내역 상세페이지] 에서 직접 취소 가능
 [입금확인] 이후 단계 : 고객행복센터로 문의

-생산이 시작된 [상품 준비중] 이후에는 취소가 제한되는 점 고객님의 양해 부탁드립니다.
-비회원은  웹사이트에서 [마이페이지 > 비회원 주문 조회 페이지] 에서 취소가 가능합니다.
-일부 예약상품은 배송 3~4일 전에만 취소 가능합니다.
-주문상품의 부분 취소는 불가능합니다. 전체 주문 취소 후 재구매 해주세요.

<strong>배송</strong>
-주문 완료 후 배송 방법은 변경이 불가능합니다.
-배송일 및 배송시간 지정은 불가능합니다. (예약배송 포함)
</pre>
		<textarea style="height:268px;width:1025px;" id="content" name="content"></textarea>
	</td>
</tr>

<tr>
	<th>이미지</th>
	<td colspan="3">

		<div class="file_input">
		    <input type="text" readonly="readonly" title="File Route" id="file_route">
		     <label>
		    	    파일 업로드
		        <input type="file" name="fileload" onchange="javascript:document.getElementById('file_route').value=this.value">
		    </label>
		</div>

	</td>
</tr>
</table>    

<div>
		<button type="button" class="customer-btn2" id="_btnWrite">저장</button>

		<button type="button" class="customer-btn2"  id="_btnBack">목록</button>
</div>

</form>


 <!-- The Modal -->
    <div id="myModal2" class="modal2">
 
      <!-- Modal content -->
      <div class="modals-content2">
             <p>문의하실 주문번호를 선택하세요.</p>
                <table style="font-size: 7px;" class="order_table">
                <col width="100"><col width="100"><col width="300"><col width="100"><col width="100">
                <thead>
					<tr >
						<th>주문번호</th><th>주문일자</th><th>상품명</th><th>주문금액</th><th>선택</th>
					</tr>
				</thead>
                
                <tbody>
				<c:if test="${empty orderlist }">
					<tr>
						<td colspan="5">주문내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="order" items="${orderlist }" varStatus="vs">
				<tr>
					<td>${fn:substring(order.payment_code,4,16)}</td>
					<td>${fn:substring(order.rdate,0,10)}</td>
					<td>
						${order.p_name}<c:if test="${order.count > 1 }">&nbsp;외 ${order.count - 1 }건</c:if>
					</td> 
					<td>${order.totalprice }</td>
					<td><input type="radio" class="radio_btn" name="pick" value="${fn:substring(order.payment_code,4,16)}" onclick="orderpick(this)"> </td>
				</tr>
				</c:forEach>
				
				</tbody>
                </table>
                
            <div style="cursor:pointer;text-align: center; float: right;">
                <img src="../img/customer-img/popup_close.png" onclick="close_pop();">
            </div>
      </div>
 
    </div>
        <!--End Modal-->





<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "qnaupload").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "qnalist";
});

$("#_btnWrite").mousedown(function() {
	if($("#category").val()==""){
		alert("카테고리를 선택해주세요");
		return;
	}else if($("#content").val()==""){
		alert("내용을 입력해주세요");
		return;
	}else if($("#title").val()==""){
		alert("제목을 입력해주세요");
		return;
	}
});
</script>

<script type="text/javascript">
$("#_OrderNum").click(function () {
  
        jQuery(document).ready(function() {
                $('#myModal2').show();
        });

});

function orderpick( me ) {	// 선택한주문번호 넘겨주기
	var num = me.value;
	$("#_OrderPickNum").val(num);
	 $('#myModal2').hide();

	
}


//팝업 Close 기능
function close_pop(flag) {
     $('#myModal2').hide();
};
    </script>
