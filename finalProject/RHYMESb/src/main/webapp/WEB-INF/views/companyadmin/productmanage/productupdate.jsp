 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <% String ctx = request.getContextPath(); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>상품 수정</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/companyadmin/productmanage/productupdate.css">
<style>
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- <script type="text/javascript" src="https://base/js/jquery.form.min.js"></script> -->

<script src="http://malsup.github.com/jquery.form.js"></script> 	
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>

</head>

<!-- Begin Page Content -->
<div class="container-fluid">
<!-- 메시지 MODAL영역 -->
<div class="msgModal">
   <div class="msg-content">
      <span id="msg"></span>
   </div>
</div>

<!-- 상품기본정보 수정 MODAL -->
	<form method="post" action="/admin/company/productupdateAf" id='basicinfo-submit'>
	<!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
 	
	<input type="hidden" name="p_seq" value="${pDto.p_seq }">
	<input type="hidden" name="madeYear" id="udt-madeYear" value="${pDto.madeYear }">
	<input type="hidden" name="madeMonth" id="udt-madeMonth" value="${pDto.madeMonth }">
	<input type="hidden" name="c1_name" id="udt-c1name" value="${pDto.c1_name }">
	<input type="hidden" name="c2_name" id="udt-c2name" value="${pDto.c2_name }">
	<input type="hidden" name="c3_name" id="udt-c3name" value="${pDto.c3_name }">
	<input type="hidden" name="p_price" id="udt-pprice" value="${pDto.p_price }">
	
<!-- 	<input type="hidden" name="p_color" id="udt-pcolor">
	<input type="hidden" name="c1_name" id="udt-c2name">
	<input type="hidden" name="c1_name" id="udt-c3name"> -->
	<div class="basicinfo_modal">
		<div class="basicinfo_modal-content">
			<div align="right">
			<img src="https://cdn4.iconfinder.com/data/icons/media-controls-4/100/close-512.png" style="width:30px; height:30px; cursor:pointer;" class="modalClose">
			</div>
			<div align='center'>
			<table border='0' id="basicinfo_udt-table">
				<colgroup><col width="30%"><col width="70%"></colgroup>
				<tr>
					<th>상품명</th>
					<td><input type="text" value="${pDto.p_name }" name="p_name" id="_p_name"></td>
				</tr>	
				<tr>
					<th>상품 코드</th>
					<td><input type="text" value="${pDto.cp_code }" name="cp_code" id="_cp_code"></td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<c:if test="${pDto.bfs_price eq 0}">
					<td>
						<input type="text" class="upt_price" style="width:70%;" 
							onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"
							onchange="numberWithCommas(this.value)"
							value="<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />"
							>&nbsp;원
					</td>
					</c:if>
					<c:if test="${pDto.bfs_price ne 0}">
					<td style="margin-top: 100px;">
						<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />&#8361;
						<c:if test="${pDto.bfs_price ne 0}">
						<font style="text-decoration: line-through; color:red;">
						<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.bfs_price}" />&#8361;
						</font>
						<img src="https://icon-library.net/images/sale-icon-png/sale-icon-png-14.jpg" style="width:20px;height:20px;">
						</c:if>
						<br><strong style="color:red; font-size: 12px;">SALE적용 취소 후 가격 수정이 가능합니다.</strong>
					<td>
					</c:if>
				</tr>
				<tr>
					<th>상품 색상</th>
					<td>
						<select id="colorSelect" style="margin-top: 10px;" name="p_color">
							<option value="">-SELECTION-</option>
							<option value="BLACK" <c:out value="${pDto.p_color == 'BLACK'? 'selected':'' }"/>>BLACK</option>
							<option value="LIME" <c:out value="${pDto.p_color == 'LIME'? 'selected':'' }"/>>LIME</option>
							<option value="WHITE" <c:out value="${pDto.p_color == 'WHITE'? 'selected':'' }"/>>WHITE</option>
							<option value="OFFWHITE" <c:out value="${pDto.p_color == 'OFFWHITE'? 'selected':'' }"/>>OFFWHITE</option>
							<option value="RED" <c:out value="${pDto.p_color == 'RED'? 'selected':'' }"/>>RED</option>
							<option value="ORANGE" <c:out value="${pDto.p_color == 'ORANGE'? 'selected':'' }"/>>ORANGE</option>
							<option value="YELLOW" <c:out value="${pDto.p_color == 'YELLOW'? 'selected':'' }"/>>YELLOW</option>
							<option value="BEIGE" <c:out value="${pDto.p_color == 'BEIGE'? 'selected':'' }"/>>BEIGE</option>
							<option value="BLUE" <c:out value="${pDto.p_color == 'BLUE'? 'selected':'' }"/>>BLUE</option>
							<option value="SKYBLUE" <c:out value="${pDto.p_color == 'SKYBLUE'? 'selected':'' }"/>>SKYBLUE</option>
							<option value="GREEN" <c:out value="${pDto.p_color == 'GREEN'? 'selected':'' }"/>>GREEN</option>
							<option value="NAVY" <c:out value="${pDto.p_color == 'NAVY'? 'selected':'' }"/>>NAVY</option>
							<option value="GREY" <c:out value="${pDto.p_color == 'GREY'? 'selected':'' }"/>>GREY</option>
							<option value="PURPLE" <c:out value="${pDto.p_color == 'PURPLE'? 'selected':'' }"/>>PURPLE</option>
							<option value="PINK" <c:out value="${pDto.p_color == 'PINK'? 'selected':'' }"/>>PINK</option>
							<option value="MIX" <c:out value="${pDto.p_color == 'MIX'? 'selected':'' }"/>>MIX</option>
						</select>
					</td>
				</tr>
				<tr>
					
					<th>제조년월</th>
					<td>
						<select id="year" onchange="changeMyear(this.value)">
								<%-- <option value="${pDto.madeYear }">${pDto.madeYear }</option> --%>
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${today}" pattern="yyyy" var="start" />
								<c:forEach begin="0" end="10" var="idx" step="1">
									<option value="<c:out value="${start - idx}" />"
										<c:out value="${pDto.madeYear == (start - idx) ? 'selected':'' }"/>>
										<c:out value="${start - idx}" />
									</option>
								</c:forEach>
						</select>년&nbsp;
						<select id="month" onchange="changeMmonth(this.value)">
							<%for(int i=1; i < 13; i++){ %>
							<c:set var="month" value="<%=i%>" />
							<option value=<%=i %> <c:out value="${pDto.madeMonth == month? 'selected':'' }"/>><%=i%></option>
							<%} %>								
						</select>월
					</td>
				</tr>
				<tr>
					<th>1차 카테고리</th>
					<td>
						<select id="cate1" onchange="cate1Change(this.value)" >
							<option value='1' <c:out value="${pDto.c1_name == 'MEN'? 'selected':'' }"/>>MEN</option>
							<option value='2' <c:out value="${pDto.c1_name == 'WOMEN'? 'selected':'' }"/>>WOMEN</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>2차 카테고리</th>
					<td>
						<select id="cate2" onchange="cate2Change(this.value)">
						<c:forEach items="${cate2list }" var="c2" varStatus="vs">
							<option class="cate2option" id="c2nameget${c2.c2_seq }" value="${c2.c2_seq }" <c:out value="${c2.c2_name == pDto.c2_name ? 'selected':'' }"/>>${c2.c2_name }</option>	
						</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th>3차 카테고리</th>
					<td>
						<select id="cate3" onchange="cate3Change()">
						<c:forEach items="${cate3list }" var="c3" varStatus="vs">
							<option class='cate3option' <c:out value="${c3.c3_name == pDto.c3_name ? 'selected':'' }"/>>${c3.c3_name }</option>	
						</c:forEach>
						</select>
					</td>
				</tr>
	
			</table>
			
			<div align='center'>
				<button type="button" id="basicinfoUdt-finishBtn">수정 등록</button>
			</div>
			
			</div>
		</div>
	</div>
	</form>
<!-- ~~상품기본정보 수정 MODAL 끝 -->	

<!-- 상품이미지 수정 MODAL -->
<div class="imgudt_modal">
	<div class="imgudt_modal-content" align="center">
		<div align="right">
		<img src="https://cdn4.iconfinder.com/data/icons/media-controls-4/100/close-512.png" style="width:30px; height:30px; cursor:pointer;" class="imgudtModalClose">
		</div>
		<div align="center" style="border:0px solid green; height:auto; padding:20px">
				<div class="udtimg-div">
				<form id="imgUdt-frm1" method="POST" enctype="multipart/form-data" onSubmit="return false;">
					<label>메인이미지</label><br>
					<div id="pZone1">
						<img src="/upload/store/${pDto.photo1_file }"  style="width:550px; height:550px;">
					</div>
					<button type="button" id="btn-upload1">수정</button>
					<input type="file" id="fileUpload1" name="fileload" style="display: none;">
					<input type="hidden" name="photoNumber" value='1'>
					<input type="hidden" name="p_seq" value="${pDto.p_seq }">	
				</form>	
				</div>	
				<hr width = "100%" color = "#DADCE0" id="udtimg-hr"><br>
				<div class="udtimg-div">
				<form id="imgUdt-frm2" method="POST" enctype="multipart/form-data" onSubmit="return false;">					
					<label>상품이미지2</label><br>
					<div id="pZone2">
						<img src="/upload/store/${pDto.photo2_file }"  style="width:550px; height:550px;">
					</div>
					<button type="button" id="btn-upload2">수정</button>
					<input type="file" id="fileUpload2" name="fileload" style="display: none;">
					<input type="hidden" name="photoNumber" value='2'>
					<input type="hidden" name="p_seq" value="${pDto.p_seq }">
				</form>	
				</div>
				<hr width = "100%" color = "#DADCE0" id="udtimg-hr"><br>
				<div class="udtimg-div">
				<form id="imgUdt-frm3" method="POST" enctype="multipart/form-data" onSubmit="return false;">
					<label>상품이미지3</label><br>
					<div id="pZone3">
						<img src="/upload/store/${pDto.photo3_file }"  style="width:550px; height:550px;">
					</div>
					<button type="button" id="btn-upload3">수정</button>
					<input type="file" id="fileUpload3" name="fileload" style="display: none;">
					<input type="hidden" name="photoNumber" value='3'>
					<input type="hidden" name="p_seq" value="${pDto.p_seq }">
				</form>
				</div>
				<hr width = "100%" color = "#DADCE0" id="udtimg-hr"><br>
				<div class="udtimg-div">
				<form id="imgUdt-frm4" method="POST" enctype="multipart/form-data" onSubmit="return false;">
					<label>상품이미지4</label><br>
					<div id="pZone4">
						<img src="/upload/store/${pDto.photo4_file }"  style="width:550px; height:550px;">
					</div>
					<button type="button" id="btn-upload4">수정</button>
					<input type="file" id="fileUpload4" name="fileload" style="display: none;">
					<input type="hidden" name="photoNumber" value='4'>
					<input type="hidden" name="p_seq" value="${pDto.p_seq }">
				</form>
				</div>
				<hr width = "100%" color = "#DADCE0" id="udtimg-hr"><br>									
				<div class="udtimg-div">
				<form id="imgUdt-frm5" method="POST" enctype="multipart/form-data" onSubmit="return false;">
					<label>상품이미지5</label><br>
					<div id="pZone5">
						<img src="/upload/store/${pDto.photo5_file }"  style="width:550px; height:550px;">
					</div>
					<button type="button" id="btn-upload5">수정</button>
					<input type="file" id="fileUpload5" name="fileload" style="display: none;">
					<input type="hidden" name="photoNumber" value='5'>
					<input type="hidden" name="p_seq" value="${pDto.p_seq }">
				</form>
				</div>				
		</div>
	</div>
</div>			
<!-- ~~상품이미지 수정 MODAL 끝 -->



	<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">
			상품관리 >
			<a href="/admin/company/productoperlist">상품 수정/삭제</a> >
			상품 수정
			</h6>
		</div>
	
	<!-- 상품기본정보 수정 -->
	<div id="updateDiv">
		<div style="margin-bottom: 30px;"><strong>상품기본정보 수정</strong></div>
		
		<div style="float:left">
			<img src="/upload/store/${pDto.photo1_file }"  style="width:200px; height:200px; border-radius: 100%; margin-left: 50px;">
		</div>
		<div style="margin-left: 330px; margin-top: 40px">
			<%-- <b>상품명</b>&nbsp;${pDto.p_name }<br>
			<b>가격</b>&nbsp;<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" /> 원 --%>
			<table id="basicinfo-table">
			<colgroup>
				<col width="160px"><col width="250px">
			</colgroup>
				<tr>
					<th>상품 번호</th>
					<td>${pDto.p_seq }</td>
				</tr>
				<tr>
					<th>상품명</th>
					<td>${pDto.p_name }</td>
				</tr>
				<tr>
					<th>상품 코드</th>
					<td>${pDto.cp_code }</td>
				</tr>
				<tr>
					<th>상품 가격</th>
					<td><fmt:formatNumber type="currency" currencySymbol="" value="${pDto.p_price}" />원&nbsp;
						<c:if test="${pDto.bfs_price ne 0}">
						<font style="text-decoration: line-through; color:red;">
						<fmt:formatNumber type="currency" currencySymbol="" value="${pDto.bfs_price}" />원
						</font>
						<img src="https://icon-library.net/images/sale-icon-png/sale-icon-png-14.jpg" style="width:20px;height:20px;">
						</c:if>
					</td>
				</tr>
				
				<tr>
					<th>상품 색상</th>
					<td>${pDto.p_color }</td>
				</tr>
				<tr>
					<th>상품 제조년월</th>
					<td>${pDto.madeYear }년&nbsp;${pDto.madeMonth }월</td>
				</tr>
				<tr>
					<th>상품 카테고리</th>
					<td>${pDto.c1_name }&nbsp;&#47;&nbsp;${pDto.c2_name }&nbsp;&#47;&nbsp;${pDto.c3_name }</td>
				</tr>
				<tr>
					<th>상품 등록일</th>
					<td>${pDto.rdate }</td>
				</tr>
			
			</table>
			
			
		</div>
		<br>
		<div align="center" style="margin-top: 40px;">
			<button type="button" class="basicinfo_update-btn"><b>수정</b></button>
		</div>		
	</div>
	<!-- ~~상품기본정보 수정 끝 -->
	
	<!-- 상품이미지 수정 -->
	<div id="updateDiv">
		<strong>상품이미지 수정</strong>
		<div style="margin-top: 40px; margin-bottom: 40px;">
			<div align="center">
			<img src="/upload/store/${pDto.photo1_file }"  id="oPhoto1" style="width:150px; height:150px;">
			<img src="/upload/store/${pDto.photo2_file }"  id="oPhoto2" style="width:150px; height:150px;">
			<img src="/upload/store/${pDto.photo3_file }"  id="oPhoto3" style="width:150px; height:150px;">
			<img src="/upload/store/${pDto.photo4_file }"  id="oPhoto4" style="width:150px; height:150px;">
			<img src="/upload/store/${pDto.photo5_file }"  id="oPhoto5" style="width:150px; height:150px;">
			</div>
		</div>
		<div align="center">
			<button type="button" class="img_update-btn"><b>수정</b></button>
		</div>
	</div>
	<!-- ~~상품이미지 수정 끝 -->


</div>
<!-- /.container-fluid -->

<!-- End of Main Content -->



<!--------------------------------- SCRIPT ZONE --------------------------------->
<script>
var sel_file;


$(document).on('click', '.imgudtModalClose', function(){
	$(".imgudt_modal").fadeOut();
});

$(document).on('click', '.basicinfo_update-btn', function(){
	$(".basicinfo_modal").fadeIn();
});
$(document).on('click', '.detailinfo_update-btn', function(){
	$(".detailinfo_modal").fadeIn();
});

$(document).on('click', '.img_update-btn', function(){
	$(".imgudt_modal").fadeIn();
});

/* 이미지 수정버튼 동작 후 미리보기 */
 <!-- 이미지1미리보기 -->
$(document).ready(function() {
	$("#fileUpload1").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			
			//메시지 모달
		     $("#msg").html("<strong>이미지파일을 업로드해주세요.</strong>");
	      	 $(".msgModal").fadeIn();
	     	 setTimeout(function() {
	         	$(".msgModal").fadeOut();
	         },1000);
			
			
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:600px;'>";
			$("#pZone1").html("");
			$("#pZone1").append(img_html);
			$("#btn-upload1").remove();
			$("#pZone1").after("<button class='imgUdt-finishBtn' value='1'>수정 등록</button>");
		}
		reader.readAsDataURL(f);
	});
}
<!-- 이미지2미리보기 -->
$(document).ready(function() {
	$("#fileUpload2").on("change", handleImgsFilesSelect2);
});

function handleImgsFilesSelect2(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:300px;height:300px;'>";
			$("#pZone2").html("");
			$("#pZone2").append(img_html);
			$("#btn-upload2").remove();
			$("#pZone2").after("<button class='imgUdt-finishBtn' value='2'>수정 등록</button>");
		}
		reader.readAsDataURL(f);
	});
}
<!-- 이미지3미리보기 -->
$(document).ready(function() {
	$("#fileUpload3").on("change", handleImgsFilesSelect3);
});

function handleImgsFilesSelect3(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:300px;height:300px;'>";
			$("#pZone3").html("");
			$("#pZone3").append(img_html);
			$("#btn-upload3").remove();
			$("#pZone3").after("<button class='imgUdt-finishBtn' value='3'>수정 등록</button>");
		}
		reader.readAsDataURL(f);
	});
}
<!-- 이미지4미리보기 -->
$(document).ready(function() {
	$("#fileUpload4").on("change", handleImgsFilesSelect4);
});

function handleImgsFilesSelect4(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:300px;height:300px;'>";
			$("#pZone4").html("");
			$("#pZone4").append(img_html);
			$("#btn-upload4").remove();
			$("#pZone4").after("<button class='imgUdt-finishBtn' value='4'>수정 등록</button>");
		}
		reader.readAsDataURL(f);
	});
}
<!-- 이미지5미리보기 -->
$(document).ready(function() {
	$("#fileUpload5").on("change", handleImgsFilesSelect5);
});

function handleImgsFilesSelect5(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("확장자는 이미지 확장자만 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:300px;height:300px;'>";
			$("#pZone5").html("");
			$("#pZone5").append(img_html);
			$("#btn-upload5").remove();
			$("#pZone5").after("<button class='imgUdt-finishBtn' value='5'>수정 등록</button>");
		}
		reader.readAsDataURL(f);
	});
}


/* 이미지 수정등록 버튼 */ 
$(document).on('click', '.imgUdt-finishBtn', function(){
	var photoNumber = $(this).val();
	
     $("#imgUdt-frm" + photoNumber).ajaxForm({
           type : 'POST',
           enctype : "multipart/form-data",
           url : "/admin/company/productimgupdate",
           //data : data,
           processData : false,
           contentType : false,
           cache : false,
           //dataType : formData,
           beforeSend:function(xhr){
        	   xhr.setRequestHeader("${_csrf.token}", "${_csrf.headerName}");
           },
           //timeout: 600000,
           success : function(data){
	           $(".imgUdt-finishBtn").remove();
			   $("#pZone"+photoNumber).after("<button type='button' id='btn-upload"+photoNumber+"' value='"+photoNumber+"'>수정</button>");
			   $("#oPhoto"+photoNumber).attr('src', '/upload/store/'+data);
			   //메시지 모달
			     $("#msg").html("<strong>수정이 완료되었습니다.</strong>");
		      	 $(".msgModal").fadeIn();
		     	 setTimeout(function() {
		         	$(".msgModal").fadeOut();
		         },1000);
			   
           },
           error : function(){
           	   alert("error!!");
           },
       });

       $("#imgUdt-frm"+photoNumber).submit();
	
});
 
/* 이미지 수정 버튼 */
// 이미지1	
$(document).on('click', '#btn-upload1', function(e){	
	e.preventDefault();
	$('#fileUpload1').click();
});	
/* 이미지2 */	
$(document).on('click', '#btn-upload2', function(e){	
	e.preventDefault();
	$('#fileUpload2').click();
});
/* 이미지3 */	
$(document).on('click', '#btn-upload3', function(e){	
	e.preventDefault();
	$('#fileUpload3').click();
});
/* 이미지4 */	
$(document).on('click', '#btn-upload4', function(e){	
	e.preventDefault();
	$('#fileUpload4').click();
});
/* 이미지5 */	
$(document).on('click', '#btn-upload5', function(e){	
	e.preventDefault();
	$('#fileUpload5').click();
});

$(document).on('click', '#basicinfoUdt-finishBtn', function(){

	var pname = $("#_p_name").val();
	var cpcode = $("#_cp_code").val();
	var pprice = $("#udt-pprice").val();
	var c1name = $("#udt-c1name").val();
	var c2name = $("#udt-c2name").val();
	var c3name = $("#udt-c3name").val();
	
	if(pname === '' || cpcode === '' || pprice ==='' || c1name ==='' || c2name ==='' || c3name ===''){
		alert("모든 항목을 기입해주세요");
	}else{
		$("#basicinfo-submit").submit();
	}
	
});

function numberWithCommas(x) {
    $(".upt_price").val(x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    $("#udt-pprice").val(x);
    
}
function changeMyear(year){
	$("#udt-madeYear").val(year);	
}
function changeMmonth(month){
	$("#udt-madeMonth").val(month);	
}

function cate1Change(c1_seq){
	
	$("#udt-c2name").val('');
	$("#udt-c3name").val('');
	
	if(c1_seq == 1){
		$("#udt-c1name").val('MEN');
	}else if(c1_seq == 2){
		$("#udt-c1name").val('WOMEN');
	}
	
	$(".cate2option").remove();
	$(".cate3option").remove();
	
	$("#cate3").append("<option class='first2Cate'>2차 카테고리를 먼저</option>");
	
 	$.ajax({
        type:"get",
        data: "c1_seq=" + c1_seq,
        url:"/store/cate2List",
        success:function( data ){
            var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			var arrLen = arr.length;
			addCate2(arr, arrLen);
        },
        error:function(){
           alert("error!!"); 
        }
    })
}

function addCate2(arr, arrLen) {
	var str ="";
	str = "";
	str = "<option class='cate2option' value=''> ~SELECTION~ </option>"; 
	for (var i = 0; i < arrLen; i++) {
		
		/* str += "<div class='c2Div'><label for='check2' style='cursor:pointer' background-color: white;' value='" + arr[i].c2_seq + "' value2='"+ arr[i].c2_name +"' class='c2sel'>";
		str += arr[i].c2_name;
		str += "</label><br></div>"; */
		
		/* <option class="cate2option" <c:out value="${c2.c2_name == pDto.c2_name ? 'selected':'' }"/>>${c2.c2_name }</option> */
		
		str += "<option class='cate2option' id='c2nameget"+arr[i].c2_seq+"' value='"+arr[i].c2_seq+"'>";
		str += arr[i].c2_name;
		str += "</option>";
	}
	$("#cate2").append(str);
}

function cate2Change(c2_seq){
	$("#udt-c3name").val('');
	var c2name = $("#c2nameget"+c2_seq).text();
	$("#udt-c2name").val(c2name);
	
	$(".cate3option").remove();
	$(".first2Cate").remove();
	
	$.ajax({
        type:"get",
        data: "c2_seq=" + c2_seq,
        url:"/store/cate3List",
        success:function( data ){
            var obj = JSON.stringify(data);
			var arr = JSON.parse(obj);
			var arrLen = arr.length;
			addCate3(arr, arrLen);
        },
        error:function(){
           alert("error!!"); 
        }
    })
	
}

function addCate3(arr, arrLen) {
	var str ="";
	str = "";
	str = "<option class='cate3option' value=''> ~SELECTION~ </option>"; 
	for (var i = 0; i < arrLen; i++) {
		str += "<option class='cate3option' value='"+arr[i].c3_name+"'>";
		str += arr[i].c3_name;
		str += "</option>";
	}
	$("#cate3").append(str);	
}

function cate3Change(){
	var c3name = $("#cate3").val();
	$("#udt-c3name").val(c3name);
}

$(document).on('click', '.modalClose', function(){
	var p_seq = "${pDto.p_seq }";
	location.href="/admin/company/productupdate?p_seq="+p_seq;
});

/* 상품사진 업데이트 모달 영역 외 클릭시 close */
$('body').click(function(e){
	 if($(".imgudt_modal").css("display") == "block") {
        if(!$('.imgudt_modal, .imgudt_modal').has(e.target).length) { 
        	//$(".modal").css("display", "none");
        	$(".imgudt_modal").fadeOut();
         } 
 	 }
});
</script>



</html>
