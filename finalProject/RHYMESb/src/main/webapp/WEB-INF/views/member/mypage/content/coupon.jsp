<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<!-- ajax 통신을 위한 meta tag -->
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
<link rel="stylesheet" href="/css/member/mypage/content/coupon.css">
<script type="text/javascript" src="<%=ctx%>/js/member/mypage/content/coupon.js"></script>
</head>
<div class="mypage_main_content_title" align="left">
	<h3>쿠폰</h3>
</div>

<div class="form-group">
	<div class="form-row regi_new_coupon">
		<div class="col-md-12" align="center">
			<div class="form-row">
				<div class="col-md-6" align="center">
					<input type="text" class="txt coupon_input" id="_txt_coupon_input" placeholder="쿠폰 번호를 입력해 주세요.">
				</div>
				<div class="col-md-3" align="center">
					<input type="button" class="btn btn-default coupon_input" id="_btn_regi_new_coupon" value="쿠폰 등록">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-12" align="left">
					<small id="_coupon_input_info">쿠폰에 하이픈("-")이 포함되어 있을경우 하이픈("-")을 반드시 입력해주세요.</small>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="form-group">
	<div class="form-row coupon_list">		
		<div class="col-md-12" align="center">
			<div class="form-row">
				<div class="col-md-9" align="left">
					<small id="_coupon_list_info">쿠폰에 적용 대상 상품이 명시되어 있는 경우, 해당 상품 구매 시에만 사용이 가능합니다.</small>
				</div>
				<div class="col-md-3" align="right">
					<small id="_coupon_list_amount">사용가능 쿠폰 : ${validCoupons }장</small>
				</div>
			</div>
			<div class="form-row coupon_table_head tbl-rhy-head">
				<div class="col-md-7" align="center">
					쿠폰명
				</div>
				<div class="col-md-1" align="center">
					기능
				</div>
				<div class="col-md-1" align="center">
					할인/적립
				</div>
				<div class="col-md-2" align="center">
					사용가능기간
				</div>
				<div class="col-md-1" align="center">
					사용여부
				</div>
			</div>
			<c:choose>
				<c:when test="${empty couponDetailList }">
					<div class="form-row coupon_table_body tbl-rhy-body">
						<div class="col-md-12" align="center">							
							<p class="txt_coupon_info">보유 중인 쿠폰이 없습니다.</p>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${couponDetailList }" var="cpn">
						<div class="form-row coupon_table_body tbl-rhy-body">
							<div class="col-md-7" align="center">
								<p class="txt_coupon_info">${cpn.title }</p>
								<small class="txt_coupon_info_sub form-text text-muted">${cpn.sub_title }</small>
								<small class="txt_coupon_info_sub form-text text-muted">${cpn.coup_code }</small>
							</div>
							<div class="col-md-1" align="center">
								${cpn.func }
							</div>
							<div class="col-md-1" align="center">
								<c:choose>
									<c:when test="${cpn.func_measure == '원' }">
										<fmt:formatNumber value="${cpn.func_num}" type="number" />${cpn.func_measure }
									</c:when>
									<c:otherwise>
										${cpn.func_num }${cpn.func_measure }	
									</c:otherwise>
								</c:choose>								
							</div>
							<div class="col-md-2" align="center">
								${fn:substring(cpn.gdate,2,11) } ~ ${fn:substring(cpn.expdate,2,11) } 
							</div>
							<div class="col-md-1" align="center">
								${cpn.isused }
								<c:if test="${cpn.isused == '만료' || cpn.isused == '사용'}">
									<input type="button" value="삭제" class="btn-delete-item" onclick="deleteCouponInList(${cpn.seq});">									
								</c:if>
							</div>
						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			
		</div>
	</div>
</div>


	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	    
	    <c:forEach begin="${pDto.firstNavIndex }" end="${pDto.lastNavIndex }" step="1" var="i">
	    	<li class="page-item"><a class="page-link" href="<%=ctx %>/mypage/coupon?pageNum=${i}#_mypage_top">${i }</a></li>
	    </c:forEach>
	    
	    
	    <!-- <li class="page-item"><a class="page-link" href="#">2</a></li>
	    <li class="page-item"><a class="page-link" href="#">3</a></li> -->
	    <li class="page-item">
	      <a class="page-link" href="#" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>


</html>