<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<h1 class="h3 mb-2 text-gray-800">고객센터</h1>
	<p class="mb-4">공지사항</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">공지사항 글작성</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<form id="_frmForm" action="noticeupload" method="post" enctype="multipart/form-data">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<table style="width:100%;"class="table table-bordered">
				<col width="100"><col width="200"><col width="100"><col width="300">
				
				<tr>
					<th>제목</th>
					<td colspan="3">
						<input type="text" name="title" id="title" style="width: 95%;">
					</td>
				</tr>
				
				<tr>
					<th>작성자</th>
					<td colspan="3">
						<input type="text" name="id" size="50" value="${id }" readonly>
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					
					<td colspan="3">
						<textarea style="height: 268px;width: 1425px;" name="content" id="contents"></textarea>
					</td>
					
				</tr>
				
				<tr>
					<th>이미지</th>
					<td colspan="3">
						<input type="file" name="fileload" style="width: 400px">
					</td>
				</tr>
				
				
				
				</table>
				
				<div id="button.wrap">
						<button type="button" class="clickBtn2" id="_btnWrite">저장</button>
					
						<button type="button" class="clickBtn2" id="_btnBack">목록</button>
				</div>
				
				</form>

				

			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->






</html>



<script type="text/javascript">

$("#_btnWrite").click(function () {

	$("#_frmForm").attr("action", "noticeupload").submit(); //
});

$("#_btnBack").click(function () {

	location.href = "noticelist";
});


$(function () {
	//""없게
	$("#_btnWrite").mousedown(function() {
		if($("#title").val()==""){
			alert("제목을 입력해주세요");
			return;
		}else if($("#contents").val()==""){
			alert("내용을 입력해주세요");
			return;
		}
	});
});	


</script> 