<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
    


<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<form id="_frmForm" action="faquploadAf" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="seq" value="${pqnadto.seq }">
<input type="hidden" name="referer1" value="${referer1 }"/> <!-- 이전페이지 -->

<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">
<input type="hidden" name="p_seq" value="12434"/> <!-- 주문번호 -->
<tr>
	<th>제목</th>
	<td colspan="3">
		<input type="text" name="title" style="width: 95%;" id="title" value="${pqnadto.title }">
	</td>
</tr>

<tr>
	<th>작성자</th>
	<td colspan="3">
		<input type="text" name="id" size="50" value="${pqnadto.id }">
		<!--readonly value="${login.id }"  -->
	</td>
</tr>
<tr>
	<th>비밀글</th>
	<td colspan="3">
		<label for="secret" class="label_check">
		<input type="checkbox" id="secret" name="secret" value="1" <c:if test="${pqnadto.secret eq '1'}">checked</c:if>>
		비밀글
		</label>
	</td>
</tr>
<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea name="content" id="summernote" style="padding-left: 36%;" >${pqnadto.content }</textarea>
	</td>
</tr>

</table>

<div id="button.wrap">
	
		<button type="button" class="customer-btn1" id="_btnUpdate">저장</button>
	
		<button type="button" class="customer-btn1" id="_btnBack">목록</button>
	
</div>

</form>    


<script type="text/javascript">

$("#_btnUpdate").click(function () {

	$("#_frmForm").attr("action", "pqnaupdateAf").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "pqnalist";
});



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