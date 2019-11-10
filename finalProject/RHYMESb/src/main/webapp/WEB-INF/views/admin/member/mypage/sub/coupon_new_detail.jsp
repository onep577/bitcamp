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
        	<h5 class="modal-title" id="exampleModalLabel">새 쿠폰코드 추가</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<form id="_detail_frm" onkeydown="if(event.keyCode==13)return false;">
				<dl class="row">
					<dt class="col-sm-6">쿠폰 이름</dt>
					<dd class="col-sm-6"><p class="curr-coup-name"></p></dd>
					
					<dt class="col-sm-6">현재 발행된 쿠폰 수</dt>
					<dd class="col-sm-6"><p class="curr-coup-amount"></p></dd>
						
					<dt class="col-sm-12 dt-hr"><hr/><br></dt>
					
					<dt class="col-sm-6">새로 발행할 쿠폰 수</dt>
					<dd class="col-sm-6">
						<select id="_coup_amount_select" name="newcouponamount">
							<option value="">선택</option>
							<option value="10">10</option>
							<option value="25">25</option>
							<option value="50">50</option>
							<option value="100">100</option>
							<option value="0" class="custom-num">직접입력</option>
						</select>
						<input type="hidden" id="_coup_amount_num" size="3">
					</dd>				
				</dl>
				<input type="hidden" name="c_seq" id="_c_seq" value=""><!-- 쿠폰고유값(seq) -->
        	</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary" id="_newcoup_btn_save" disabled>저장</button>
		</div>
	</div>
</div>
	
</html>