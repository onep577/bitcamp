<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<% String ctx = request.getContextPath(); %>

<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx %>/css/member/mypage/content/orderlog.css">
<script type="text/javascript" src="<%=ctx %>/js/member/mypage/content/orderlog.js"></script>

</head>


<div class="body_wrap">
<div class="mypage_main_content_top">
	<div class="top_title mypage_main_content_title" align="left">
		<h3>주문 내역</h3>
	</div>
	<div class="top_term" id="_top_term" align="right">
		<select id="_search_cond_term">
			<option value="0" <c:if test="${pagingDto.cond eq 0}">selected</c:if>>전체 기간</option>
			<option value="1" <c:if test="${pagingDto.cond eq 1}">selected</c:if>>1년</option>
			<option value="2" <c:if test="${pagingDto.cond eq 2}">selected</c:if>>2년</option>			
		</select>
	</div>
	<br/><br/>
	<hr/>	
</div>

<div class="mypage_main_content_body">
	<div class="body_orderlog" align="left">
	<c:choose>		
	<c:when test="${fn:length(orderlogList) ne 0 }">
		<c:forEach items="${orderlogList }" var="orderlog">	
			<div class="body_orderlog_item">
				<div class="orderdate">
					<p>${fn:substring(orderlog.rdate,0,10) } (${fn:substring(orderlog.rdate,11,13) }시 ${fn:substring(orderlog.rdate,14,16) }분)</p>
				</div>
				<div class="order_detail">
					<div class="order_title" accesskey="${fn:substring(orderlog.payment_code,4,16) }">
						<div align="left" class="order_title_text"><h4>${orderlog.p_name }<c:if test="${orderlog.count > 1 }">&nbsp;외 ${orderlog.count - 1 }건</c:if></h4></div><!-- 주문한품목 -->
						<div align="right" class="order_title_ico"><i class="fas fa-angle-right"></i></div>
					</div>
					<hr/>				
					<div class="order_body">
						<div class="order_body_thumbnail">
							<img alt="" src="<%=ctx %>/upload/store/${orderlog.img }">
						</div>
						<div class="order_body_content">
							<table>
								<col width="100"><col width="100">
								<tr>
									<th>주문번호</th>
									<td>${fn:substring(orderlog.payment_code,4,16) }</td>
								</tr>
								<tr>
									<th>결제금액</th>
									<td><fmt:formatNumber value="${orderlog.totalprice }" pattern="###,###,###" />원</td>
								</tr>
								<tr>
									<th>주문상태</th>
									<td>${orderlog.payment_status }</td>
								</tr>
							</table>
						</div>
						<div class="order_body_btns" align="center">
							<c:choose>
								<c:when test="${orderlog.review_written == 'false' && orderlog.payment_status == '결제완료' }">
									<input type="button" class="btn btn-default btn_order_body btn_write_review" value="후기 쓰기"
									 	accesskey="${fn:substring(orderlog.payment_code,4,16) }"/><br>	
								</c:when>
								<c:when test="${orderlog.review_written == 'true' && orderlog.payment_status == '결제완료' }">
									<input type="button" class="btn btn-default btn_show_written_review" value="작성한 후기 보러가기"><br>	
								</c:when>
							</c:choose>							
							<input type="button" class="btn btn-default btn_order_body" onclick="location.href='/productqna/pqnawrite?p_seq=${orderlog.p_seq}'" value="1:1 문의">
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="mypage_paging orderlog_paging" align="center">
			<nav aria-label="Page navigation example">
			  <ul class="pagination">
			    <li class="page-item">
			      <a class="page-link" href="#" aria-label="Previous">
			        <span aria-hidden="true">&laquo;</span>
			        <span class="sr-only">Previous</span>
			      </a>
			    </li>
			    
			    <c:forEach begin="${pagingDto.firstNavIndex }" end="${pagingDto.lastNavIndex }" step="1" var="i">
			    	<li class="page-item"><a class="page-link page-num" href="#">${i }</a></li>
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
			<form action="<%=ctx%>/mypage/orderlog" id="_frm_paging">
				<input type="hidden" name="pageNum"  id="_frm_pageNum"><input type="hidden" name="cond" id="_frm_cond">
			</form>
		</div>
	</c:when>
	<c:otherwise>
		<div class="body_orderlog_item">
			<div class="inform_nothing">
				주문 내역이 없습니다.
			</div>
		</div>
	</c:otherwise>		
	</c:choose>
	</div>	
</div><!-- mypage_main_content_body끝 -->



</div><!-- body_wrap끝 -->

</html>