<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<% String ctx = request.getContextPath(); %>

<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>


<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/review.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/review.js"></script>

</head>
<div class="mypage_main_content_title" align="left">
	<h3 id="review_title">상품후기</h3>
	<div class="review_notice">
		<b>후기 작성 시 사진후기 100원, 글후기 50원을 적립해드립니다.</b><br>
		- 퍼플, 더퍼플은 <b>2배</b> 적립 (사진 200원, 글 100원)<br>- 주간 베스트 후기로 선정 시 <b>5,000원</b>을
		추가 적립<br>* 후기 작성은 배송 완료일로부터 30일 이내 가능합니다.
	</div>
</div>

<div class="review_main_wrap">
	<ul class="nav nav-tabs" id="review_main_nav_tab" role="tablist">
		<li class="nav-item review_main_nav_tab_item">
			<a class="nav-link active" id="waiting_items-tab" data-toggle="tab" href="#_waiting_items" role="tab" 
			aria-controls="_waiting_items" aria-selected="true">작성 가능 후기</a>
		</li>
		<li class="nav-item review_main_nav_tab_item">
			<a class="nav-link" id="written_reviews-tab" data-toggle="tab" href="#_written_reviews" role="tab" 
			aria-controls="_written_reviews" aria-selected="false">작성 완료 후기</a>
		</li>		
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">
		<!-- 작성가능후기 탭 시작 -->
		<div class="tab-pane active" id="_waiting_items" role="tabpanel" aria-labelledby="waiting_items-tab">
			<script type="text/javascript">getUnWrittenReviews(1);</script>
		</div><!-- 작성가능후기 탭 끝 -->
		
		
		
		<div class="tab-pane" id="_written_reviews" role="tabpanel" aria-labelledby="written_reviews-tab">
			<script type="text/javascript">getWrittenReviews(1);</script>
		</div><!-- 작성한후기 탭 끝 -->
	</div>
</div>
</html>