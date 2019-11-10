<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
    
<form id="_frmForm" action="qnaupload" method="post" enctype="multipart/form-data">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="seq" value="${qna.seq }">
    
<table class="detail_table">
<col width="100"><col width="200"><col width="100"><col width="300">

<tr>
	<th rowspan="2">제목</th>
	<td colspan="3">
		<select id="category" name="category">
		  <option value="" selected="selected">선택</option>
		  <option value="배송문의" <c:if test="${qna.category eq '배송문의'}">selected</c:if>>배송문의</option>
	      <option value="취소/교환/반품" <c:if test="${qna.category eq '취소/교환/반품'}">selected</c:if>>취소/교환/반품</option>
	      <option value="주문결제문의" <c:if test="${qna.category eq '주문결제문의'}">selected</c:if>>주문결제문의</option>
	      <option value="회원정보문의" <c:if test="${qna.category eq '회원정보문의'}">selected</c:if>>회원정보문의</option>
	      <option value="쿠폰/적립금" <c:if test="${qna.category eq '쿠폰/적립금'}">selected</c:if>>쿠폰/적립금</option>
	      <option value="서비스 이용 및 기타" <c:if test="${qna.category eq '서비스 이용 및 기타'}">selected</c:if>>서비스 이용 및 기타</option>
		</select>
	</td>
	
</tr>
	<td colspan="3">
		<input type="text" name="title" id="title" style="width: 95%;" value="${qna.title }">
	</td>
<tr>

</tr>
<tr>
	<th>주문번호</th>
	<td>주문번호선택</td>
</tr>
<tr>
	<th>작성자</th>
	<td colspan="3">
		<input type="text" name="id" size="100%" value="${qna.id }">
		<!--readonly value="${login.id }"  -->
	</td>
</tr>

<tr>
	<th>내용</th>
	<td colspan="3">
		<textarea style="height:268px;width:1025px;" name="content" id="content">${qna.content }</textarea>
	</td>
</tr>

<tr>
	<th>이미지</th>
	<td colspan="3">
	<input type="hidden" name="filename" value="${qna.filename }">
		${qna.filename }
	</td>
</tr>
<tr>
	<th>변경할이미지</th>
	<td colspan="3">
		<input type="file" name="file1" style="width: 400px">
	</td>
</tr>

</table>

<div id="button.wrap">
	<span class="button blue">
		<button type="button" class="customer-btn2" id="_btnUpdate">수정</button>
	</span>
		<span class="button blue">
		<button type="button" class="customer-btn2" id="_btnBack">목록</button>
	</span>
</div>
</form>


<script type="text/javascript">

$("#_btnUpdate").click(function () {

	$("#_frmForm").attr("action", "qnaupdateAf").submit(); //
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

