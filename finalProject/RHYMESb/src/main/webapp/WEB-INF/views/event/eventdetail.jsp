<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>EventDetail</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/event/eventdetail.css">
</head>
<body>


<div align="center">
	<table class="list_table">
	
	<tr>
		<th colspan="2">${event.title }</th>
	</tr>
	<tr>
		<td colspan="2">
			<img alt="x" src="/upload/event/${event.photo_content }">
		</td>
	</tr>
	<tr>
	<c:if test="${nowdate <= enddate }">
		<c:if test="${not empty event.coupon_seq1 && event.coupon_seq1 != 0}">
			<c:if test="${event.coupon_title1!='출석체크쿠폰' || event.coupon_title1!='출석체크쿠폰' }">
				<td>					
					<img alt="x" src="/img/member-img/welcome_cp2.png" id="_couponimg" class="couponimg">
					&nbsp;&nbsp;<span id="_couponBtn" class="couponimg">download</span>
					
					<input type="hidden" id="cou_seq1" value="${event.coupon_seq1 }">
					<input type="hidden" id="userid" value="${userloginid }">
				</td>
			</c:if>
		</c:if>
		<c:if test="${not empty event.coupon_seq2 && event.coupon_seq2 != 0}">
			<c:if test="${event.coupon_title1!='출석체크쿠폰' || event.coupon_title1!='출석체크쿠폰' }">
				<td>				
					<img alt="x" src="/img/member-img/welcome_cp2.png" id="_couponimg" class="couponimg">
					&nbsp;&nbsp;<span id="_couponBtn" class="couponimg">download</span>
					
					<input type="hidden" id="cou_seq2" value="${event.coupon_seq2 }">
					<input type="hidden" id="userid" value="${userloginid }">
				</td>
			</c:if>
		</c:if>
		
		<!-- 출석체크 쿠폰 -->
		<c:if test="${not empty event.coupon_seq1 && event.coupon_seq1 != 0}">
			<c:if test="${event.coupon_title1=='출석체크쿠폰' || event.coupon_title1=='출석체크쿠폰' }">
				<td>
					<img alt="x" src="/img/member-img/cc_22.png" class="coupon_check" 
						style="position: relative;top: -400px;left: 279px;cursor: pointer;
								    box-shadow: 1px 1px 13px -4px; border-radius: 38px;">
					
					<input type="hidden" id="cou_seq1" value="${event.coupon_seq1 }">
					<input type="hidden" id="cou_title1" value="${event.coupon_title1 }">
					<input type="hidden" id="userid" value="${userloginid }">
				</td>	
			</c:if>
		</c:if>
		<c:if test="${not empty event.coupon_seq2 && event.coupon_seq2 != 0}">
			<c:if test="${event.coupon_title1=='출석체크쿠폰' || event.coupon_title1=='출석체크쿠폰' }">
				<td>
					<img alt="x" src="/img/member-img/cc_22.png" class="coupon_check"
						style="position: relative;top: -400px;left: 279px;cursor: pointer;
							box-shadow: 1px 1px 13px -4px; border-radius: 38px;">
					
					<input type="hidden" id="cou_seq1" value="${event.coupon_seq2 }">
					<input type="hidden" id="cou_title1" value="${event.coupon_title2 }">
					<input type="hidden" id="userid" value="${userloginid }">
				</td>	
			</c:if>
		</c:if>
		
	</c:if>
	</tr>	
	
	
	
	</table>
</div>

</body>


<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

$(document).ready(function(){

	// 커서변경
	$(".couponimg").mouseover(function(){
		$(this).css("cursor", "pointer");
	});
	
});

// 쿠폰 다운로드
$(".couponimg").click(function(){
	
	var userid = $("#userid").val();	// 유저 id
	var c_seq = $("#cou_seq1").val();	// 쿠폰번호

	if(userid==null||userid==''){	// 로그인이 안되어있다면
		alert("로그인이 필요합니다.");
		location.href="/member/login";
	}else{
		
		 $.ajax({
			type:"get",
			url:"/event/eventcoupon",
			data:"c_seq="+c_seq+"&userid="+userid,
			success:function(data){
				if(data=="ok"){
					alert("쿠폰이 발급되었습니다.");
				}
				else{
					alert("이미 발급받은 쿠폰입니다.");
				}
				
			},
			err: function(err){
				alert(err.status);
			}
				
		}); 
		
	}
	
});

// 출석체크 쿠폰 다운로드
$(".coupon_check").click(function(){
	var userid = $("#userid").val();	// 유저 id
	var c_title = $("#cou_title1").val();	// 쿠폰 이름
	var c_seq = $("#cou_seq1").val();	// 쿠폰번호

	if(userid==null||userid==''){	// 로그인이 안되어있다면
		alert("로그인이 필요합니다.");
		location.href="/member/login";
	}else{
		
		 $.ajax({
			type:"get",
			url:"/event/eventcoupon_check",
			data:"userid="+userid +"&comment="+c_title+"&seq="+c_seq,
			success:function(data){
				if(data=="ok"){
					alert("출석체크 완료!");
				}
				else{
					alert("이미 출석체크를 했습니다.");
				}
				
			},
			err: function(err){
				alert(err.status);
			}
				
		}); 
		
	}
	
});


</script>

</html>