<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<script type="text/javascript" src="<%=ctx%>/js/admin/events/sub/coupon_make_new.js"></script>

<div class="modal-dialog" role="document">
    <div class="modal-content">
		<div class="modal-header">
        	<h5 class="modal-title" id="_coupon_make_new_Modal_Label"><b>새 쿠폰 생성</b></h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<form id="_coup_detail_info" onkeydown="if(event.keyCode==13)return false;">
				<div class="row coup-make-row">
					<div class="col-md-8">
						<label for="_coup_name"><b>쿠폰이름</b></label>
						<input type="text" class="form-control" id="_coup_name" aria-describedby="_coup_name_desc" placeholder="쿠폰이름">
    					<small id="_coup_name_desc" class="form-text text-muted">새로이 생성할 쿠폰의 이름</small>
					</div>	
				</div>
				<div class="row coup-make-row">
					<div class="col-md-12">
						<label for="_coup_content"><b>쿠폰내용</b></label>
						<input type="text" class="form-control" id="_coup_content" aria-describedby="_coup_content_desc" placeholder="쿠폰내용">
    					<small id="_coup_content_desc" class="form-text text-muted">쿠폰에 대한 간단한 설명</small>
					</div>	
				</div>
				<div class="row coup-make-row">
					<div class="col-md-6">
						<label for="_coup_cate"><b>구분</b></label>
						<select id="_coup_cate" class="form-control is-valid custom-select">
							<option value="ALL">ALL</option>
							<option value="MEN">남성</option>
							<option value="WOMEN">여성</option>
						</select>
    					<small id="_coup_cate_desc" class="form-text text-muted">쿠폰을 사용할 수 있는 상품 카테고리</small>
					</div>
					<div class="col-md-6">
						<label for="_coup_exptime"><b>유효기간(월)</b></label>
						<select id="_coup_exptime" class="form-control is-valid custom-select">
							<c:forEach var="i" begin="1" step="1" end="12">
								<option value="${i }">${i }</option>
							</c:forEach>
							<option value="24">24</option>
							<option value="36">36</option>
						</select>
    					<small id="_coup_exptime_desc" class="form-text text-muted">1(1달)부터 36(3년)까지 선택</small>
					</div>
				</div>
				<div class="row coup-make-row">
					<div class="col-auto">
						<label for="_coup_function"><b>기능</b></label>
						<input type="hidden" value="" class="form-control" id="_coup_function" aria-describedby="_coup_function_desc" placeholder="자동 지정됩니다.">
						<select id="_coup_function_func" class="form-control is-valid custom-select">
							<option value="할인">할인</option><option value="적립">적립</option>
						</select>
						<small id="_coup_function_desc" class="form-text text-muted">쿠폰이 갖는 기능</small>
					</div>
					<div class="col-auto">
						<label for="_coup_function_func_num">&nbsp;</label>
						<div class="input-group mb-2">
							<input type="number" id="_coup_function_func_num" class="form-control">
							<div class="invalid-tooltip" id="_measure_feedback"></div>							
							<div class="input-group-prepend">
								<select id="_coup_function_func_measure" class="form-control is-valid custom-select">
									<option value="원">원</option><option value="%">%</option>
								</select>								
        					</div>        					
      					</div>      					
					</div>
				</div>
        	</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" id="_save_coup_detail_info" disabled>저장</button>
		</div>
	</div>
</div>
	
</html>