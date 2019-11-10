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
<title>memlist</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/memberlist.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원관리</h1>
	<p class="mb-4">회원조회, 수정, 정지</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<span class="m-0 font-weight-bold text-primary">회원 목록</span>
	    	<a href="/admin/excel/member" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" style="float: right;"><i class="fas fa-download fa-sm text-white-50"></i> 회원정보 다운로드</a>
		</div>
		
		<div class="card-body">
			<div class="table-responsive">
				<div class="row">
					<div class="col-sm-12 col-md-6">
						<div class="dataTables_length" id="dataTable_length">
							<form action="" id="_frm" method="post">
							<input type="hidden" value="ROLE_ADMIN" name="authority">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<select style="width: 100px;" name="recordCountPerPage" aria-controls="dataTable" onchange="dataTable_length()"
									class="custom-select custom-select-sm form-control form-control-sm">
									<option value="10"
										<c:out value="${recordCountPerPage == '10'? 'selected':'' }"/>>10</option>
									<option value="25"
										<c:out value="${recordCountPerPage == '25'? 'selected':'' }"/>>25</option>
									<option value="50"
										<c:out value="${recordCountPerPage == '50'? 'selected':'' }"/>>50</option>
									<option value="100"
										<c:out value="${recordCountPerPage == '100'? 'selected':'' }"/>>100</option>
								</select>
						</div>
					</div>
					<!-- 검색 -->
					<div class="col-sm-12 col-md-6">
						<div id="dataTable_filter" class="searchPosition dataTables_filter">

							<select class="custome-select border-0 pr-3 searchSelect" onchange="selectMem()" id="_select" name="s_category">
								<option selected value="">전체</option>
								<option value="01"
									<c:out value="${s_category == '01'? 'selected':'' }"/>>아이디</option>
								<option value="02"
									<c:out value="${s_category == '02'? 'selected':'' }"/>>이메일</option>
								<option value="03"
									<c:out value="${s_category == '03'? 'selected':'' }"/>>종류</option>
								<option value="04"
									<c:out value="${s_category == '04'? 'selected':'' }"/>>전화번호</option>
							</select> 
							<input type="search" id="_s_keyword" name="s_keyword" class="searchText form-control-sm" placeholder="search..."
								aria-controls="dataTable" style="width: 150px" value="${s_keyword }">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm" id="_btnSearch"></i>
							</button>
							<!-- hidden 을 통해서 값을 넘겨주기 -->
							<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
							<input type="hidden" name="recordCountPerPage"
								id="_recordCountPerPage"
								value="${(empty recordCountPerPage)?0:recordCountPerPage }">
						</div>
					</div>
					<!-- /검색 -->

				</div>



				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

					<thead>
						<tr align="center">
							<th class="list_checkbox"><input type="checkbox"
								name='allckeck' onclick='allchecks(this.checked)' id='_allck'>
							</th>
							<th class="sorting">아이디<input type="hidden" name="sorting" id="_sorting" value="${sorting }"></th>
							<!-- 1 -->
							<th class="sorting">이름</th>
							<!-- 2 -->
							<th class="sorting">주소</th>
							<!-- 3 -->
							<th class="sorting">이메일</th>
							<!-- 4 -->
							<th class="sorting">전화번호</th>
							<!-- 5 -->
							<th class="sorting">종류</th>
							<!-- 6 -->
							<th class="sorting">가입일</th>
							<!-- 7 -->
							<th class="sorting">계정잠금</th>
							<!-- 8 -->
						</tr>
					</thead>

					<tbody>
						<c:if test="${empty memlist }">
							<tr align="center">
								<td colspan="9" align="center">검색결과가 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="mem" items="${memlist }" varStatus="vs">
							<tr align="center">
								<td class="list_checkbox">
									<input type="checkbox" name='checkid' id="_checkid" value="${mem.userid }">
								</td>
								<td class="list_id">
									<input type="text" value="${mem.userid }" id="_userid" class="list_userid clickbtn" readonly="readonly">
								</td>		 					
								<td>${mem.username }</td>
								<td>${mem.address }</td>
								<td>${mem.useremail }</td>
								<td>${mem.phone }</td>
								<td>${mem.social}</td>
								<td>${mem.rdate }</td>
								<c:if test="${mem.isAccountNonLocked ne 'true'}">
									<td style="font-weight: bold; color: blue;">${mem.isAccountNonLocked }</td>
								</c:if>
								<c:if test="${mem.isAccountNonLocked ne 'false'}">
									<td>${mem.isAccountNonLocked }</td>
								</c:if>
							</tr>
						</c:forEach>

					</tbody>
				</table>
				</form>
				<div class="col-sm-12 col-md-7"><!-- 페이징 네비게이션 시작 -->
					<div class="dataTables_paginate paging_simple_numbers"
						id="dataTable_paginate">
						<!-- 페이징 -->
						<div id="paging_wrap">
							<jsp:include page="/WEB-INF/views/admin/member/paging.jsp"
								flush="false">
								<jsp:param name="pageNumber" value="${pageNumber }" />
								<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
								<jsp:param name="pageCountPerScreen"
									value="${pageCountPerScreen }" />
								<jsp:param name="recordCountPerPage"
									value="${recordCountPerPage }" />
							</jsp:include>
						</div>
						<!-- 페이징끝 -->
					</div>
				</div>
				<!-- 페이징 네비게이션 끝 -->	
				<div>
					<button type="button" id="memLockBtn" class="memLockBtn">회원정지</button>
					<button type="button" id="memLockBtn_n" class="memLockBtn_n">정지해제</button>
				</div>
	
	

			
			<!-- 수정페이지 모달 영역-->
			<div class="restockModal">
				<div class="restockModal-content">
					
					<form action="/admin/mem_updateAf" id="modalFrm" name="modalFrm" method="post">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<table class="modaltable">
							<tr>
								<td class="memupdateTd" colspan="2">
									<span class="memupdateTitle">회원정보 수정</span>
									<hr class="memupdateHr">
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><span class="td_margin"><input type="text" readonly name="userid" id="userid" class="inputtext_s" ></span></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="username" id="username" value="" class="inputtext_s"></td>
							</tr>
							<tr>
								<th><span class="th_title">주소</span></th>
								<td>
									<div class="wrap-input100 bg1 rs1-wrap-input100">
										<input type="text" id="_postcode" name="postcode" class="inputtext_s" placeholder="우편번호" value="">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="regibutton"><br> 
										<input type="text" id="_address" name="address" class="inputtext_s" placeholder="주소" value=""><br> 
										<input type="text" id="_detailAddress" name="detailAddress" class="inputtext_s" placeholder="상세주소" value=""> 
										<input type="hidden" id="_extraAddress" name="c_extraAddress" placeholder="참고항목">
									</div>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" name="useremail" id="useremail" value="" class="inputtext_s"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="phone" id="phone" value="" class="inputtext_s"></td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<input type="radio" name="usergender" id="femalegender" value="female" class="td_margin">여자
									<input type="radio" name="usergender" id="malegender"  value="male" class="td_margin">남자
								</td>
							</tr>
							<tr>
								<th>생일</th>
								<td>
									<input type="text" name="userbirth" id="userbirth" value="" class="inputtext_s">
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type="button" class="regibutton_s memBtn" id="mem_updateBtn" value="수정"><br>
									<button type="button" class="regibutton_s memBtn" id="golist">취소</button>
								</td>
							</tr>
						</table>
						
					</form>
					
					
				</div>
				
			</div>
			<!-- /수정페이지 모달 영역-->
				
			
				
			</div>
			
			
			
			
			
			
			
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->




<script type="text/javascript">
	function goPage(pageNumber) {

		$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴 
		$("#_frm").attr("action", "memlist").submit(); //

	}

	$("#_btnSearch").click(function() {
		//alert("클릭");
		$("#_frm").attr("action", "memlist").submit(); 

	});
</script>

<script type="text/javascript">
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

	function allchecks(e) {
		// 모두 체크
		var arr = document.getElementsByName("checkid");
		for (i = 0; i < arr.length; i++) {
			arr[i].checked = e;
			
		}
		
	}
	
	
	// 회원 정지
	$("#memLockBtn").click(function() {
	  	$("#_frm").attr("action", "/admin/memLock").submit(); 

	});
	// 정지해제
	$("#memLockBtn_n").click(function() {
	  	$("#_frm").attr("action", "/admin/memLock_n").submit(); 

	});
	
	// 리스트 갯수 뿌리기
	function dataTable_length() {
		$("#_frm").attr("action", "memlist").submit();
	}
	
	// 마우스 커서
	$(document).ready(function() {
		$('.list_userid').mouseover(function() {
			$(this).css("cursor", "pointer");
		});
	});

	// sorting
	$(function() {
		$(".sorting").click(function() {
			var thNum = $(this).index();

			if (thNum == 1) {
				$("#_sorting").val("ID");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 2) {
				$("#_sorting").val("NAME");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 3) {
				$("#_sorting").val("ADDRESS");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 4) {
				$("#_sorting").val("EMAIL");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 5) {
				$("#_sorting").val("PHONE");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 6) {
				$("#_sorting").val("SOCIAL");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 7) {
				$("#_sorting").val("RDATE");
				$("#_frm").attr("action", "memlist").submit();
			}
			if (thNum == 8) {
				$("#_sorting").val("isAccountNonLocked");
				$("#_frm").attr("action", "memlist").submit();
			}

		});
	});
	
	
	// 회원수정 modal
	$(document).on('click', '.list_userid', function(){
		$(".restockModal").fadeIn();
		var id = $(this).val();
		

		$.ajax({
	         type:"post",
			 data:"id="+id,
	         url:"/admin/mem_update",
	         success:function( data ){
	        	console.log(data);
	        	// 가져온 데이터들을 수정페이지에 보냄
	        	$("#userid").val(data.userid);
	        	$("#username").val(data.username);
	        	$("#_postcode").val(data.postcode);
	        	$("#_address").val(data.address);
	        	$("#_detailAddress").val(data.detailAddress);
	        	$("#useremail").val(data.useremail);
	        	$("#phone").val(data.phone);
	        	$("#userbirth").val(data.userbirth);
	        	
	        	var gender = data.usergender;
	        	
	        	if(gender=='female'){
	        		$("input:radio[id='femalegender']").prop("checked", true);
	        	}
	        	else if(gender=='male'){
	        		$("input:radio[id='malegender']").prop("checked", true);
	        	}

		      $(".wModal").fadeIn();
		      setTimeout(function() {
		         $(".wModal").fadeOut();
		      },2500);
	          
	       },
	      	 error:function(request,status,error){
	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	 }

	    })
		
	});
	
	// modal 수정 데이터 보내기
	$(document).on('click', '#mem_updateBtn', function(){
		
		var userid=$("#userid").val();
		var username = $("#username").val();
		var postcode=$("#_postcode").val();
		var address=$("#_address").val();
		var detailAddress=$("#_detailAddress").val();
		var useremail=$("#useremail").val();
		var phone=$("#phone").val();
		var usergender=$("#usergender").val();
		var userbirth=$("#userbirth").val();
		
		 $.ajax({
	         type:"post",
			 data: "userid="+userid+"&username="+username+
			 		"&postcode="+postcode+"&address="+address+"&detailAddress="+detailAddress+
			 		"&useremail="+useremail+"&phone="+phone+"&usergender="+usergender+"&userbirth="+userbirth,
			 url:"/admin/mem_updateAf",
	         success:function( data ){
	         	alert("수정되었습니다");
	         	
	         	
	         	$(".restockModal").fadeOut();
	       	 },
	       	 error:function(request,status,error){
	    	    alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    	 }
	    })
	    
	});
	
	
	
	
	
	
	
</script>





<!-- modal btn -->
<script type="text/javascript">
	// 수정 취소
	$("#golist").click(function() {
		location.href = "/admin/memlist";
	});
</script>

<!-- modal address -->
<!-- 주소 -->
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("_extraAddress").value = extraAddr;

				} else {
					document.getElementById("_extraAddress").value = '';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('_postcode').value = data.zonecode;
				document.getElementById("_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("_detailAddress").focus();
			}
		}).open();
	}
</script>

</html>