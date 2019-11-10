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


<form id="_frmForm" action="faqupload" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">
<input type="hidden" name="p_seq" value="${pqnalist.p_seq }"/> <!-- 주문번호 -->
<input type="hidden" name="seq" value='${seq }'>
<input type="hidden" name="referer1" value="${referer1 }"/> <!-- 이전페이지 -->
<tr>
	<th>제목</th>
	<td colspan="3">
		<input type="text" name="title" style="width: 95%;" id="title" >
	</td>
</tr>

<tr>
	<th>작성자</th>
	<td colspan="3">
		<input type="text" name="id" size="50">
		<!--readonly value="${login.id }"  -->
	</td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea name="content" id="summernote" style="padding-left: 36%;"></textarea>
	</td>
</tr>

</table>

<div id="button.wrap">
	<span class="button blue">
		<button type="button" id="_btnWrite">저장</button>
	</span>
		<span class="button blue">
		<button type="button" id="_btnBack">목록</button>
	</span>
</div>

</form>    


<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "/productqna/pqnaanswerAf").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "/productqna/pqnalist";
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