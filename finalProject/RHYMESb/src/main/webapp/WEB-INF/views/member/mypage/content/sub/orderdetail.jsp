<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<sec:authentication var="user" property="principal" />
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<input type="hidden" id="_curr_user_id" value="${user.username }">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx %>/css/member/mypage/content/sub/orderdetail.css">
<script type="text/javascript" src="<%=ctx %>/js/member/mypage/content/sub/orderdetail.js"></script>

<div class="mypage_main_content_top">
	<div class="top_title" align="left">
		<h3>주문내역 상세 ${payment_code }</h3>
	</div><br/>
	<div class="top_sub_title" align="left">
		<h6>주문번호 : <a id="_payment_code">${payment_code }</a></h6>
	</div>	
	
</div>

<c:set var="isNonPaid" value="true"/><!-- 결제완료여부 확인 변수 -->

<div class="orderdetail_item_wrap order_sub_content_wrap"><!-- 주문한 상품목록 리스트 시작 -->
	<c:forEach items="${payDetailList }" var="detail">
		<div class="form-group">
			<div class="form-row orderdetail_item">
				<div class="col-md-2 detail-item-col">
					<img alt="" src="<%=ctx %>/upload/store/${detail.img }"/>
				</div>					
				<div class="col-md-6 detail-item-col">
					<div class="item_name"><a href="<%=ctx %>/store/productDetail?p_seq=${detail.p_seq }&c1_name=${detail.c1_name}&c2_name=${detail.c2_name}&c3_name=${detail.c3_name}"><h4>${detail.p_name }</h4></a></div>
					<div class="item_desc">
						<span><fmt:formatNumber value="${detail.p_price }" pattern="###,###,###" />원</span>
						<a>${detail.ea }개 구매</a>
					</div>					
				</div>
				<div class="col-md-2 detail-item-col">
					<div class="item_delivery_wrap">
				<!-- 결제가 완료되었으면 배송상태를 보여주고, 결제가 완료되지 않았으면 배송상태를 보여줌 -->
					<c:choose>
						<c:when test="${detail.payment_status == '결제완료' }">
							<c:set var="isNonPaid" value="false"/>
							<span>${detail.delivery_status }</span>
							<span><a href="#">${detail.delivery_post_code }</a></span>
						</c:when>
						<c:otherwise>
							<c:set var="isNonPaid" value="true"/>
							${detail.payment_status }
						</c:otherwise>
					</c:choose>
					</div>
				</div>				
				<div class="col-md-2 detail-item-col">
					<div class="item_btns_wrap">
						<c:if test="${detail.payment_status == '결제완료' }">
							<input type="button" class="btn btn-rhy-border" value="후기 쓰기"
							onclick="location.href='<%=ctx %>/mypage/review/writenew?seq=${detail.seq }';">
						</c:if>
						<input type="button" class="btn btn-rhy-border btn-add-oneitem" value="장바구니 담기"
						onclick="saveOneItemToBasket('${user.username }',${detail.s_seq});"/>
						<input type="hidden" id="_detail_s_seq_${detail.seq }" class="s_seq_number" value="${detail.s_seq }">
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="orderdetail_additional_wrap form-row" align="center"><div class="col-md-2"></div>			
		<div class="col-md-4"><input type="button" class="btn btn-rhy-full" value="전체 상품 다시 담기" id="_addAllToBasket"></div>
		<div class="col-md-4"><input type="button" class="btn btn-rhy-border" value="전체 상품 주문 취소" id="_canceOrder" ${isNonPaid == true?'':'disabled' }></div><div class="col-md-2"></div>
	</div>
	<div class="orderdetail_additional_wrap form-row" align="center">
		<span>직접 주문 취소는 '미결제'상태인 경우에만 가능합니다.</span>
	</div>
</div><!-- 주문한 상품목록 리스트 끝 -->

<div class="orderdetail_payment_info_wrap order_sub_content_wrap"><!-- 결제정보 시작 -->
	<div class="wrap_header_title">
		<h3>결제 정보</h3>
		<hr>
	</div>
	<div class="form-group" align="left">
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">총주문금액</div>
			<div class="col-md-6 payment_info_comp">${mPDto.totalprice }</div>
		</div>		
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">상품할인</div><!-- 특수프로모션상품인경우 자체할인 금액 -->
			<div class="col-md-6 payment_info_comp">${mPDto.disc_product}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">쿠폰할인</div>
			<div class="col-md-6 payment_info_comp">${mPDto.disc_coupon}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">적립금 사용</div>
			<div class="col-md-6 payment_info_comp">${mPDto.disc_point}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">배송비</div>
			<div class="col-md-6 payment_info_comp">${mPDto.delivery_price}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">결제금액</div>
			<div class="col-md-6 payment_info_comp">${mPDto.finalpaymentamount }</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">적립금액</div>
			<div class="col-md-6 payment_info_comp">${mPDto.add_point}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 payment_info_comp">결제수단</div>
			<div class="col-md-6 payment_info_comp">${mPDto.payment_method}</div>
		</div>
	</div>
</div><!-- 결제정보 끝 -->

<div class="orderdetail_order_info_wrap order_sub_content_wrap"><!-- 주문정보 시작 -->
	<div class="wrap_header_title">
		<h3>주문 정보</h3>
		<hr>
	</div>
	<div class="form-group" align="left">
		<div class="form-row">
			<div class="col-md-3 order_info_comp">주문번호</div>
			<div class="col-md-6 order_info_comp">${mPDto.payment_code}</div>
		</div>		
		<div class="form-row">
			<div class="col-md-3 order_info_comp">결제ID</div>
			<div class="col-md-6 order_info_comp">${mPDto.userid}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 order_info_comp">주문자 이름</div>
			<div class="col-md-6 order_info_comp">${mPDto.send_name}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 order_info_comp">결제일</div>
			<div class="col-md-6 order_info_comp">${mPDto.rdate}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 order_info_comp">주문 처리상태</div><!-- 결제상태 또는 배송상태 -->
			<div class="col-md-6 order_info_comp">
				<c:choose>
					<c:when test="${mPDto.payment_status == '미결제'}">${mPDto.payment_status}</c:when>
					<c:otherwise>${mPDto.delivery_status}</c:otherwise>					
				</c:choose>				
			</div>
		</div>
	</div>
</div><!-- 주문정보 끝 -->

<div class="orderdetail_delivery_info_wrap order_sub_content_wrap"><!-- 배송정보 시작 -->
	<div class="wrap_header_title">
		<h3>배송 정보</h3>
		<hr>
	</div>
	<div class="form-group" align="left">
		<div class="form-row">
			<div class="col-md-3 delivery_info_comp">받는 분</div>
			<div class="col-md-6 delivery_info_comp">${mPDto.receive_name}</div>
		</div>		
		<div class="form-row">
			<div class="col-md-3 delivery_info_comp">받는 분 핸드폰</div>
			<div class="col-md-6 delivery_info_comp">${mPDto.receive_phone}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 delivery_info_comp">우편번호</div>
			<div class="col-md-6 delivery_info_comp">${mPDto.receive_postnum}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 delivery_info_comp">주소</div>
			<div class="col-md-6 delivery_info_comp">${mPDto.receive_address}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 delivery_info_comp">배송 요청사항</div><!-- 결제상태 또는 배송상태 -->
			<div class="col-md-6 delivery_info_comp">${mPDto.delivery_request}</div>
		</div>
		<div class="form-row">
			<div class="col-md-3 delivery_info_comp">송장정보</div><!-- 결제상태 또는 배송상태 -->
			<div class="col-md-6 delivery_info_comp">
				<c:choose>
					<c:when test="${mPDto.delivery_post_code == '' or mPDto.delivery_post_code eq null}">${mPDto.payment_status}</c:when>
					<c:otherwise>${mPDto.delivery_company}${mPDto.delivery_post_code}</c:otherwise>					
				</c:choose>	
				
			</div>
		</div>
	</div>
</div><!-- 배송정보 끝 -->
<!-- <input type="button" value="3333" onclick="adjustFooterHeight();"/> -->

</html>