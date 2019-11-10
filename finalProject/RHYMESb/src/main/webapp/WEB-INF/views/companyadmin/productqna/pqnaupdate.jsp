<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/customer/customerlist.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>content_main</title>

</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품문의 관리</h1>
	<p class="mb-4">상품문의</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품문의 수정</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<form id="_frmForm" action="faquploadAf" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="hidden" name="seq" value="${pqnadto.seq }">
				<input type="hidden" name="referer1" value="${referer1 }"/> <!-- 이전페이지 -->
				
				<table style="width:100%;"class="table table-bordered">
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
						<input type="text" name="id" value="${pqnadto.id }" readonly>
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
					<span class="button blue">
						<button type="button" class="clickBtn2" id="_btnUpdate">저장</button>
					</span>
						<span class="button blue">
						<button type="button" class="clickBtn2" id="_btnBack">목록</button>
					</span>
				</div>
				
				</form> 

			</div>
		</div>
	</div>

</div>


</html>

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