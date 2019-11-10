<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<!-- security token, header -->
<script>
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
</script>
<script src="http://malsup.github.com/jquery.form.js"></script>

<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	href="<%=request.getContextPath() %>/css/admin/main/resourceupdate.css">
</head>
<body>
	<div id="main-div" style="width:;">
	
	<div align="right" style="margin-bottom: 2%; margin-right: 3%;">
		<font style="font-size: 12px;"><strong style="margin-right: 17px;">LAST CHANGE</strong><br>
		${resource.u_date }</font>
	</div>




	<div align="center">
		<!-- banner -->
		<div id="bannerresource-div">
			<div id="eachtitle-div"> 
				<strong>MAIN BANNER</strong> 
			</div>
			<div align="center">
			<form id="udtfrmbanner" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<c:if test="${resource.mainbanner_type == 'VIDEO' }">			
					<div class="previewbanner" id="previewbanner-video">
						<video src="/upload/mainresource/${resource.mainbanner_file }"
							width="80%" height="10%" loop="loop" autoplay="autoplay" 
						></video>						
					</div>
					<div class="previewbanner" id="previewbanner-photo" style="display:none;">
						<br><br><br><br><br><strong>배너 사진을 등록해주세요.</strong><br><br><br><br><br>
					</div>
				<button id="btn-banner_udt0">CHANGE</button>
				<input type="file" name="fileload" id="banner-upload0" style="display:none">	
				<button id="btn-banner_udt" style="display:none">CHANGE</button>
				<input type="file" name="fileload" id="banner-upload" style="display:none">
				</c:if>
				
				<c:if test="${resource.mainbanner_type == 'PHOTO' }">
					<div class="previewbanner" id="previewbanner-photo">
						<img src="/upload/mainresource/${resource.mainbanner_file }" style="width: 50%;height: 50%;">
					</div>
					<div class="previewbanner" id="previewbanner-video" style="display:none; width:auto; height:auto;">
						<br><br><br><br><br>
						<strong>배너 영상을 등록해주세요.</strong>
						<br><br><br><br><br>
					</div>
					
					
					<!-- photo 2 photo -->
					<button id="btn-banner_udt">CHANGE</button>
					
					<input type="file" name="fileload" id="banner-upload" style="display:none">
					<!-- photo 2 video -->
					<button id="btn-banner_udt0" style="display:none">CHANGE</button>
					<input type="file" name="fileload" id="banner-upload0" style="display:none">	
				</c:if>
				
				<input type="hidden" name="which" value="banner">
				<input type="hidden" name="bannertype" id="_bannertype" value="${resource.mainbanner_type }">
			</form>
			</div>
			
		</div>
				
			<div id="choice_checkbox">
				<fieldset>
					<label> <input class="cb cb1" type="checkbox" name="bannertype" value="video"
						onclick="cbChange(this)" <c:out value="${resource.mainbanner_type == 'VIDEO'? 'checked':'' }"/> /> <i></i> 
						<span>VIDEO</span>
					</label> 
					<label> <input class="cb cb2" type="checkbox" name="bannertype" value="photo"
						onclick="cbChange(this)" <c:out value="${resource.mainbanner_type == 'PHOTO'? 'checked':'' }"/> /> <i></i> 
						<span>PHOTO</span>
					</label>
				</fieldset>
			</div>
	
	<!-- photo1 -->
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>PHOTO1</strong>
			</div>
			<div id="eachcontent-div2">
			<form id="udtfrmphoto1" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewphoto1">
					<img src="/upload/mainresource/${resource.photo1_file }" alt="사진없음" style="width: 70%;height: 70%;">
				</div>
				<button id="btn-photo1_udt">CHANGE</button>
				<input type="file" name="fileload" id="photo1-upload" style="display:none">
				<input type="hidden" name="which" value="photo1">
			</form>				
				<br>
			<!-- text -->
				<div id="text-div">
					<table border='0' style="margin:2%;">
						<colgroup><col width="12%"><col width="78%"><col width="10%"></colgroup>
						<tr>
							<th>TITLE</th>
							<td>
								<input type="text" id="photo1_title" value="${resource.photo1_title }" onkeyup="inputkeyup('photo1_title', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-photo1_title">CHANGE</button>
							</td>
						</tr>
						<tr>
							<th>CONTENT</th>
							<td>
								<input type="text" id="photo1_content" value="${resource.photo1_content }" onkeyup="inputkeyup('photo1_content', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-photo1_content">UPDATE</button>
							</td>
						</tr>
					</table>
				</div>	
			</div>
		</div>
		
		
	<!-- video1 -->		
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>VIDEO1</strong>
			</div>
			<div id="eachcontent-div">
			<form id="udtfrmvideo1" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewvideo1">
					<video src="/upload/mainresource/${resource.video1_file }"
						width="85%" height="10%" loop="loop" autoplay="autoplay" 
					></video>					
				</div>
				<button id="btn-video1_udt">CHANGE</button>
				<input type="file" name="fileload" id="video1-upload" style="display:none">
				<input type="hidden" name="which" value="video1">
				<br>
			</form>
			<br>
			<!-- text -->
				<div id="text-div">
					<table border='0' style="margin:2%;">
						<colgroup><col width="12%"><col width="78%"><col width="10%"></colgroup>
						<tr>
							<th>TITLE</th>
							<td>
								<input type="text" id="video1_title" value="${resource.video1_title }" onkeyup="inputkeyup('video1_title', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-video1_title">CHANGE</button>
							</td>
						</tr>
						<tr>
							<th>CONTENT</th>
							<td>
								<input type="text" id="video1_content" value="${resource.video1_content }" onkeyup="inputkeyup('video1_content', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-video1_content">UPDATE</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<!-- photo2 -->				
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>PHOTO2</strong>
			</div>
			<div id="eachcontent-div2">
			<form id="udtfrmphoto2" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewphoto2">
					<img src="/upload/mainresource/${resource.photo2_file }" alt="사진없음" style="width: 70%;height: 70%;">
				</div>
				<button id="btn-photo2_udt">CHANGE</button>
				<input type="file" name="fileload" id="photo2-upload" style="display:none">
				<input type="hidden" name="which" value="photo2">
			</form>	
			<br>
			<!-- text -->
				<div id="text-div">
					<table border='0' style="margin:2%;">
						<colgroup><col width="12%"><col width="78%"><col width="10%"></colgroup>
						<tr>
							<th>TITLE</th>
							<td>
								<input type="text" id="photo2_title" value="${resource.photo2_title }" onkeyup="inputkeyup('photo2_title', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-photo2_title">CHANGE</button>
							</td>
						</tr>
						<tr>
							<th>CONTENT</th>
							<td>
								<input type="text" id="photo2_content" value="${resource.photo2_content }" onkeyup="inputkeyup('photo2_content', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-photo2_content">UPDATE</button>
							</td>
						</tr>
					</table>
				</div>	
			</div>
		</div>		

	<!-- video2 -->		
		<div id="eachresource-div">
			<div id="eachtitle-div">
				<strong>VIDEO2</strong>
			</div>
			<div id="eachcontent-div">
			<form id="udtfrmvideo2" method="POST" enctype="multipart/form-data" onSubmit="return false;">
				<div class="previewvideo2">
					<video src="/upload/mainresource/${resource.video2_file }"
						width="85%" height="10%" loop="loop" autoplay="autoplay" 
					></video>					
				</div>
				<button id="btn-video2_udt">CHANGE</button>
				<input type="file" name="fileload" id="video2-upload" style="display:none">
				<input type="hidden" name="which" value="video2">
				<br>
			</form>
			<br>
			<!-- text -->
				<div id="text-div">
					<table border='0' style="margin:2%;">
						<colgroup><col width="12%"><col width="78%"><col width="10%"></colgroup>
						<tr>
							<th>TITLE</th>
							<td>
								<input type="text" id="video2_title" value="${resource.video2_title }" onkeyup="inputkeyup('video2_title', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-video2_title">CHANGE</button>
							</td>
						</tr>
						<tr>
							<th>CONTENT</th>
							<td>
								<input type="text" id="video2_content" value="${resource.video2_content }" onkeyup="inputkeyup('video2_content', this.value)">
							</td>
							<td style="padding-bottom: 3%">
								<button type="button" class="text_update-btn" id="udtbtn-video2_content">UPDATE</button>
							</td>
						</tr>
					</table>
				</div>	
			</div>
		</div>
	
	

	
			
	</div>
	
	</div>

<!-- 메시지 MODAL영역 -->
<div class="msgModal">
   <div class="msg-content">
      <span id="msg"></span>
   </div>
</div>


<input type="hidden" id="_update-object">
<input type="hidden" id="_update-text">

<script>

var bannertype = "${resource.mainbanner_type}";

var sel_file;

var video1title = "${resource.video1_title }";
var video1content = "${resource.video1_content }";
var video2title = "${resource.video2_title }";
var video2content = "${resource.video2_content }";
var photo1title = "${resource.photo1_title }";
var photo1content = "${resource.photo1_content }";
var photo2title = "${resource.photo2_title }";
var photo2content = "${resource.photo2_content }";

function textupdate(){
	
	var object = $("#_update-object").val();
	var text = $("#_update-text").val();
	//alert(object);
	//alert(text);
	
	$.ajax({
        type:"get",
        data: "object=" + object + "&text=" + text, 
        url:"/admin/mainresource/textupdate",
        success:function( data ){
        	if(object == 'video1_title'){
        		video1title = text;	
        	}
        	if(object == 'video1_content'){
        		video1content = text;	
        	}
        	if(object == 'video2_title'){
        		video2title = text;	
        	}
        	if(object == 'video2_content'){
        		video2content = text;	
        	}
        	if(object == 'photo1_title'){
        		photo1title = text;	
        	}
        	if(object == 'photo1_content'){
        		photo1content = text;	
        	}
        	if(object == 'photo2_title'){
        		photo2title = text;	
        	}
        	if(object == 'photo2_content'){
        		photo2content = text;	
        	}
        	
        	/* id="udtbtn-video1_title" */ 
        	$("#udtbtn-" + object).css("background-color", "#BFBFBF");
        	$("#udtbtn-" + object).css("color", "black");
        	$("#udtbtn-" + object).html("CHANGE");
        	$("#udtbtn-" + object).attr("onclick","");
        	
        	//메시지 모달
		     $("#msg").html("<strong>수정이 완료되었습니다.</strong>");
	      	 $(".msgModal").fadeIn();
	     	 setTimeout(function() {
	     		$(".msgModal").fadeOut();    	
	         },500);
        	 
        	 
        },
        error:function(){
           alert("error!!"); 
        }
    })
	
}

function inputkeyup(object, text){
	
	//alert(text);
	//alert(object);
	
	//alert(text);
	
	var bf = $("#_update-object").val();
	//alert("before:" + bf);
	//alert("object:" + object);
	
	$(".text_update-btn").css("background-color", "white");
	$(".text_update-btn").css("color", "black");
	$(".text_update-btn").html("CHANGE");
	$(".text_update-btn").attr("onclick","");
	
	if(bf != object){
		if(bf == 'video1_title'){			
			$("#video1_title").val(video1title);
		}
		if(bf == 'video1_content'){
			$("#video1_content").val(video1content);
		}
		if(bf == 'video2_title'){
			$("#video2_title").val(video2title);
		}
		if(bf == 'video2_content'){
			$("#video2_content").val(video2content);
		}
		if(bf == 'photo1_title'){			
			$("#photo1_title").val(photo1title);
		}
		if(bf == 'photo1_content'){
			$("#photo1_content").val(photo1content);
		}
		if(bf == 'photo2_title'){
			$("#photo2_title").val(photo2title);
		}
		if(bf == 'photo2_content'){
			$("#photo2_content").val(photo2content);
		}
	}
	
	$("#udtbtn-"+object).css("background-color", "#CFEC40");
	$("#udtbtn-"+object).html("FINISH");
	$("#udtbtn-"+object).css("color", "white");
	$("#udtbtn-"+object).attr("onclick","textupdate()"); 
	
	$("#_update-text").val(text);
	$("#_update-object").val(object);
		
}

$(document).on('click', '#btn-banner_udt0', function(e){	
	e.preventDefault();
	$('#banner-upload0').click();
});
$(document).on('click', '#btn-banner_udt', function(e){	
	e.preventDefault();
	$('#banner-upload').click();
});
$(document).on('click', '#btn-video1_udt', function(e){	
	e.preventDefault();
	$('#video1-upload').click();
});
$(document).on('click', '#btn-video2_udt', function(e){	
	e.preventDefault();
	$('#video2-upload').click();
});
$(document).on('click', '#btn-photo1_udt', function(e){	
	e.preventDefault();
	$('#photo1-upload').click();
});
$(document).on('click', '#btn-photo2_udt', function(e){	
	e.preventDefault();
	$('#photo2-upload').click();
});

//banner preview(photo)
$(document).ready(function() {
	$("#banner-upload").on("change", handleImgsFilesSelect);
});

function handleImgsFilesSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지 확장자만 등록이 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:60%;height:60%;'>";
			$("#previewbanner-photo").html("");
			$("#previewbanner-photo").append(img_html);
			$("#btn-banner_udt").remove();
			$("#previewbanner-photo").after("<button class='udt-finishbtn' id='banner-photo_fns' value='banner' value2='' value3='photo' style='background-color:#CFEC40; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//banner preview(video)
$(document).ready(function() {
	$("#banner-upload0").on("change", handleImgsFilesSelect1);
});

function handleImgsFilesSelect1(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
	 	if (!f.type.match("video.*")) {
			alert("동영상 확장자만 등록이 가능합니다.");
			$("input_videos").val("");
			return;
		} 
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var video_html = "<video src='" + e.target.result + "' width='80%' height='10%' loop='loop' autoplay='autoplay'></video>";
			$("#previewbanner-video").html("");
			$("#previewbanner-video").append(video_html);
			$("#btn-banner_udt0").remove();
			$("#previewbanner-video").after("<button class='udt-finishbtn' id='banner-video_fns' value='banner' value2='0' value3='video' style='background-color:#CFEC40; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}


//photo1 preview
$(document).ready(function() {
	$("#photo1-upload").on("change", handleImgsFilesSelect4);
});

function handleImgsFilesSelect4(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지 확장자만 등록이 가능합니다.");
			$("input_imgs").val("");
			return;
		}
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:60%;height:60%;'>";
			$(".previewphoto1").html("");
			$(".previewphoto1").append(img_html);
			$("#btn-photo1_udt").remove();
			$(".previewphoto1").after("<button class='udt-finishbtn' value='photo1' style='background-color:#CFEC40; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}

//video1 preview
$(document).ready(function() {
	$("#video1-upload").on("change", handleImgsFilesSelect2);
});
function handleImgsFilesSelect2(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
	 	if (!f.type.match("video.*")) {
			alert("동영상 확장자만 등록이 가능합니다.");
			$("input_videos").val("");
			return;
		} 
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var video_html = "<video src='" + e.target.result + "' width='80%' height='10%' loop='loop' autoplay='autoplay'></video>";
			$(".previewvideo1").html("");
			$(".previewvideo1").append(video_html);
			$("#btn-video1_udt").remove();
			$(".previewvideo1").after("<button class='udt-finishbtn' value='video1' style='background-color:#CFEC40; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}


//photo2 preview
$(document).ready(function() {
	$("#photo2-upload").on("change", handleImgsFilesSelect5);
});

function handleImgsFilesSelect5(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
		if (!f.type.match("image.*")) {
			alert("이미지 확장자만 등록이 가능합니다.");
			$("input_imgs").val("");
			return;
		} 
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var img_html = "<img src=\"" + e.target.result + "\" / style='width:60%;height:60%;'>";
			$(".previewphoto2").html("");
			$(".previewphoto2").append(img_html);
			$("#btn-photo2_udt").remove();
			$(".previewphoto2").after("<button class='udt-finishbtn' value='photo2' style='background-color:#CFEC40; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}


//video2 preview
$(document).ready(function() {
	$("#video2-upload").on("change", handleImgsFilesSelect3);
});
function handleImgsFilesSelect3(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);

	filesArr.forEach(function(f) {
	 	if (!f.type.match("video.*")) {
			alert("동영상 확장자만 등록이 가능합니다.");
			$("input_videos").val("");
			return;
		} 
		sel_file = f;
		var reader = new FileReader();
		reader.onload = function(e) {
			var video_html = "<video src='" + e.target.result + "' width='80%' height='10%' loop='loop' autoplay='autoplay'></video>";
			$(".previewvideo2").html("");
			$(".previewvideo2").append(video_html);
			$("#btn-video2_udt").remove();
			$(".previewvideo2").after("<button class='udt-finishbtn' value='video2' style='background-color:#CFEC40; color:white; width:150px;'>FINISH</button>");
		}
		reader.readAsDataURL(f);
	});
}




/////////////////////////////////////////////////////////////////////////////////////////////////////
/* AJAXFORM */
$(document).on('click', '.udt-finishbtn', function(){
	
	var which = $(this).val();
	var bt = $(this).attr("value2");
	var bt2 = $(this).attr("value3");
	
	  $("#udtfrm" + which).ajaxForm({
          type : 'POST',
          enctype : "multipart/form-data",
          url : "/admin/mainresource/resourceupdate",
          processData : false,
          contentType : false,
          cache : false,
          beforeSend:function(xhr){
       	   xhr.setRequestHeader("${_csrf.token}", "${_csrf.headerName}");
          },
          success : function(data){
        	if(data === 'UPDATE'){
				if(which == 'banner'){
					$("#previewbanner-" + bt2).after("<button id='btn-"+ which + "_udt" + bt + "'>CHANGE</button>");
					if(bt2 === 'video'){
						$("#previewbanner-photo").html("");
						$("#previewbanner-photo").append("<br><br><br><br><br><br><strong>배너 사진을 등록해주세요.</strong><br><br><br><br><br><br>");
					}else if(bt2 === 'photo'){
						$("#previewbanner-video").html("");
						$("#previewbanner-video").append("<br><br><br><br><br><br><strong>배너 영상을 등록해주세요.</strong><br><br><br><br><br><br>");
					}
				}else{
					$(".preview" + which).after("<button id='btn-"+ which + "_udt'>CHANGE</button>");			
				}
				$(".udt-finishbtn").remove();
				/* $("#oPhoto"+photoNumber).attr('src', '/upload/store/'+data); */
				//메시지 모달
			     $("#msg").html("<strong>수정이 완료되었습니다.</strong>");
		      	 $(".msgModal").fadeIn();
		     	 setTimeout(function() {
		     		$(".msgModal").fadeOut();    	
		         },500);		
        	}
          },
          error : function(){
          	   alert("error!!");
          },
      });

      $("#udtfrm"+which).submit();
	
});

function cbChange(obj) {
	  var cbs = document.getElementsByClassName("cb"); 
	  for (var i = 0; i < cbs.length; i++) {
	    cbs[i].checked = true;
	  }
	  obj.checked = false;
	 
	  var typ =$("input:checkbox[name='bannertype']:checked").val()
	 // alert(b);
	 // alert(bannertype);
	 alert(typ);
	 $("#_bannertype").val(typ); 
	 
	  if(bannertype === 'PHOTO'){
		  if(typ === 'video'){
			  $("#previewbanner-photo").hide();
			  $("#btn-banner_udt").hide();
			  $("#btn-banner_udt0").show();
			  $("#previewbanner-video").show();
			  $("#banner-video_fns").show();
			  $("#banner-photo_fns").hide();
		  }else if(typ == 'photo'){
			  $("#previewbanner-photo").show();
			  $("#previewbanner-video").hide();
			  $("#btn-banner_udt").show();
			  $("#btn-banner_udt0").hide();
			  $("#banner-video_fns").hide();
			  $("#banner-photo_fns").show();
		  }
	  }else if(bannertype === 'VIDEO'){
		  if(typ === 'photo'){
			  $("#previewbanner-photo").show();
			  $("#previewbanner-video").hide();
			  $("#btn-banner_udt").show();
			  $("#btn-banner_udt0").hide();
			  $("#banner-video_fns").hide();
			  $("#banner-photo_fns").show();
		  }else if(typ == 'video'){
			  $("#previewbanner-photo").hide();
			  $("#btn-banner_udt").hide();
			  $("#btn-banner_udt0").show();
			  $("#previewbanner-video").show();
			  $("#banner-video_fns").show();
			  $("#banner-photo_fns").hide();
		  }
		  
		  
		  
		  
	  }
	  
			  
}


</script>	
</body>
</html>