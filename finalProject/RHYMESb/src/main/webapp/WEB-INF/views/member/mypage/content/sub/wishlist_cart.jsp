<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<!-- 장바구니 담기 모달 -->

<div class="modal-header">
      	<h5 class="modal-title" id="_wishlist_add_item_cart">장바구니 담기</h5>
	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<div class="modal-body">
	<div class="cart-one-item-wrap">
		<div class="form-row wishlist_row">
			<div class="col-md-2 cart_one_item_img" align="left">
				<img src="<%=ctx %>/upload/store/${pDto.photo1_file}" onerror="this.src='https://i.ytimg.com/vi/vWMCCZEkrKg/maxresdefault.jpg'">
			</div>
			<div class="col-md-6 cart_one_item_desc">
				<div class="form-row"><h5>${pDto.PName }</h5></div>				
				<div class="form-row">CATEGORY : ${pDto.c1_name }&nbsp;${pDto.c2_name }&nbsp;${pDto.c3_name }</div>
				<div class="form-row">COLOR : ${pDto.PColor }</div>
				<div class="form-row">PRICE : <fmt:formatNumber value="${pDto.PPrice }" pattern="###,###,###" />원</div>
			</div>
			<div class="col-md-4 cart_one_item_info">
				<div class="form-row"><h5>사이즈</h5></div>
				<input type="hidden" id="_pdto_pseq" value="${pDto.PSeq }">
				<c:forEach items="${sizeList }" var="size" varStatus="vs">
					<div class="cart_one_item_info_input_wrap">
					<input type="radio" name="sizeRadio" class="choose-size" id="_choose_size${vs.count }" value="${size.size }"
						${size.quantity == 0 ? "disabled" : "" }>
					<label for="_choose_size${vs.count }" class="size-label">${size.size }</label>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
<div class="modal-footer">
	<button type="button" class="btn btn-secondary" data-dismiss="modal" id="_cart_one_item_btn_close">닫기</button>
	<button type="button" class="btn btn-primary" id="_cart_one_item_btn_add" disabled>장바구니 담기!</button>
</div>

</html>