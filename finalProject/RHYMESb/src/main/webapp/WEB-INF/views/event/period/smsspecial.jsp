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

<script type="text/javascript" src="<%=request.getContextPath() %>/js/event/smsspecial.js"></script>

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
	<tr align="center" style="margin: auto;">
		<td colspan="2" align="center" style="margin: auto;">
			<form class="form-row">
				<div class="col"></div><div class="col"></div>
				<div class="col">				
					<input type="text" class="form-control" id="smsid" placeholder="SMS 아이디 입력">
				</div>
				<div class="col">
					<input type="button" class="form-control btn btn-primary" id="btnSubmit" disabled value="아이디 확인">
					<!-- <button class="btn btn-primary mb-2" disabled id="btnSubmit">아이디 확인</button> -->
				</div>
				<div class="col"></div><div class="col"></div>
			</form>
		</td>
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