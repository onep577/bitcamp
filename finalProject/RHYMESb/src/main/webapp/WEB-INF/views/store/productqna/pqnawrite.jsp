<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   


<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 



<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<div style="font-size: 12px; font-family: 'Noto Sans'; line-height:1.8em; color: #4c4c4c; margin-bottom: 10px;" align="left" >
<h1 style="font-family: 'Noto Sans';">PRODUCT Q&A <span style="font-size: 12px">상품 Q&A입니다.</span></h1>
<div>-상품에 대한 문의를 남기는 공간입니다. 해당 게시판의 성격과 다른 글은 사전동의 없이 담당 게시판으로 이동될 수 있습니다.</div>
<div>-배송관련, 주문(취소/교환/환불)관련 문의 및 요청사항은 마이컬리 내 1:1 문의에 남겨주세요.</div>
</div>

<form id="_frmForm" action="faqupload" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<table class="detail_table" style="width: 95%">
<col width="200"><col width="400"><col width="100"><col width="250">
<input type="hidden" name="p_seq" value="${pqnalist.p_seq }"/> <!-- 주문번호 -->
<input type="hidden" name="referer1" value="${referer1 }"/> <!-- 이전페이지 -->

<tr>
	<th>제목</th>
	<td colspan="3">
		<input type="text" class="faqinput" name="title" style="width: 95%;" id="title" >
	</td>
</tr>

<tr>
	<th>작성자</th>
	<td colspan="3">
		<input type="text " class="faqinput" name="id" size="50" value="${id }" readonly>
	</td>
</tr>
<tr>
	<th>비밀글</th>
	<td colspan="3">
		<label for="secret" class="label_check">
		<input type="checkbox" id="secret" name="secret" value="1">
		<span style="font-size: 15px">비밀글</span>
		</label>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea name="content" id="summernote" style="padding-left: 36%;"></textarea>
	</td>
</tr>

</table>

<div style="float: right;">
	
		<button type="button" class="customer-btn1" id="_btnWrite">저장</button>
	
</div>

</form>    


<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "pqnaupload").submit(); //
});


/* 비밀글 체크박스 */




$("#_btnWrite").mousedown(function() {
	if($("#content").val()==""){
		alert("내용을 입력해주세요");
		return;
	}else if($("#title").val()==""){
		alert("제목을 입력해주세요");
		return;
	}
});

</script>    


<!-- SUMMERNOTE -->
<script>
  $('#summernote').summernote({
    placeholder: '',
    tabsize: 2,
    height:600
  });
</script> 