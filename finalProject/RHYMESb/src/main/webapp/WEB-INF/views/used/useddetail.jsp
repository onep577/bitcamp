<%@page import="com.rhymes.app.used.model.ProductsDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Anton' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Neucha' rel='stylesheet' type='text/css'>


<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/used/silde.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/used/detail.css">
 <%
 	ProductsDto dto = (ProductsDto)request.getAttribute("dto");
	String arr[] = dto.getPhoto_list();
 %>
 </head>
<!-- <body> -->


<div id="wrapper">
      <div id="slider-wrap">
          <ul id="slider">
        <c:set var="img" value="<%=arr %>"/>
			<c:forEach var="i" items="${img }" varStatus="status">
			 <li data-color="#1abc9c">              
				<img src="/upload/used/${i }">
             </li>
			</c:forEach>
          </ul>
           <!--controls-->
          <div class="btns" id="next"><i class="fa fa-arrow-right"></i></div>
          <div class="btns" id="previous"><i class="fa fa-arrow-left"></i></div>
          <div id="counter"></div>
                
          <div id="pagination-wrap">
            <ul>
            </ul>
          </div>
          <!--controls-->  
                 
      </div>
  
   </div>
   
   
  <div id="side_goods">
  
  <font size="5px;">${dto.title }</font>
  
  	<c:if test="${userloginid eq dto.s_id}">
			
				<button type="button" id="_updatebtn" name="updatebtn" class="rhybtn">수정</button>
				<button type="button" id="_deletebtn" name="deletebtn" class="rhybtn">삭제</button>
		</c:if>	
  
  <p style="color: gray;font-size: 15px">${dto.category }</p>
  <p style="color: gray;font-size: 15px">판매자 : ${dto.s_id }</p>
	  <p style="color: gray;font-size: 20px;"><fmt:formatNumber value="${dto.price }" type="currency"/>원</p>		 
   	<c:if test="${dto.division eq '판매완료' }">
		<font style="color: red;font-size: 20px; text-decoration: line-through;" ><b>${dto.division }</b></font>
	</c:if>
	<c:if test="${dto.division eq '판매중' }">
		<font style="color: gray;font-size: 20px">${dto.division }</font>
	</c:if>
   <br><br>
   <font style="color: gray;font-size: 15px">조회수 : ${dto.readcount }</font>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font style="color: gray;font-size: 15px;margin-bottom: -5px;">등록일 : ${dto.rdate }</font>
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	 <c:if test="${userloginid ne null}">
 		<font style="color: gray;font-size: 15px"><a href="#none" id="mybtn">
 		<img src="/img/used-img/report.png" width="25px;"height="25px"style="margin-bottom: 5px">신고하기</a></font>
	 </c:if>
	 
	 <br><br>
	 
  	 <div id="b_btn">
  	 <!-- <button type="button" class="wishBtn" style="cursor:pointer;"> -->
  	<!-- 좋아요 기능 시작!!! -->
  	 <font style="color: gray;font-size: 15px;margin-bottom: -5px;"><div id="_likes">좋아요 : ${dto.likes }</div></font>
   &nbsp;&nbsp;&nbsp;
  	<c:choose>
  		<c:when test="${userloginid ne null }"><!-- 멤버P -->
  			<c:if test="${login.islike == 'true' }"><!-- 좋아요클릭한상태 -->
	  			<a href='javascript: like_func()'><img id="likeimg" alt="" src="/img/used-img/likeAf.png" style="width: 35px" height="35px" id="like_img"></a>
	  			  	&nbsp;&nbsp;&nbsp;
  	 				<input type="button" id="_notesbtn" value="쪽지 보내기" class="basketBtn" style="cursor:pointer;">
  			</c:if>
			
			<c:if test="${login.islike == 'false' }"><!-- 좋아요클릭하지않은상태 -->
  				<a href='javascript: like_func()'><img id="likeimg" alt="" src="/img/used-img/like.png" style="width: 35px" height="35px" id="like_img"></a>
  				  	&nbsp;&nbsp;&nbsp;
  	 				<input type="button" id="_notesbtn" value="쪽지 보내기" class="basketBtn" style="cursor:pointer;">
  			</c:if>
  			<c:if test="${empty login.userid  }"><!-- 멤버p가 아닌 관리자, 판매자, 등등 -->
  				<a href="#none" class="admin"><img alt="" src="/img/used-img/likeAf.png" style="width: 35px" height="35px"></a>
  				  	&nbsp;&nbsp;&nbsp;
  	 				<input type="button" value="쪽지 보내기" class="basketBtn" style="cursor:pointer;">
  			</c:if>
  		</c:when>
	  	<c:otherwise><!-- 멤버P가 아닌 회원 -->
	  		<a href="#none" class="gologin"><img alt="" src="/img/used-img/likeAf.png" style="width: 35px" height="35px"></a>
	  		  	&nbsp;&nbsp;&nbsp;
  	 			<input type="button" value="쪽지 보내기" class="basketBtn" style="cursor:pointer;" onclick="gologin()">
	  	</c:otherwise>
  	</c:choose>

  	<br><br>
	<font style="color: gray;font-size: 15px;margin-bottom: -5px;">거래지역 : ${dto.place }</font>
	
	<div id="map" style="width:400px;height:300px; margin-top: 80px">
	</div>


			
  </div>
  </div>
<br>
		
<div id="market_info" align="left">
  	
 		<h5>상품정보 </h5>
 		<hr color="gray">
 		<br>
 		${dto.content } 

<br><br><br><br><br><br>

	<h5>상품문의 </h5>
 	<hr color="gray"> 	
	
	<table id="addtable">
	<tr>
		<td>
			<textarea rows="5" cols="85" id="_comments"placeholder="댓글을 입력하세요 댓글은 최대 80byte를 초과할 수 없습니다."
			name="contents" onKeyUp="javascript:fnChkByte(this,'80')" style="resize: none;"></textarea>
			<br>
			  <div>
				<%-- <a href="#" onclick="addComment('${dto.seq}')">등록</a> --%>
				<button type="button" onclick="addComment('${dto.seq}')" class="rhybtn">등록</button>
			  </div>
		</td>
	</tr>
	</table>
	<br>
	<div id="_addcomments"></div>
	<div id="more_btn_div" align="center"></div>
	</div>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">신고하기</h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body">
				<ul class="list">
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input1" checked /> <label for="list-input1"
						class="title">광고(상점홍보,낚시글,도배글)</label>
						<div class="desc">
							<div>
								<a href="#none" val="상점홍보" class="modal_text">상점홍보</a><br>
								<a href="#none" val="낚시글" class="modal_text">낚시글</a><br>
								<a href="#none" val="도배글" class="modal_text">도배글</a><br>
								<a href="#none" val="타사이트,어플 광고" class="modal_text">타사이트,어플 광고</a>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input2" /> <label for="list-input2"
						class="title">물품정보 부정확(카테고리,가격,사진)</label>
						<div class="desc">
							<div>
								<a href="#none" val="카테고리가 잘못됨" class="modal_text">카테고리가 잘못됨</a><br>
								<a href="#none" val="가격이 잘못됨" class="modal_text">가격이 잘못됨</a><br>
								<a href="#none" val="사진이 잘못됨" class="modal_text">사진이 잘못됨</a><br>
								<a href="#none" val="상품명이 잘못됨" class="modal_text">상품명이 잘못됨</a>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input3" /> <label for="list-input3" class="title">거래 금지 품목(담배,주류,장물)</label>
						<div class="desc">
							<div>
								<a href="#none" val="담배/주류" class="modal_text">담배/주류</a><br>
								<a href="#none" val="장물(분실폰,분실의류..)" class="modal_text">장물(분실폰,분실의류..)</a><br>
								<a href="#none" val="의약품류" class="modal_text">의약품류</a><br>
								<a href="#none" val="콘택트 렌즈" class="modal_text">콘택트 렌즈</a><br>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input4" /> <label for="list-input4"
						class="title">언어폭력(비방,욕설,성희롱)</label>
						<div class="desc">
							<div>
								<a href="#none" val="비방/욕설" class="modal_text">비방/욕설</a><br>
								<a href="#none" val="성희롱" class="modal_text">성희롱</a>
							</div>
						</div></li>
					<li><input type="radio" name="list" class="list-checkbox"
						id="list-input5" /> <label for="list-input5"
						class="title">기타사유(직접입력)</label>
						<div class="desc">
							<div>
							
							<textarea cols="60" rows="3" id="modal_area"  style="resize: none;"></textarea>
							<br>
							<button type="button" class="modal_btn" style="color: black">등록</button>
							</div>
						</div></li>
				</ul>
			</div>
			<div class="modal-footer">
			<!-- 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			 --></div>
		</div>
	
	</div>
  </div>

<script type="text/javascript">

$(".admin").click(function() {
	alert("개인회원만 좋아요 기능을 사용 할 수 있습니다");
})

$("#_notesbtn").click(function() {
	var send_id =  "${dto.s_id}";
	
	var url= "/mypage/notesanswer?send_id="+send_id;    //팝업창 페이지 URL
	var winWidth = 500;
    var winHeight = 420;
    
    var popupX = (window.screen.width / 2) - (580 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (500 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
});

function gologin(){
	 var con_test = confirm("로그인이 필요합니다 로그인 페이지로 이동하시겠습니까?");	/* 문자를 보낼껀지 물어본다 */
	 
	 if(con_test == true){
		location.href="/member/login";
   }
	 
	 else if(con_test == false){
  		
	 }
}

function fnChkByte(obj, maxByte){
	
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4)
        {
            rbyte += 2;                                         //한글2Byte
        }
        else
        {
            rbyte++;                                            //영문 등 나머지 1Byte
        }


        if(rbyte <= maxByte)
        {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }


     if(rbyte > maxByte)
     {
  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
  alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
  str2 = str.substr(0,rlen);                                  //문자열 자르기
  obj.value = str2;
  fnChkByte(obj, maxByte);
     }
     else
     {
       // document.getElementById('byteInfo').innerText = rbyte;
     }
}

$(document).ready(function(){

	$(".wishBtn").click(function() {
		like_func();
	})
	
	$(".gologin").click(function() {
		gologin();
	})
	
	$("#mybtn").click(function(){
        $("#myModal").modal();
    });
    
    $(".modal_text").click(function(){
     	var str = 	$(this).attr('val')
    	var seq = "${dto.seq }";
    	var id = "${userloginid }";
    	var b_id = "${dto.s_id}";
    	
     	$.ajax({
     		url:"/used/blacklist",
     		type:"get",
     		data:{
     			str:str,
     			seq:seq,
     			id:id,
     			b_id:b_id
     		},
     		success:function(data){
     			var count = parseInt(data);
     			
     			if(count > 0) {
     			       $("#myModal").modal('hide');
     			        alert("신고가 완료되었습니다");
     			} else {
     				alert("오류 관리자한테 문의~");
     			}
     		},
     		error:function(e){
     			alert(e);
     		}
     	});
     	

    
    
    });
    
    $(".modal_btn").click(function(){
     var str =  $("#modal_area").val()
     var seq = "${dto.seq }";
 	 var id = "${login.userid }";
 	 var b_id = "${dto.s_id}";
 	
  	$.ajax({
  		url:"/used/blacklist",
  		type:"get",
  		data:{
  			str:str,
  			seq:seq,
  			id:id,
  			b_id:b_id
  		},
  		success:function(data){
  			var count = parseInt(data);
  			
  			if(count > 0) {
  			       $("#myModal").modal('hide');
  			        alert("신고가 완료되었습니다");
  			} else {
  				alert("오류 관리자한테 문의~");
  			}
  		},
  		error:function(e){
  			alert(e);
  		}
  	});
     
     
    });
    

});



//current position
var pos = 0;
//number of slides
var totalSlides = $('#slider-wrap ul li').length;
//get the slide width
var sliderWidth = $('#slider-wrap').width();

var myref;
var wid;
var next_backup;		// 댓글 html 백업
var mydiv_backup;		// 수정,삭제 html 백업

var myseq;
var my;
var next;	// tr 밑에 줄..
var mydiv;									// div로 묶인 수정,삭제 제거

var myseq2;
var my2;
var next2;
var mydiv2;

var next_backup2;		// 답글 html 백업
var mydiv_backup2;		// 답글 html 백업

var count = 0;

var rpagenumber = 1;

var heightsize = 2000;

$("#_deletebtn").click(function() {
	var seq = "${dto.seq}";
	location.href="/used/deleteProduct?seq="+seq;
})


$("#_updatebtn").click(function() {
	var seq = "${dto.seq}";
	location.href="/used/updateProduct?seq="+seq;
})


function like_func(){
	
 	$.ajax({		// 좋아요 버튼 클릭시
		url:"/used/addlikes",
		type:"get",
		data:{bno : "${dto.seq}",
			   mname : "${login.userid}"
		},
			success:function(num){ 
				if(num == 1){
					$("#likeimg").attr("src","/img/used-img/likeAf.png");
				} else if (num == 0){
					$("#likeimg").attr("src","/img/used-img/like.png");
				}
				likeCount();
			
			},
			error:function(e){
				alert("실패");
			}
	}) 
};


 function likeCount(){
	$.ajax({
		url:"/used/likeCount",
		type:"get",
		data: {
			bno : "${dto.seq}"
		},
		success:function(count){
			$("#_likes").text("좋아요 : "+count);
		},
		error:function(e){
			alert("error");
		}
	})
};

/* 페이지 로딩시 댓글 불러오기 */
$(function(){
    getCommentList();
});

/* 댓글 불러오기 Ajax */
 function getCommentList(){
	 $.ajax({
		url:"/used/getCommentsList",
		type:'get',
		data: {
			seq : "${dto.seq}",
			rpagenumber:1
		},
		success:function(data){
			
			var html = "";
			var html2 = "";
			var cnt =  data.length;

			if(data.length > 0){
				html += "<div><table id='ctable'><col width='90'><col width='50'><col width='80'><col width='80'>";
				
			for(i=0; i<data.length; i++){
				var seq = data[i].seq;
				var id = data[i].id ;
				var loginid = "${login.userid}";
				var ref = data[i].ref;
				var depth = data[i].depth;
				
				
				var arrow = "<img src='/img/used-img/arrow.png' width='10px' height='10px' style='margin-left: 15px'/>";
				
				if(depth > 0){
					html += "<tr class='ctr'><td>"+arrow+"&nbsp;<strong>"+data[i].id+"</strong></td><td><a href='#none' value='"+data[i].id+"' onclick='answer_comment(this,"+seq+","+ref+")'>답글</a></td><td>"+data[i].rdate+"</td>";
			
						
				} else {
					html += "<tr class='ctr'><td><strong>"+data[i].id+"</strong></td><td><a href='#none' value='"+data[i].id+"' onclick='answer_comment(this,"+seq+","+ref+")'>답글</a></td><td>"+data[i].rdate+"</td>";
						
				}
				
				// html += "<tr><td>"+data[i].id+"</td><td><a href='#none' onclick='answer_comment(this,"+seq+","+ref+")''>답글</a></td><td>"+data[i].rdate+"</td>";
				
				if(loginid.trim() == id.trim()){
					html += "<td><div><a href='#none' onclick='update_comment(this,"+seq+")'>수정</a> | <a href='javascript: delete_comment(${dto.seq},"+seq+","+depth+","+ref+")'>삭제</a></div></td></tr>";				
				} else {
					html +="<td></td></tr>";	
				}
				
				
				
				html += "<tr class='ctr2'><td colspan='4'>"+data[i].comments+"</td></tr>";
				html += "</div>";
	
			} 
			
				if(data.length >= 10){
					
					/* html2 += "<a href='#none' id='remove_append' onclick='append_comment()'>더보기</a>"; */
					html2 += "<button type='button' class='rhybtn' id='remove_append' onclick='append_comment()'>더보기</button>";
					
				}
				
				html += "</table>";
				
				$("#more_btn_div").html(html2);
				
			} else {
				/* html += "<div class='emptycomment'><h3>작성된 댓글이 없습니다.</h3></div>"; */
				/* html += "<div>";
				html += "<table id='dtable'>";
				html += "<tr><td>등록된 댓글이 없습니다.</td></tr>";
				html += "</div>";
				html += "</table>"; */
				
			}

			$("#_addcomments").html(html);
			
			
			rpagenumber = 1;
		},
		error:function(r,s,e){
			alert("실패..");
		}
	 });
 };
 
 function append_comment(){

	rpagenumber++;
	
	//$(my).parent().parent().remove();
	
	$.ajax({
		url:"/used/getCommentCount",
		type:"get",
		data:{
			seq:"${dto.seq}",
			rpagenumber:rpagenumber
		},
		success:function(data){
			
			if(data.length > 0){
				$("#content_wrap").css('height',heightsize+560);
				heightsize+=560;
				var html = "";
				
				for(i=0;i<data.length;i++){
					var seq = data[i].seq;
					var id = data[i].id ;
					var loginid = "${login.userid}";
					var ref = data[i].ref;
					var depth = data[i].depth;
				
					var arrow = "<img src='/img/used-img/arrow.png' width='10px' height='10px'/>";
					
					if(depth > 0){
						html += "<tr class='ctr'><td>"+arrow+"&nbsp;"+data[i].id+"</td><td><a href='#none' value='"+data[i].id+"' onclick='answer_comment(this,"+seq+","+ref+")'>답글</a></td><td>"+data[i].rdate+"</td>";
				
							
					} else {
						html += "<tr class='ctr'><td>"+data[i].id+"</td><td><a href='#none' value='"+data[i].id+"' onclick='answer_comment(this,"+seq+","+ref+")'>답글</a></td><td>"+data[i].rdate+"</td>";
							
					}
					
					// html += "<tr><td>"+data[i].id+"</td><td><a href='#none' onclick='answer_comment(this,"+seq+","+ref+")''>답글</a></td><td>"+data[i].rdate+"</td>";
					
					if(loginid.trim() == id.trim()){
						html += "<td><div><a href='#none' onclick='update_comment(this,"+seq+")'>수정</a> | <a href='javascript: delete_comment(${dto.seq},"+seq+","+depth+","+ref+")'>삭제</a></div></td></tr>";				
					} else {
						html +="<td></td></tr>";	
					}
					
					
					
					html += "<tr class='ctr2'><td colspan='4'>"+data[i].comments+"</td></tr>";
					html += "</div>";
				
				}
				var tbl = $("#ctable");
				$(tbl).find('tr:last').after(html);
			}
			
			else {
				alert("더 이상 댓글이 없습니다");
				return;
			}
		},
		error(e){
			alert("에러")
		}
	});
	
 }
 
 function addComment(seq){
	 
	 var loginid = "${login.userid}";
	 
	 if(loginid == null || loginid == ""){
		 gologin();
		 return;
	 }
	 
	 var text = $("#_comments").val();
	 
	 if(text == "" || text == null){
		 alert("빈칸이나 공백은 안됩니다");
		 $("#_comments").focus();
		 return;
		 
	 }
	 
	 $.ajax({
		url:'/used/addComments',
		type:'get',
		data:{
			parent:seq,
			comments:$("#_comments").val(),
			userid:"${login.userid}"
		},
		success:function(data){
			$("#_comments").val("");
			getCommentList();
		},
		error(e){
			
		}
	 });
 };
 
 function update_comment(th,seq){	// 수정버튼
	 count++;
 	 
 	 if(count >= 2){
 		 
 		 alert("수정은 동시에 두개를 할 수 없습니다");
 		 
 		 return;
 	 }
 
 
	 myseq = seq;
	 my = th;
	 next = $(my).parent().parent().parent().next().after();	// tr 밑에 줄..
	 mydiv = $(my).parent();									// div로 묶인 수정,삭제 제거
	 
//	 $(th).parent().parent().remove(); // 여기까지가 a 태그가 포함되어있다 
	 
	next_backup = next.html();		// 댓글 html 백업
	mydiv_backup = mydiv.html();	// 수정,삭제 html 백업
	
	
	 var comment_backup = next.text();	// 댓글 내용 백업

	 
	 next.html("<td colspan='4'><textarea rows='3' cols='75' id='_ucomments' name='ucomments' onKeyUp='javascript:fnChkByte(this,80)' onchange='javascript:fnChkByte(this,80)' style='resize: none;'>"+comment_backup+"</textarea><a href='#none' onclick='updatecomment(${dto.seq},myseq)'>&nbsp;수정</a></td>");	
	 mydiv.html("<a href='#none' onclick='cancel(this)' >수정취소</a>");
	 
 }
 
 
 function answer_comment(th,seq,ref){
	 var wid = $(th).attr('value');
	 var loginid = "${login.userid}";
	 if(loginid == "" || loginid == null){
		 gologin();
		 return;
	 }
	 
	 count++;
	 
 	 if(count >= 2){
 		 
 		 alert("수정은 동시에 두개를 할 수 없습니다");
 		 

 		 return;
 	 }
	 myseq2 = seq;
	 myref = ref;
	 my2 = th;
	 next2 = $(my2).parent().parent().next().after();	// tr 밑에 줄..
	 mydiv2 = $(my2).parent();							// 답글
	 
	 
	next_backup2 = next2.html();	// 댓글 html 백업
	mydiv_backup2 = mydiv2.html();	// 수정,삭제 html 백업
	
	 next2.after("<tr id='_answer' class='ctr2'><td colspan='4'><textarea rows='3' cols='75' placeholder='"+wid+"에게 답글 쓰기' id='_ucomments2' name='ucomments2' style='resize: none;'></textarea><a href='#none' onclick='insert_answer(${dto.seq},myseq2,myref)'>&nbsp;등록</a></td></tr>");	
	 mydiv2.html("<a href='#none' onclick='cancel2()' >취소</a>")
	
 }
 
 function insert_answer(parent,seq,ref){
	 var text = $("#_ucomments2").val();
	 
	 if (text == "" || text == null){
		 alert("빈칸이나 공백은 안됩니다");
		 $("#_ucomments2").focus();
		 	return;
	 }
	 
	 
	 $.ajax({
		 url:'/used/insertanswer',
	 	 type:'get',
	 	 data:{
	 		 parent : parent,
	 		 seq : seq,
	 		 comments : $("#_ucomments2").val(),
	 		 userid:"${login.userid}",
	 		 ref : ref
	 	 },
	 	 success : function(data){
	 		getCommentList();
	 		count = 0;
	 	 },
	 	 error(e){
	 		 alert("실패");
	 	 }
	 })
 }
 
 function cancel(th){
	 count = 0;
	 my = th;
	 next = $(my).parent().parent().parent().next().after();	// tr 밑에 줄..
	 mydiv = $(my).parent();									// div로 묶인 수정,삭제 제거

	 next.html(next_backup);
	 mydiv.html(mydiv_backup);
 }
 
 function cancel2(){
	 count = 0;
	 
	// next2.html(next_backup2);
	$("#_answer").remove();
	 mydiv2.html(mydiv_backup2);
 }
 
 function updatecomment(parent,myseq){
	 var text = $("#_ucomments").val();
	 if (text == "" || text == null){
		 alert("빈칸이나 공백은 안됩니다");
		 $("#_ucomments").fucus();
		 return;
	 }
	 
	 
	 $.ajax({
		 url:'/used/updateComment',
	 	 type:'get',
	 	 data:{
	 		 parent : parent,
	 		 seq : myseq,
	 		 comments : $("#_ucomments").val()
	 	 },
	 	 success : function(data){
	 		getCommentList();
	 		count = 0;
	 	 },
	 	 error(e){
	 		 alert("실패");
	 	 }
	 })
 }
 
 function delete_comment(parent,seq,depth,ref){
	
	 var depth = depth;
	 var ref = ref;
	 var con_test = confirm("댓글을 삭제하시겠습니까?");	/* 문자를 보낼껀지 물어본다 */
	 
	 if(con_test == true){


	 $.ajax({
		 url:'/used/deleteComment',
		 type:'get',
		 data:{
			 parent:parent,
			 seq:seq,
			 depth:depth,
			 ref:ref
		 },
		 success:function(data){
			 getCommentList();
		 },
		 error(e){
			 alert("실패");
		 }
	 })
   }
	 
	 else if(con_test == false){
  		
	 }
 }

 

$(document).ready(function(){
    /*****************
     BUILD THE SLIDER
    *****************/
    //set width to be 'x' times the number of slides
    $('#slider-wrap ul#slider').width(sliderWidth*totalSlides);
    
    //next slide    
    $('#next').click(function(){
        slideRight();
    });
    
    //previous slide
    $('#previous').click(function(){
        slideLeft();
    });
    
    
    
    /*************************
     //*> OPTIONAL SETTINGS
    ************************/
    //automatic slider
    var autoSlider = setInterval(slideRight, 3000);
    
    //for each slide 
    $.each($('#slider-wrap ul li'), function() { 

       //create a pagination
       var li = document.createElement('li');
       $('#pagination-wrap ul').append(li);    
    });
    
    //counter
    countSlides();
    
    //pagination
    pagination();
    
    //hide/show controls/btns when hover
    //pause automatic slide when hover
    $('#slider-wrap').hover(
      function(){ $(this).addClass('active'); clearInterval(autoSlider); }, 
      function(){ $(this).removeClass('active'); autoSlider = setInterval(slideRight, 3000); }
    );
    
    

});//DOCUMENT READY
    


/***********
 SLIDE LEFT
************/
function slideLeft(){
    pos--;
    if(pos==-1){ pos = totalSlides-1; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos));    
    
    //*> optional
    countSlides();
    pagination();
}


/************
 SLIDE RIGHT
*************/
function slideRight(){
    pos++;
    if(pos==totalSlides){ pos = 0; }
    $('#slider-wrap ul#slider').css('left', -(sliderWidth*pos)); 
    
    //*> optional 
    countSlides();
    pagination();
}



    
/************************
 //*> OPTIONAL SETTINGS
************************/
function countSlides(){
    $('#counter').html(pos+1 + ' / ' + totalSlides);
}

function pagination(){
    $('#pagination-wrap ul li').removeClass('active');
    $('#pagination-wrap ul li:eq('+pos+')').addClass('active');
}
</script>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0bf45b993c5f0c0b5cb3c002d2b1ed28&libraries=services"></script>
<script>
var address = '${dto.place}';

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch(address, function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">거래장소</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
	
	
</body>
</html>