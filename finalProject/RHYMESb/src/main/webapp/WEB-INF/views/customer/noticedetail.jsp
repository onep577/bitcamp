<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<table class="detail_table" style="line-height: 1.5em;">
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
	<div style="white-space:pre-line;" class="contentst" ><img alt="" src="/upload/customer/${noticedto.filename }" style="height: 30%">
	${noticedto.content }
	</td>
	</div>
</tr>

</table>



<table class="before_table">
<col width="50"><col width="650">

<!-- 이전글 -->
<c:if test="${empty beforedto}">
</c:if>
<c:if test="${!empty beforedto}">
<tr style="border-top: 3px solid #CFEC40; border-bottom: 1px solid #EFEFEF;">
	<td style="border-right: 1px solid #EFEFEF;">이전글<img alt="" src="/img/customer-img/up.png" height="18px;" width="18px;" align="right" style="padding-right: 5px"> </td>
	<td><a href="noticedetail?seq=${beforedto.seq}">${beforedto.title }</a></td>
</tr>
</c:if>


<!-- 다음글 -->
<c:if test="${empty afterdto}">
</c:if>
<c:if test="${!empty afterdto}">
<tr style="border-bottom: 3px solid #CFEC40;">
	<td style="border-right: 1px solid #EFEFEF;">다음글<img alt="" src="/img/customer-img/down.png" height="18px;" width="18px;" align="right" style="padding-right: 5px"></td>
	<td><a href="noticedetail?seq=${afterdto.seq}">${afterdto.title }</a></td>
</tr>
</c:if>
</table>

