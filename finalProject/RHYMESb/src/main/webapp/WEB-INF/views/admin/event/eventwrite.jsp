 <%@page import="java.util.Calendar"%>
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
<title>content_main</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/event/eventwrite.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">EVENT</h1>
	<p class="mb-4">이벤트 관리</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">이벤트 작성</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
			<div id="_left">
			<form action="/admin/event/eventwrite" id="_frm" method="post" enctype="multipart/form-data">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<table border="1">
				<tr>
					<th>제목</th>
					<td colspan="5">
						<input type="text" name="title" required class="inputtext" style="width: 800px">
					</td>
				</tr>
				<tr>
					<th>종류</th>
					<td colspan="5">
						<select name="type" class="inputtext">
							<option value="기타">기타</option>
							<option value="할인이벤트">할인이벤트</option>
							<option value="적립이벤트">적립이벤트</option>
						</select>
					</td> 
				</tr>
				<tr>
					<th>쿠폰</th>
					<td colspan="5" id="coupontag">
						<button type="button" id="_coupon" class="eventBtn">쿠폰추가</button>
						<span id="input_coupon" class="input_coupon"></span>
							<input type="hidden" name="coupon_title1" id="_coupon_title1">
							<input type="hidden" name="coupon_title2" id="_coupon_title2">
							<input type="hidden" name="coupon_seq1" id="_seq1" value="0">
							<input type="hidden" name="coupon_seq2" id="_seq2" value="0">
					</td>
				</tr>
				<tr>
					<th>시작일</th>
					<td colspan="5">
					<select name="syear" class="inputselect">
						<c:forEach begin="${tyear }" end="${tyear+6 }" var="yyyy">
							<option <c:out value="${tyear == yyyy? 'selected=selected':'' }"/> value="${yyyy }">${yyyy }</option>
							</c:forEach>
						</select>&nbsp;년&nbsp;&nbsp;
						
						<select name="smonth" class="inputselect">
						<c:forEach begin="1" end="12" var="mm">
							<option <c:out value="${tmonth == mm? 'selected=selected':'' }"/> value="${mm }" >${mm }</option>
						</c:forEach>
						</select>&nbsp;월&nbsp;&nbsp;
						
						<select name="sday" class="inputselect">
						<c:forEach begin="1" end="${monthMax }" var="dd">
							<option <c:out value="${tday == dd? 'selected=selected':'' }"/> value="${dd }">${dd }</option>
						</c:forEach>
						</select>&nbsp;일
						</td>
					</tr>
					<tr>
					<th>종료일</th>
					<td colspan="5">	
					<select name="eyear" class="inputselect">
						<c:forEach begin="${tyear }" end="${tyear+6 }" var="yyyy">
							<option <c:out value="${tyear == yyyy? 'selected=selected':'' }"/> value="${yyyy }">${yyyy }</option>
							</c:forEach>
						</select>&nbsp;년&nbsp;&nbsp;
						
						<select name="emonth" class="inputselect">
						<c:forEach begin="1" end="12" var="mm">
							<option <c:out value="${tmonth == mm? 'selected=selected':'' }"/> value="${mm }" >${mm }</option>
						</c:forEach>
						</select>&nbsp;월&nbsp;&nbsp;
						
						<select name="eday" class="inputselect">
						<c:forEach begin="1" end="${monthMax }" var="dd">
							<option <c:out value="${tday == dd? 'selected=selected':'' }"/> value="${dd }">${dd }</option>
						</c:forEach>
						</select>&nbsp;일
					</td>
				</tr>
				
				<tr>
					<th>
						내용
					</th>
					<td colspan="5">
						<textarea rows="10" cols="90" name="content"></textarea>
					</td>
				</tr>
				
				<tr height="100px" style="width:100%;">
					<th>배너이미지</th>					
					<td colspan="5">
						<div id="pZone1">
							<font size='2px' id="pZone1_font">이미지를 등록해주세요.</font><br>
							<input type="file" name="bannerfile" id="fileUpload1">
						</div>
					</td>
			   </tr>
			   <tr>
					<th>상세이미지</th>					
					<td>
						<div id="cZone1">
							<input type="file" name="contentfile1" id="fileUpload2" style="width: 100%">
						</div>
					</td>
				</tr>
			
			   
			</tbody>
			</table>
			
			<br><br>
			<input type="submit" value="올리기" class="closeBtn" id="submitBtn">
			<input type="button" value="취소" class="closeBtn" id="golistBtn">
		
	
			</form>
			</div>
			
			<!-- 쿠폰정보 모달 영역-->
			<div class="restockModal">
				<div class="restockModal-content">
					<select class="form-control is-valid custom-select" 
						onchange="coupon_length(this)" name="func" id="_func" style="width: 150px">
						<option value="전체">전체</option>
						<option value="할인">할인쿠폰</option>
						<option value="적립">적립쿠폰</option>
					</select><br>
					<table class="modaltable" border="1">
					<tr>
						<th>쿠폰번호</th><th>쿠폰이름</th><th>쿠폰상세</th><th>기한</th><th>선택</th>
					</tr>
					<c:if test="${empty couponlist }">
						<tr>
							<td align="center" colspan="3">쿠폰리스트가 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="cou" items="${couponlist }" varStatus="vs">
						<tr style="padding: 10px;" align="center">
							<td id="modal_seq">${cou.seq }</td>
							<td style="padding: 0px 10px 0 10px;" align="center" id="modal_title">${cou.title }</td>
							<td align="center" id="modal_subtitle">${cou.sub_title }</td>
							<td align="center" id="modal_timelimit">${cou.func_time_limit }</td>
							<td align="center">
								<input type="button" value="선택" class="eventBtn" onclick="couBtn('${cou.title }','${cou.seq }')">
								<input type="hidden" value="${cou.seq }" id="_modalseq">
							</td>
						</tr>
					</c:forEach>
					
					</table>
					
					<input type="button" class="closeBtn modalBtn" value="닫기">
					
				</div>
			</div>
			<!-- /쿠폰정보 모달 영역-->
			
			<!-- 쿠폰정보 모달 영역(type)-->
			<div class="restockModal2">
				<div class="restockModal-content">
					<select class="form-control is-valid custom-select" 
						onchange="coupon_length(this)" name="func" id="_func" style="width: 150px">
						<option value="전체">전체</option>
						<option value="할인">할인쿠폰</option>
						<option value="적립">적립쿠폰</option>
					</select><br>
					<div id="tablewrap">
					</div>
					<input type="button" class="closeBtn modalBtn" value="닫기">
				</div>
			</div>
			<!-- /수정페이지 모달 영역-->
			

		</div>
	</div>
</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->

<!-- 닫기 -->
<script type="text/javascript">
$("#golistBtn").click(function(){
	location.href="/admin/event/eventlist";
});
</script>


<!-- 쿠폰정보 modal -->
<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});


// 쿠폰 종류
function coupon_length(e) {
	
	$("#boardList").remove();

	var boardList = '<table id="boardList" class="modaltable" border="1">'
					+'<tr><th>쿠폰번호</th><th>쿠폰이름</th><th>쿠폰상세</th><th>기한</th><th>선택</th></tr>'
					+'</table>'; 
	$("#tablewrap").append(boardList);
	
	var type = $(e).val();

	$.ajax({
		type:"post",
		data:"func="+type,
		url:"/admin/event/eventcoupontype",
		success:function(data){
		
			$(".restockModal").hide();
			$(".restockModal2").show();
		
            var results = data.seq;
            var str = '<TR>';
	        
			$.each(data, function(idx, val) {
				console.log(idx + " " + val.title);
				
				str += '<TD align="center">' + val.seq + '</TD><TD align="center">' + val.title + '</TD><TD align="center">' + val.sub_title + '</TD><TD align="center">' 
						+ val.func_time_limit+'</TD>'
						+'<TD align="center">'
						+'<input type="button" value="선택" class="eventBtn" onclick="couBtn2(' +'\''+ val.title +'\'' +','+'\'' + val.seq +'\''+ ')">'
						+'</TD>';															
				str += '</TR>';
	
			});
			
			$("#boardList").append(str);

		},
		error : function(request, status, error) {
			alert("code:" + request.status + "\n" + "message:"
					+ request.responseText + "\n" + "error:" + error);
		}
	});

}

	$(document).ready(function() {
		$(".restockModal").hide(); // 모달 숨기기
		$(".restockModal2").hide(); // 모달 숨기기
		$("#input_coupon").hide(); // 쿠폰<span>숨기기
	});

	// 모달 닫기
	$(".modalBtn").click(function() {
		$(".restockModal").fadeOut();
		$(".restockModal2").fadeOut();
	});
	$(document).on('click', '#_coupon', function() {
		$(".restockModal").fadeIn();
	});

	function couBtn(coupon_title, coupon_seq) {

		var inputcoupon = $("#input_coupon").text();

		// 선택한 쿠폰이 없다면
		if (inputcoupon == null || inputcoupon == '') {
			$("#_coupon_title1").val(coupon_title); // hidden으로 title, seq번호 넘기기
			$("#_seq1").val(coupon_seq); 
			$("#input_coupon").text(coupon_title);
		} else {
			$("#_coupon_title2").val(coupon_title); // hidden으로 title, seq번호 넘기기
			$("#_seq2").val(coupon_seq); 
			var cp_html = "<span id='input_coupon2' class='input_coupon'></span>";
			$("#coupontag").append(cp_html);
			$("#input_coupon2").text(coupon_title);
		}

		$(".restockModal").fadeOut();
		$("#input_coupon").show();
	}
	
	
	function couBtn2(coupon_title, coupon_seq) {

		var inputcoupon = $("#input_coupon").text();

		// 선택한 쿠폰이 없다면
		if (inputcoupon == null || inputcoupon == '') {
			$("#_coupon_title1").val(coupon_title); // hidden으로 title, seq번호 넘기기
			$("#_seq1").val(coupon_seq);
			$("#input_coupon").text(coupon_title);
		} else {
			$("#_coupon_title2").val(coupon_title); // hidden으로 title, seq번호 넘기기
			$("#_seq2").val(coupon_seq); 
			var cp_html = "<span id='input_coupon2' class='input_coupon'></span>";
			$("#coupontag").append(cp_html);
			$("#input_coupon2").text(coupon_title);
		}

		$(".restockModal2").fadeOut();
		$("#input_coupon").show();
	}
	
	
	
</script>





														<!-- file --> 





<!-- 배너  이미지 미리보기 -->
<script>
//ajax 통신을 위한 csrf 설정
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

var sel_file;
 
$(document).ready(function() {
	$("#fileUpload1").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	var form = $('#_frm')[0];
    var data = new FormData(form);
    
	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:100px;' id='img1'>";
			$("#pZone1").html("");
			$("#pZone1").append(img_html);
 			$("#pZone1").after("<button type='button' id='pZone1_del'>삭제</button>");	
			$.ajax({
			    type : "POST",
			    enctype: 'multipart/form-data',
			    url : "/admin/event/eventwriteFile",
			    data : data,
			    cache: false,
			    processData: false,
			    contentType: false,
			    success : function(data) {
// 			        alert(data);
			        
			    },
			    err : function(err) {
			        alert(err.status);
			    }
			}); 


		}
		reader.readAsDataURL(f);
	});
}
</script>
<script type="text/javascript">
// 이미지 삭제
$(document).on("click","#pZone1_del", function() {
	$("#img1").remove();
	$("#pZone1_del").remove();
	$("#pZone1").after("<input type='file' name='content_file' id='fileUpload1'>");
	$("#pZone1_font").text("이미지를 등록해주세요.");
});  
</script>


</html>