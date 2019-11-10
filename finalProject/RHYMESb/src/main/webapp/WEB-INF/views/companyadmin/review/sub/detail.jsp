<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<!-- 판매처 ADMIN - 리뷰 디테일 -->

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">상품 후기 상세보기</h1>
	<p class="mb-4"></p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
				<a href="<%=ctx%>/admin/productreview/showlist">상품후기</a>&nbsp;<i class="fas fa-angle-right"></i>
				<a hreef="#">후기 상세</a>
			</h6>
		</div>
		<div class="card-body">
			<c:choose>
				<c:when test="${aRDto eq null or empty aRDto }">
					로딩 중 오류가 발생했습니다.
				</c:when>
				<c:otherwise>
					<div class="form-group row">
						<h3 class="col-sm-12">상품 정보</h3>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">상품 이름</label>
						<label class="col-sm-6 col-form-label">${aRDto.p_name }</label>
					</div>
					<div class="form-group row">
						<label class="col-sm-2 col-form-label">상품 설명</label>
						<label class="col-sm-6 col-form-label">${aRDto.p_title }</label>						
					</div>					
					<div class="form-group row">
							<label class="col-sm-2 col-form-label">상품코드</label>
							<label class="col-sm-4 col-form-label">${aRDto.cp_code }</label>
							<label class="col-sm-2 col-form-label">재고 수량</label>
							<label class="col-sm-4 col-form-label">${aRDto.quantity }</label>							
					</div>
					<div class="form-group row"><div class="col-sm-12"><hr style="border: 1px solid #efefef;"></div></div>
					<div class="form-group row"></div>
					<form>
						<div class="form-group row">
							<h3 class="col-sm-12">후기 정보</h3>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">작성자ID</label>
							<label class="col-md-4 col-form-label">${aRDto.userid }</label>
							<label class="col-sm-2 col-form-label">좋아요 수</label>
							<label class="col-md-4 col-form-label">${aRDto.likes_cnt }</label>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">작성일</label>
							<label class="col-sm-4 col-form-label">${aRDto.rdate }</label>
							<label class="col-sm-2 col-form-label">색상</label>
							<label class="col-md-4 col-form-label">${aRDto.p_color }</label>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-label">사이즈</label>
							<label class="col-md-4 col-form-label">${aRDto.size }</label>
							<label class="col-sm-2 col-form-label">수량</label>
							<label class="col-sm-4 col-form-label">${aRDto.ea }</label>							
						</div>				
						<div class="form-group row">
							<label for="_review_detail_title" class="col-sm-2 col-form-label">리뷰 제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="_review_detail_title" readonly value="${aRDto.title }">
							</div>
						</div>
						<div class="form-group row">
							<label for="_review_detail_content" class="col-sm-2 col-form-label">리뷰 내용</label>
							<div class="col-sm-10">
								<div id="_review_detail_content">${aRDto.content }</div>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

</div>

<!-- /.container-fluid -->

</html>