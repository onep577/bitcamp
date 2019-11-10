<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%String ctx = request.getContextPath() + ""; %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/css/member/mypage/content/personalform.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/personalform.js"></script>
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/personalform_save.js"></script>

<!-- 
params
${param.role } : 권한
${param.userid }
${param.username}
${param.postcode}
${param.address}
${param.detailAddress}
${param.phone}
${param.useremail}
${param.usergender}
${param.userbirth}
${param.count}
 --> 

<c:choose>
	<c:when test="${param.role eq 'member' }">		
		<!-- 일반회원인 경우 -->
		<div class="mem_p_wrap">
		<form id="_frm_mypage_personal" name="frm_mypage_personal">
		<div class="form-group confirm_frm_wrap">
			<div class="form_head_info" align="left">
				<div class="form-row">
					<div class="col-md-12">
						<h3>기본정보</h3>
					</div>
				</div>
				<div class="form-row"><div class="col-md-12"><hr/></div></div>
				<div class="form-row">
					<label for="_id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-md-6">						
		      			<input type="text" class="form-control" id="_userid" value="${param.userid }" readonly="readonly">		      			
					</div>
				</div>
				<div class="form-row">
					<label for="_userpw" class="col-sm-2 col-form-label">새 비밀번호</label>
					<div class="col-md-6"><!-- <label for="_userpw">비밀번호</label> -->						
		      			<input type="password" class="form-control" name="userpw" id="_userpw" placeholder="새로운 비밀번호를 입력해 주세요.">		      			
					</div>					
				</div>
				<div class="form-row">
					<label for="_userpwConfirm" class="col-sm-2 col-form-label">새 비밀번호 확인</label>					
					<div class="col-md-6"><!-- <label for="_userpwConfirm">비밀번호 확인</label> -->
		      			<input type="password" class="form-control" name="userpwConfirm" id="_userpwConfirm" placeholder="비밀번호를 한번 더 입력해 주세요.">
		      			<div class="invalid-tooltip">두 비밀번호가 일치하지 않습니다.</div>
					</div>
				</div>
				<div class="form-row">
					<label for="_username" class="col-sm-2 col-form-label">이름</label>
					<div class="col-md-6"><!-- <label for="_username">이름</label> -->
					<input type="text" class="form-control" name="username" id="_username" value="${param.username }">
					</div>
				</div>
				<div class="form-row">
					<label for="_postcode" class="col-sm-2 col-form-label">주소</label>				
					<div class="col-md-4"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="text" class="form-control" name="postcode" id="_postcode" value="${param.postcode }">		      			
					</div>
					<div class="col-md-2"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="button" class="btn btn-rhy-full" id="btn_search_address" value="주소검색" onclick="sample6_execDaumPostcode();">		      			
					</div>
				</div>
				<div class="form-row row_address">
					<label for="_address" class="col-sm-2 col-form-label">  </label>				
					<div class="col-md-6"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="text" class="form-control" name="address" id="_address" value="${param.address }">		      			
					</div>
				</div>
				<div class="form-row row_address">
					<label for="_detailAddress" class="col-sm-2 col-form-label"> </label>				
					<div class="col-md-6"><!-- <label for="_postcode">주소</label> -->						
		      			<input type="text" class="form-control" name="detailAddress" id="_detailAddress" value="${param.detailAddress}">		  
		      			<input type="hidden" id="_extraAddress" name="extraAddress" placeholder="참고항목">    			
					</div>
				</div>
				<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/personalform_map.js"></script>
				
				
				<div class="form-row">
					<label for="form_phone_wrap" class="col-sm-2 col-form-label">전화번호</label>
					<div class="col-md-8"><!-- <label for="_phone_1">전화번호</label> -->						
		      			<input type="hidden" class="form-control" name="phone" id="_phone" value="${param.phone }">		      			
		      			<div class="_form_phone_wrap" id="form_phone_wrap">		      			
			      			<input type="text" class="form-control" id="_phone_1" value="${fn:substring(param.phone,0,3) }" size="3" maxlength="3">
			      			<a>-</a><input type="text" class="form-control" id="_phone_2" value="${fn:substring(param.phone,3,7) }" size="3" maxlength="4">
			      			<a>-</a><input type="text" class="form-control" id="_phone_3" value="${fn:substring(param.phone,7,fn:length(param.phone)) }" size="3" maxlength="4">
		      			</div>
		      		</div>
				</div>
				<div class="form-row">
					<label for="_useremail" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-md-6"><!-- <label for="_useremail">이메일</label> -->						
		      			<input type="text" class="form-control" name="useremail" id="_useremail" value="${param.useremail }">		      					      			
					</div>					
				</div>
				<div class="form-row">
					<div class="col-md-12">
						<br><h3>추가정보</h3>
					</div>
				</div>	
				<div class="form-row"><div class="col-md-12"><hr/></div></div>
				<div class="form-row">
					<label for="form_gender_wrap" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-md-6"><!-- <label for="_gender">성별</label> -->
						<input type="hidden" id="origin_gender" value="${param.usergender }">
						<div class="_form_gender_wrap" id="form_gender_wrap">
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="_gen_male" name="gender" class="custom-control-input" value="male">
								<label class="custom-control-label" for="_gen_male">남성</label>
							</div>							
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="_gen_female" name="gender" class="custom-control-input" value="femail">
								<label class="custom-control-label" for="_gen_female">여성</label>
							</div>
							<div class="custom-control custom-radio custom-control-inline">
								<input type="radio" id="_gen_none" name="gender" class="custom-control-input" value="none">
								<label class="custom-control-label" for="_gen_none">선택 안함</label>
							</div>
						</div>		      			
					</div>		
				</div>
				
				<div class="form-row">
					<label for="form_gender_wrap" class="col-sm-2 col-form-label" style="margin-top: 12px;">생일</label>
					<div class="col-md-6"><!-- <label for="_birth">생일</label> -->
						<div class="_form_birth_wrap" id="form_birth_wrap">
							<input type="hidden" class="form-control" name="birth" id="_birth" value="${param.userbirth }">
							<input type="text" class="birth_txt" id="_birth_txt_1" placeholder="yyyy" value="${fn:substring(param.userbirth,0,4) }" maxlength="4">
							<a>/</a><input type="text" class="birth_txt" id="_birth_txt_2" placeholder="mm" value="${fn:substring(param.userbirth,4,6) }" maxlength="2">
							<a>/</a><input type="text" class="birth_txt" id="_birth_txt_3" placeholder="dd" value="${fn:substring(param.userbirth,6,fn:length(param.userbirth)) }" maxlength="2">
						</div>		      					      			
					</div>				
				</div>
				
				<div class="form-row form_btn_wrap">
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<input type="button" class="btn btn-rhy-border" value="회원탈퇴" data-toggle="modal" data-target="#_leave_confirm">
					</div>
					<div class="col-md-3">
						<input type="button" class="btn btn-rhy-full" id="_btn_save_modified_info" value="저장" disabled>
					</div>
					<div class="col-md-3"></div>
				</div>
			</div>			
		</div>
		</form>
		</div>
	</c:when>
	<c:otherwise>
		기업회원입니다.
	</c:otherwise>
</c:choose>

<!-- Modal -->
<div class="modal fade" id="_leave_confirm" tabindex="1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<form name="frm_leave_confirm" onsubmit="return false;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">회원탈퇴 확인</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="leave_modal_info" align="left">
					<p>회원탈퇴 작업이 완료되면 보유하고 있던 모든 쿠폰과 적립금은 삭제되며, 되돌릴 수 없습니다.</p>
					<p>아래 비밀번호 확인 입력란에 비밀번호를 입력하고 회원탈퇴 버튼을 클릭해 주세요.</p>
				</div>
				<div class="leave_modal_info_confirmpw">
					<input type="password" id="_txt_leave_confirmpw" name="txt_leave_confirmpw" class="form-control" placeholder="비밀번호를 입력해 주세요." onkeydown="frm_leave(event);">
					<div class="invalid-tooltip" id="_txt_leave_confirmpw_tooltip">비밀번호가 일치하지 않습니다.</div>
				</div>
			</div>
			<div class="modal-footer" align="center">
				<div class="leave_modal_btns_confirmpw">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-danger" disabled id="_btn_leave_confirm">회원탈퇴</button>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>




</html>