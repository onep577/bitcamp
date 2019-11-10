<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>

<link rel="stylesheet" href="<%=ctx%>/css/admin/events/sub/points_give.css">
<!-- 자동완성기능 자바스크립트 파일 : js/admin/events/points_function.js -->

<div class="modal-dialog" role="document">
    <div class="modal-content" style="width:700px;">
		<div class="modal-header">
        	<h5 class="modal-title" id="pointsGiveModalLabel">적립금 지급</h5>
			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>
		<div class="modal-body">
			<div class="give-search-wrap"><!-- 검색영역시작 -->
				<div class="input-group">
	            	<input id="_search_mem_auto" class="form-control basicAutoComplete" type="text" 
	            	 data-url="myurl" autocomplete="off" placeholder="검색할 ID를 입력해 주세요.">
	            </div>
			</div><!-- 검색영역끝 -->
			
			<div class="give-member-wrap">
				<table class="table table-bordered table-hover" id="_tbl_points_give">
	                <thead>
	                    <tr role="row">
	                		<th class="sorting_asc" tabindex="0" style="width: 126px;">No</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">ID</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">구분</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">내용</th>
	                		<th class="sorting" tabindex="0" style="width: 211px;">금액</th>
	                	</tr>
	                </thead>
	                
                	<tbody id="_tbl_points_give_tbody">
                		<tr class="tbl_points_give_inform_nothing"><td colspan="5">검색을 통해 유저를 추가해 주세요</td></tr>	                	
               		</tbody>
                </table>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			<button type="button" class="btn btn-primary" id="_give_frm_btn_init" onclick="initPointGiveTable();">초기화</button>
			<button type="button" class="btn btn-primary" id="_give_frm_btn_save" onclick="insertPointsData();" disabled>적립금 지급</button>
		</div>
	</div>
</div>
	
</html>