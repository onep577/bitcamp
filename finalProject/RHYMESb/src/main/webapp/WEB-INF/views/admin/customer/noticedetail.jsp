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
			<h6 class="m-0 font-weight-bold text-primary">공지사항 detail</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

					<table style="width:100%;"class="table table-bordered">
					<col width="100"><col width="200"><col width="100"><col width="300">
					
					<tr>
						<th>제목</th>
						<td colspan="3">${noticedto.title }</td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td colspan="3">${noticedto.id }</td>
					</tr>
					
					<tr>
						<th>작성일</th>
						<td>${noticedto.wdate }</td>
						<th>조회수</th>
						<td>${noticedto.readcount }</td>
					</tr>
					<tr>
						<td colspan="4">
						<div style="white-space:pre-line;">
						<img alt="" src="/upload/customer/${noticedto.filename }" style="height: 30%">
						${noticedto.content }
						</td>
						</div>
					</tr>
					
					</table>
					
					
					<!-- 수정삭제버튼 -->
					
					<div>
					<!-- 코어태그 추가하기 -->
						
							<button type="button" class="clickBtn2" onclick="NoticeDelete('${noticedto.seq }')">삭제</button>
						
							<button type="button" class="clickBtn2" onclick="NoticeUpdate('${noticedto.seq }')">수정</button>
						
					
					</div>
					<br><br><br>
					<table style="width:100%;"class="table table-bordered">
					<col width="50"><col width="650">
					
					<!-- 이전글 -->
					<c:if test="${empty beforedto}">
					</c:if>
					<c:if test="${!empty beforedto}">
					<tr>
						<td >이전글<img alt="" src="../img/customer-img/up.png" height="18px;" width="18px;" align="right" style="padding-right: 5px"> </td>
						<td><a href="noticedetail?seq=${beforedto.seq}">${beforedto.title }</a></td>
					</tr>
					</c:if>
					
					
					<!-- 다음글 -->
					<c:if test="${empty afterdto}">
					</c:if>
					<c:if test="${!empty afterdto}">
					<tr>
						<td>다음글<img alt="" src="../img/customer-img/down.png" height="18px;" width="18px;" align="right" style="padding-right: 5px"></td>
						<td><a href="noticedetail?seq=${afterdto.seq}">${afterdto.title }</a></td>
					</tr>
					</c:if>
					</table>
				
			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->






</html>


<script type="text/javascript">

function NoticeDelete( seq ) {
	location.href = "noticedelete?seq=" + seq;
}
function NoticeUpdate( seq ) {
	location.href = "noticeupdate?seq=" + seq;
}

</script>    