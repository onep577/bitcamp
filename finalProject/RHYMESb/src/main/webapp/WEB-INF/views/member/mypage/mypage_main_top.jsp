<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication property="principal" var="prc"/>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>


<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/mypage_main_top.css">

<body>

<!-- <div id="_mypage_wrap" class="mypage_wrap" align="center"> -->
	<div id="_mypage_top" class="mypage_top" align="center"><!-- 배경화면 -->
		<div id="_mypage_top_user" class="mypage_top_user" align="center"><!-- ul영역설정 -->
			<ul id="_mypage_top_list" class="mypage_top_list">
				<li id="_grade_user" class="grade_user mypage_top_list_item">
					<div id="_grade_user_summary" class="grade_user_summary">
						<div class="summary_special_offer_title">첫구매우대</div>
						<div class="summary_user_name"><a class="username">${prc.username }</a>님</div>
						<div class="summary_special_offer_content">5%적립+무료배송 (2만원 이상 주문 시)</div>
					</div>
					<div id="_grade_user_detail" class="grade_user_detail">
						<input type="button" class="btn btn-rhy-border" value="전체등급 보기">
						<input type="button" class="btn btn-rhy-border" value="다음 달 예상등급 보기">
					</div>
				</li>
				<li id="_points_user" class="points_user mypage_top_list_item">
					<a class="points_user_title">적립금</a>
					<a class="points_user_curr_point" href="<%=ctx %>/mypage/points">${totalPoints } 원&nbsp;&nbsp; <i class="fas fa-chevron-right"></i></a>
					<a class="points_user_exp_point">소멸 예정 ${expPoints }원</a>
				</li>
				<li id="_coupon_user" class="coupon_user mypage_top_list_item">
					<a class="coupon_user_title">쿠폰</a>
					<a class="coupon_user_content" href="<%=ctx %>/mypage/coupon">${validCoupons }개&nbsp;&nbsp; <i class="fas fa-chevron-right"></i></a>
				</li>
				<li id="_membership_user" class="membership_user mypage_top_list_item">
					<a class="membership_user_title">R패스</a>
					<a class="membership_user_content" href="#">알아보기&nbsp;&nbsp; <i class="fas fa-chevron-right"></i></a>
				</li>			
			</ul>	
		</div>	
	</div>

</body>
</html>