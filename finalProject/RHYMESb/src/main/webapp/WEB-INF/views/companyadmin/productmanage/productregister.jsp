<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">


<link rel="stylesheet" href="/css/store/register.css">
</head>


<body>
<!-- 1.카테고리 -->
<h1>카테고리 선택</h1>
<div align="center" style="margin-top: 35px;">
<table border='0' align="center" id="cateTable">
<colgroup>
	<col width="33%"><col width="33%"><col width="auto">
</colgroup>
<tr>
	<th>1차 카테고리</th>
	<th>2차 카테고리</th>
	<th>3차 카테고리</th>
</tr>
<tr>
	<td style="padding-top: 16px;">
		<input type="radio" id="check" style="display: none"  value="1">
		<label for="check" style="cursor: pointer; background-color: white;" value="1" value2="MEN" class="c1sel">MEN</label><br>
		<label for="check" style="cursor: pointer; background-color: white;" value="2" value2="WOMEN" class="c1sel">WOMEN</label>
	</td>
	<td id="cate2" style="padding-top: 16px;">
		<font size="2px" class='c2Div'>1차 카테고리를 선택해주세요.</font>		
	</td>
	<td id="cate3" style="padding-top: 16px;">
		<font size="2px" class='c3Div2'>2차 카테고리를 선택해주세요.</font>
	</td>
</tr>

</table>
</div>

<br><br><br>

<hr width = "100%" color = "#DADCE0">
<!-- 2.상품 기본정보 -->
<h1 style="margin-top: 20px;">상품 기본정보 입력</h1>
<div style="padding-left: 25%; margin-top: 30px;">
<table style="width:700px; align:center;">
<colgroup>
			<col width="25%"><col width="75%">
</colgroup>
	<tr style="height:40px;">
		<td >상품명</td>
		<td><input type="text" style="width:400px; height:13px; text-align: center;" id="_pname"></td>
	</tr>
	<tr style="height:40px;">
		<td>상품 부가설명</td>
		<td><input type="text" style="width:400px; height:15px; text-align: center;" id="_ptitle"></td>
	</tr>
	<tr style="height:40px;">
		<td>업체 상품코드</td>
		<td><input type="text" style="width:150px; height:15px; text-align: center;" id="_cpcode"></td>
	</tr>
	<tr style="height:40px;">
		<td>판매가</td>
		<td><input type="text" id="_pprice" style="width:115px; height:15px; text-align: center;" 
			onchange="numberWithCommas(this.value)"			
			onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&nbsp;원</td>
			<!-- onchange='this.value=this.value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");' -->
	</tr>
	<tr style="height:40px; ">
		<td>원산지</td>
		<td>
			<input type="text" style="width:150px; height:15px; text-align: center;" id="_pnation">
		</td>
	</tr>
	<tr style="height:40px;">
		<td>제조년월</td>
		<td>
			<!-- <input type="text" style="width:70px; height:15px; text-align: center;" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="_pmdate1">
			년	&nbsp;&nbsp; -->
			
			<select id="_pmdate1" class='yearSelect' onchange="changeMyear(this.value)">
								<c:set var="today" value="<%=new java.util.Date()%>" />
								<fmt:formatDate value="${today}" pattern="yyyy" var="start" />
								<c:forEach begin="0" end="10" var="idx" step="1">
									<option value="<c:out value="${start - idx}" />"
										<c:out value="${pDto.madeYear == (start - idx) ? 'selected':'' }"/>>
										<c:out value="${start - idx}" />
									</option>
								</c:forEach>
			</select>년&nbsp;&nbsp;
			
			
			
			
			<select class='monthSelect' id="_pmdate2">
			<%for(int i=1; i < 13; i++){ %>
				<option value=<%=i %>><%=i%></option>월
			<%} %>	
			</select>월
		</td>
	</tr>
</table>	
</div>
<br><br>
<hr width = "100%" color = "#DADCE0">

<!-- 3.상품 상세정보 -->
<h1 style="margin-top: 20px;">상품 상세정보 선택</h1>
<!-- 사이즈별 수량입력 테이블 -->
<div align="center" class='sqTable' style="margin-top: 30px;">
</div><br>

<div align="center" class="sqDiv">
<table style="width:1000px; align:center;" border='0' >
<colgroup>
	<col width="30%"><col width="70%">
</colgroup>
<tr style="height:40px;">	
	<th>색상</th>
	<th colspan='2'>사이즈</th>	
</tr>
<tr>	
	<td style="padding-top: 6px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="colorSelect">
		<option value="">-SELECTION-</option>
		<option value="BLACK">BLACK</option>
		<option value="LIME">LIME</option>
		<option value="WHITE">WHITE</option>
		<option value="RED">RED</option>
		<option value="ORANGE">ORANGE</option>
		<option value="YELLOW">YELLOW</option>
		<option value="BLUE">BLUE</option>
		<option value="GREEN">GREEN</option>
		<option value="NAVY">NAVY</option>
		<option value="GREY">GREY</option>
		<option value="PURPLE">PURPLE</option>
		<option value="PURPLE">PINK</option>
		</select>
	</td>
	<td style="align:cetner; padding-top: 16px;" id="sizeZone">
		<font size="2px" style="padding-left: 36%;" class="sizeDiv">카테고리를 모두 선택해주세요.</font>
	</td>
	<td style="align:cetner; padding-top: 15px;">
		<img src="https://julienbraida-van3kfw.netdna-ssl.com/wp-content/uploads/2014/01/Martz90-Circle-Addon1-Text-plus.ico"
		style="width:30px; height:30px; cursor: pointer;" onclick="createSQtable2()">
		                         　        　　　　　　　　　
	</td>
</tr>	
</table>
</div>
<br><br><br><br><br><br>
<hr width = "100%" color = "#DADCE0">
<!-- 4.상품 사진 -->
<h1 style="margin-top: 20px;">상품 이미지 업로드</h1>
<div align="center" style="margin-top: 30px;">
<table style="align:center;" border='0' id="imgUp_table">
<colgroup>
   <col width="300px"><col width="300px"><col width="300px"><col width="300px">
</colgroup>   
   <tr height="50px">
      <th></th>
      <th colspan='2'>대표 이미지</th>
      <th></th>
   </tr>
   <tr>
      <th></th>
      <td style="border: 1px solid #DADCE0; width:500px; height:500px;" id="pZone1" colspan='2'><font size='2px'>이미지를 등록해주세요.</font></td>
      <th></th>      
   </tr>
   <tr style="text-align: center; width:500px;">
      <td></td>
      <td colspan='2'>
         <img alt="x" src="https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/camera-512.png" style="width:30px;height:30px;cursor: pointer;padding-top: 2px;" id="btn-upload1">
         
      </td>
      <td></td>
   </tr>
   
   <tr height="50px"><td colspan="4"></td></tr>
   <tr height="50px" style="margin-top: 100px;">
      <th>이미지2</th><th>이미지3</th><th>이미지4</th><th>이미지5</th>
   </tr>
   <tr height="300px" style="width:100%;">
      <td style="border: 1px solid #DADCE0;" id="pZone2"><font size='2px'>이미지를 등록해주세요.</font></td>
      <td style="border: 1px solid #DADCE0;" id="pZone3"><font size='2px'>이미지를 등록해주세요.</font></td>
      <td style="border: 1px solid #DADCE0;" id="pZone4"><font size='2px'>이미지를 등록해주세요.</font></td>
      <td style="border: 1px solid #DADCE0;" id="pZone5"><font size='2px'>이미지를 등록해주세요.</font></td>
   </tr>
   <tr>
      <td>
         <img alt="x" src="https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/camera-512.png" style="width:30px;height:30px;cursor: pointer;" id="btn-upload2">
      </td>
      <td>
         <img alt="x" src="https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/camera-512.png" style="width:30px;height:30px;cursor: pointer;" id="btn-upload3">
      </td>
      <td>
         <img alt="x" src="https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/camera-512.png" style="width:30px;height:30px;cursor: pointer;" id="btn-upload4">
      </td>
      <td>
         <img alt="x" src="https://cdn3.iconfinder.com/data/icons/linecons-free-vector-icons-pack/32/camera-512.png" style="width:30px;height:30px;cursor: pointer;" id="btn-upload5">
      </td>
      
   <tr>
</table>
</div>
<br><br><br><br>
<hr width = "100%" color = "#DADCE0">
<!-- 5.상품 상세정보 입력 -->
<h1 style="margin-top: 20px;">상품 상세정보 입력</h1><br>
<div align="center" style="margin-top: 30px;">
<div style="width:70%;">
	<textarea name="content" id="summernote" style="padding-left: 36%;"></textarea>
</div>
</div>
<br><br><br><br>

<!-- 판매등록 버튼 -->


<form action="/admin/company/registerInsert" enctype="multipart/form-data" method="post">
	
	<input type="hidden" name="c_name" value=${c_name }>
	
	<!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
	<!-- 1 -->
	<input type='hidden' name="c1_name" id="c1_name">
	<input type='hidden' name="c2_name" id="c2_name">
	<input type='hidden' name="c3_name" id="c3_name">
	<!-- 2 -->
	<input type='hidden' name="p_name" id="p_name">
	<input type='hidden' name="p_title" id="p_title">
	<input type='hidden' name="p_price" id="p_price" value="0">
	<input type='hidden' name="cp_code" id="cp_code">
	<input type='hidden' name="nation" id="nation">
	<input type='hidden' name="mdate" id="mdate">
	<!-- 3 -->
	<input type='hidden' name="p_color" id="p_color">
	<input type='hidden' name="p_size" id="p_size">
	<input type='hidden' name="p_quantity2" id="p_quantity">
	<!-- 4 -->
	<input type="file" id="fileUpload1" name="fileUpload1" style="display: none;" onchange="changeValue(this)"/>
	<input type="file" id="fileUpload2" name="fileUpload2" style="display: none;" onchange="changeValue(this)"/>
	<input type="file" id="fileUpload3" name="fileUpload3" style="display: none;" onchange="changeValue(this)"/>
	<input type="file" id="fileUpload4" name="fileUpload4" style="display: none;" onchange="changeValue(this)"/>
	<input type="file" id="fileUpload5" name="fileUpload5" style="display: none;" onchange="changeValue(this)"/>
	<!-- 5 -->
	<input type='hidden' name="detail" id="_detail">
	
	<!-- 전송! -->
	<div align='center'><input type="submit" id="finishBtn" class="f_button" value="상품 등록" ></div>
</form>

<input type='hidden' id="c2_seq">

<!-- 메시지 MODAL영역 -->
<div class="msgModal">
   <div class="msg-content">
      <span id="msg"></span>
   </div>
</div>

<!--------------------------------------------- ★SCRIPT ZONE★ ---------------------------------------------->
<script>
var sizeArr = new Array();
var sizeArr2 = new Array();
</script>

<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>
<!-- 금액 comma -->
<script>
function numberWithCommas(x) {
	$("#_pprice").val(x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    $("#p_price").val(parseInt(x));
    //alert($("#p_price").val());
}
</script>
<!-- 등록버튼 -->
<script>

$(document).on('click', '#finishBtn', function(){
	
	alert("상품등록이 완료되었습니다");
	/* if($("#_pname").val()!="" && $("#_ptitle").val() && ) */
	
	//메시지 모달
     $("#msg").html("<strong>상품등록이 완료되었습니다.</strong>");
     	 $(".msgModal").fadeIn();
    	 setTimeout(function() {
    		$(".msgModal").fadeOut();
     },1000);	
	
	$("#p_name").val($("#_pname").val());
	$("#p_title").val($("#_ptitle").val());
	
	//$("#p_price").val(parseInt($("#_pprice").val()));
	
	$("#nation").val($("#_pnation").val());
	$("#cp_code").val($("#_cpcode").val());
	$("#mdate").val($("#_pmdate1").val() + $("#_pmdate2").val());

	/* 입력받은 수량 가져오기 */
	var quantities = "";
	for (var i = 0; i < sizeArr.length; i++) {
		quantities += $(".getPQ" + i).val();
		quantities += "/";
	}
	
	$("#p_quantity").val(quantities);
	
	
	/* 에디터 value 가져오기 */
	var text = $("#summernote").val();
	$("#_detail").val(text);
	
});
</script>

<!-- SUMMERNOTE -->
<script>
  $('#summernote').summernote({
    placeholder: '',
    tabsize: 2,
    height:600
  });
</script>

<!-- 1차 카테고리 선택 -->
<script>
$(document).ready(function(){
	$(document).on('click', '.c1sel', function(){
		var c1_seq = $(this).attr("value");
		//$("#c1_seq").val(c1_seq);
		
		var c1_name = $(this).attr("value2");
		$("#c1_name").val(c1_name);
				
		$(".c1sel").attr('style', 'background-color:white');
		$(this).attr('style', 'background-color:#d7fd75');
		
		$(".c2Div").remove();
		$(".c3Div").remove();
		$("#cate3").html("<font size='2px' class='c3Div2'>2차 카테고리를 선택해주세요.</font>");
		$("#sizeZone").html("<font size='2px' style='padding-left:36%;' class='sizeDiv'>카테고리를 모두 선택해주세요.</font>");

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
		
	});
});	

function addCate2(arr, arrLen) {
	//alert("길이 : " + arrLen);
	
	/* <ul class="drop-down" id="cate2"> */
	var str ="";
	str = "<input type='radio' id='check2' style='display: none'>";
	for (var i = 0; i < arrLen; i++) {
		
		str += "<div class='c2Div'><label for='check2' style='cursor:pointer' background-color: white;' value='" + arr[i].c2_seq + "' value2='"+ arr[i].c2_name +"' class='c2sel'>";
		str += arr[i].c2_name;
		str += "</label><br></div>";
	}
	$("#cate2").append(str);
	
}
</script>
<!-- 2차 카테고리 선택 -->
<script>
$(document).ready(function(){
	$(document).on('click', '.c2sel', function(){
		var c2_seq = $(this).attr("value");
		$("#c2_seq").val(c2_seq);
		var c2_name = $(this).attr("value2");
		$("#c2_name").val(c2_name);
		
		$(".c2sel").attr('style', 'background-color:white');
		$(this).attr('style', 'background-color:#d7fd75');
		
		$(".c3Div").remove();
		$(".c3Div2").remove();
		$(".size_select").remove();
		$("#sizeZone").html("<font size='2px' style='padding-left: 36%;' class='sizeDiv'>카테고리를 모두 선택해주세요.</font>");
		
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
	});			
});
function addCate3(arr, arrLen) {
	
	/* <ul class="drop-down" id="cate2"> */
	var str ="";
	str += "<input type='radio' id='check3' style='display: none'>";
	for (var i = 0; i < arrLen; i++) {
		
		str += "<div class='c3Div'><label for='check3' style='cursor:pointer' background-color: white;' value='" + arr[i].c3_seq + "' value2='"+arr[i].c3_name+"' class='c3sel'>";
		str += arr[i].c3_name;
		str += "</label><br></div>";
	}
	$("#cate3").append(str);
}
</script>
<!-- 3차 카테고리 선택 -->
<script>

var clickArr = 0;

$(document).ready(function(){
	$(document).on('click', '.c3sel', function(){
		$(".sizeDiv").remove();
		$(".size_select").remove();
		
		var c3_name = $(this).attr("value2");
		$("#c3_name").val(c3_name);
		$(".c3sel").attr('style', 'background-color:white');
		$(this).attr('style', 'background-color:#d7fd75');
		
		var sel_c2seq = $("#c2_seq").val();
		
		$.ajax({
	        type:"get",
	        data: "c2_seq=" + sel_c2seq,
	        url:"/store/sizeUnit",
	        success:function( data ){
				//alert("성공!!!!!!!!!!!!!!!!!!!");	        	
	        	//alert(data.length);
	        	loadSizeunit(data);
	        	clickArr = data.length;
	        },
	        error:function(){
	           alert("error!!"); 
	        }
	   }) 
	});			
});
/* 사이즈 단위 불러오기 */
function loadSizeunit(data) {
	var str = "";
	str = "<div align='center' class='size_select'>";
	for (var i = 0; i < data.length; i++) {
		console.log(data[i]);
		str += "<input type='checkbox' name='chk_size' id='checkSize"+i+"' class='_checkSize' style='display:none' value='"+data[i]+"'>";
		str += "<label for='checkSize"+i+"' value2='checkSize"+i+"' style='cursor:pointer' background-color: white; width:60px; name='e_size' height:30px;' value='"+data[i]+"' class='each_size'>";
		str += data[i];
		str += "</label>";
	}
	str += "<br></div>";
	$("#sizeZone").append(str);
	
}
</script>
<!-- 각 사이즈 클릭 -->
<script>
$(document).ready(function(){
$(document).on('click', '.each_size', function(){
		var val2 = $(this).attr("value2");
		var val = "#" + val2;
		
		var bool = $("input:checkbox[id='"+val2+"']").is(":checked");
		//alert(bool);
		if(bool){
			$(this).attr('style', 'background-color:white');
		}else{
			$(this).attr('style', 'background-color:#d7fd75');
		}
		
	});
});
</script>

<!-- 사이즈별 수량 입력테이블 생성(NEW) -->
<script>
function createSQtable2(){
	
	var color = $("#colorSelect").val();
	
	if($("#c1_name").val()!="" && $("#c2_name").val()!="" && $("#c3_name").val()!=""){
		
		if(color != ""){
				
				//사이즈 get
				$('input:checkbox[name=chk_size]:checked').each(function() { 
					sizeArr.push(this.value);
			    }); 
				
			if(sizeArr.length != 0){
				
				$(".sqDiv").hide();
				
				var color = $("#colorSelect").val();
				$("#p_color").val(color);
				
				var sizeNames = "";
				var str = "";
				str += "<table style='width:850px; align:center;' border='0' class='addSQtable'>";
				str += "<colgroup><col width='30%'><col width='30%'><col width='30%'></colgroup>";		/* <col width='10%'> */
				
				str += "<tr style='margin-bottom:10px; height:50px;'><th>색상</th><th>사이즈</th><th>수량</th></tr>";
				
				for(var i=0; i<sizeArr.length; i++){
					
					sizeNames += sizeArr[i];
					sizeNames += "/";
					
					str += "<tr style='height:20px;'><td>" + color + "</td>";
					str += "<td>"+sizeArr[i]+"</td>";
					str += "<td><input type='number'style='height:5px;' class='getPQ"+i+"' onchange='chkNegative(this.value)'></td>";
					/* str += "<td><img alt='x' src='https://cdn1.iconfinder.com/data/icons/color-bold-style/21/05-512.png'"; */
					/* str += "style='width:30px; height:30px; cursor: pointer;'></td>"; */
					str += "<tr><br>";
				}
				
				str += "</table>";
				$("#p_size").val(sizeNames);
				
				$(".sqTable").append(str);
			}else{
				alert("사이즈를 선택해주세요.");
			}	
		}
		else{
			alert("색상을 선택해주세요.");		
		}
	}else{
		alert("카테고리를 먼저 선택해주세요.");		
	}
}

</script>
<!-- 수량 음수체크 -->
<script>
function chkNegative(q){
	if(q<0){
		alert("입력가능한 최소 수량은 0 입니다");
		return q.replace(0);		
	}	
}
</script>
<!-- FREE사이즈 클릭 -->
<script>
$(document).ready(function(){
	$(document).on('click', '.free_size', function(){
		var bool = $("input:checkbox[id='sFree']").is(":checked");
		if(bool){
			$(this).attr('style', 'background-color:white');
		}else{
			$(this).attr('style', 'background-color:#d7fd75');
			$(".sml_size").attr('style', 'background-color:white');
			$("input:checkbox[class='allsize']").prop("checked", false);
		}	
	});			
});
</script>

<!-- 파일업로드 버튼 -->
<script type="text/javascript">
/* 이미지1 */	
$(function() {
	$('#btn-upload1').click(function(e) {
		e.preventDefault();
		$('#fileUpload1').click();
	});
});
/* 이미지2 */	
$(function() {
	$('#btn-upload2').click(function(e) {
		e.preventDefault();
		$('#fileUpload2').click();
	});
});
/* 이미지3 */	
$(function() {
	$('#btn-upload3').click(function(e) {
		e.preventDefault();
		$('#fileUpload3').click();
	});
});
/* 이미지4 */	
$(function() {
	$('#btn-upload4').click(function(e) {
		e.preventDefault();
		$('#fileUpload4').click();
	});
});
/* 이미지5 */	
$(function() {
	$('#btn-upload5').click(function(e) {
		e.preventDefault();
		$('#fileUpload5').click();
	});
});
</script>

<!-- 업로드 후 img 미리보기 -->
<script>
<!-- 이미지1미리보기 -->
var sel_file;

$(document).ready(function() {
	$("#fileUpload1").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
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
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:600px;height:600px;'>";
			$("#pZone1").html("");
			$("#pZone1").append(img_html);
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
		}
		reader.readAsDataURL(f);
	});
}
</script>
</body>
</html>