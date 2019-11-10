<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<% String ctx = request.getContextPath(); %>
<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">
<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>


<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="/css/member/mypage/content/personal.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/personal.js"></script>
</head>
<div class="mypage_main_content_title" align="left">
	<h3>개인 정보 수정</h3>
	<hr class="hr-rhy-title">
</div>

<sec:authentication property="principal" var="prc"/>
<div class="confirm_wrap">
<c:choose>
	<c:when test="${empty confirmed }">
		<!-- 비밀번호 재확인 전 (세션정보 조회) -->
		<div class="form-group confirm_frm_wrap">
			<div class="form_head_info">
				<div class="form-row">
					<div class="col-md-12" align="center">
						<h3>비밀번호 재확인</h3>
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-12" align="center">
						회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 입력해주세요.
					</div>
				</div>
			</div>
			<form method="post" name="frm_confirm_mem" onsubmit="return false;">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="form-row form_reconfirm box-rhy-gray">
				<div class="col-md-12" align="center">
					<div class="form-row">
						<div class="col-md-3" align="center">
							<p>아이디</p>
							<p name="userid">${prc.username }</p>
						</div>
					</div>
					<div class="form-row">
						<div class="col-md-3" align="center">
							<p>비밀번호</p>
							<input type="password" id="_input_pw" class="form-control" name="userpw" onkeydown="frm_ent(event)">
							<div class="invalid-feedback">
						    	비밀번호를 확인해 주세요.
						    </div>
						</div>
					</div>			
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-12" align="center">
					<input type="button" id="_btn_confirm_mem" class="btn btn-rhy-full btn_reconfirm_submit" value="확인">
				</div>
			</div>
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<!-- 비밀번호 재확인 후 jquery를 통해 jsp파일 load -->		
		<div>
			
		</div>
	</c:otherwise>
</c:choose>
</div>


</html>