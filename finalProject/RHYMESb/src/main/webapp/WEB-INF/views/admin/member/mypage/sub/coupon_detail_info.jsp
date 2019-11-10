<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<div class="modal-dialog" role="document">
    <div class="modal-content">
		<div class="modal-header">
        	<h5 class="modal-title" id="exampleModalLabel">쿠폰 상세정보 조회</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<form id="_coup_detail_info" onkeydown="if(event.keyCode==13)return false;">
				<div class="row coup-detail-row">
					<div class="col-md-8">
						<label for="_coup_reg_code">쿠폰코드</label>
						<input type="text" readonly class="form-control" id="_coup_reg_code" aria-describedby="_coup_reg_code_desc" placeholder="쿠폰코드">
    					<small id="_coup_reg_code_desc" class="form-text text-muted"></small>
					</div>	
				</div>
				<div class="row coup-detail-row">
					<div class="col-md-4">
						<label for="_coup_reg_id">등록ID</label>
						<input type="text" class="form-control" id="_coup_reg_id" aria-describedby="_coup_reg_id_desc" placeholder="쿠폰을 지급할 ID 입력.">
    					<small id="_coup_reg_id_desc" class="form-text text-muted">쿠폰지급</small>
					</div>
					<div class="col-md-4">
						 <label for="_coup_reg_rdate">등록일</label>
						<input type="text" readonly class="form-control" id="_coup_reg_rdate" aria-describedby="_coup_reg_rdate_desc" placeholder="자동 지정됩니다.">
    					<small id="_coup_reg_rdate_desc" class="form-text text-muted"></small>
					</div>
					<div class="col-md-4">
						 <label for="_coup_reg_expdate">만료일</label>
						<input type="text" readonly class="form-control" id="_coup_reg_expdate" aria-describedby="_coup_reg_expdate_desc" placeholder="자동 지정됩니다.">
    					<small id="_coup_reg_expdate_desc" class="form-text text-muted"></small>
					</div>
				</div>
				<div class="row coup-detail-row">
					<div class="col-md-4">
						<label for="_coup_reg_isused">사용여부</label>
						<input type="text" readonly class="form-control" id="_coup_reg_isused" aria-describedby="_coup_reg_isused_desc" placeholder="">
    					<small id="_coup_reg_isused_desc" class="form-text text-muted">사용/미사용</small>
					</div>
					<div class="col-md-4">
						 <label for="_coup_reg_usedid">사용자ID</label>
						<input type="text" readonly class="form-control" id="_coup_reg_usedid" aria-describedby="_coup_reg_usedid_desc" placeholder="">
    					<small id="_coup_reg_usedid_desc" class="form-text text-muted">쿠폰을 사용한 회원의 ID</small>
					</div>
					<div class="col-md-4">
						 <label for="_coup_reg_useddate">사용일</label>
						<input type="text" readonly class="form-control" id="_coup_reg_useddate" aria-describedby="_coup_reg_useddate_desc" placeholder="">
    					<small id="_coup_reg_useddate_desc" class="form-text text-muted">쿠폰을 사용한 날짜</small>
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