<%@page import="dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<script type="text/javascript" src="/miniProject/js/jquery.min.js"></script>
<link rel="stylesheet" href="/miniProject/css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/js/bootstrap-select.min.js"></script>


<style type="text/css">

header{
	width: 100%;
	height: 150px;
	margin: auto;
	text-align: center;
}
#hbox1{
	width: 80%;
	height: 40%;
	float: left;
}
#hbox2{
	width: 100%;
	height: 60%;
	float: left;
}

.jbMenu {
  text-align: center;
  background-color: #f1f1f1;
  padding: 10px 0px;
  width: 100%;
  z-index: 5;
  margin-top: 30px;
  
}
.jbContent {
  height: 2000px;
}
.jbFixed {
  position: fixed;
  top: 0px;
  margin-top: 0px;
}

#box1{
	width: 50%;
	height: 100%;
	float: left;
	
}
#box2{
	width: 50%;
	height: 100%;
	float: left;
	text-align: right;
	padding-top: 30px;
}
main{
	width: 80%;
	height: 750px; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
	text-align: center;
}
footer{
	width: 100%;
	height: 420px;
	margin: auto;
	background-color: #0a1a2a;
}
#fbox1{
	width: 50%;
	height: 100%;
	float: left;
}
#fbox2{
	width: 50%;
	height: 100%;
	float: left;
	text-align: right;
	padding-right: 10%;
}
#box3{
	width: 50%;
	height: 50%;
	float: left;
	padding-top: 50px;
	padding-left: 25%;
	
}
#box4{
	width: 50%;
	height: 50%;
	float: left;
	padding-top: 50px;
	
}
#box5{
	width: 100%;
	height: 50%;
	float: left;
	padding-top: 50px;
	padding-left: 25%;
}
.allfont{
  	font-family: 'Noto Sans KR', sans-serif;
  	color: gray;
	text-decoration: none;
	margin-right: 30px;
}  

.btn-dark{
	background-color: #111111;
	color: #ffffff;
}
ul{
   list-style:none;
   padding-left:0px;
}
.fatag{
	color: #A4A4A4;
}
.fatag:HOVER {
	color: #A4A4A4;
	text-decoration: none;
}

* {
      box-sizing: border-box;
      font-family: 'NanumGothic, sans-serif';
    }
    /* placeholder color */
    input:-ms-input-placeholder {
      color: #000;
    }
    input::-webkit-input-placeholder {
      color: #000;
    }
    input::-moz-placeholder {
      color: #000;
    }
    input::-moz-placeholder {
      color: #000;
    }
   
    .ion-calendar {
      position: absolute;
      right: 20px;
      top: 14px;
    }
    /* input */
    #datepicker1 {
      border: 1px solid #c6e2f7;
      border-radius: 5px;
      width: 100%;
      height: 100%;
      font-size: 16px;
      font-family:inherit;
      text-align: center;
      cursor: pointer;
      min-height: 318px;
    }
    #datepicker2 {
      border: 1px solid #c6e2f7;
      border-radius: 5px;
      width: 100%;
      height: 100%;
      font-size: 16px;
      font-family:inherit;
      text-align: center;
      cursor: pointer;
      min-height: 318px;
    }
    #datepicker1:hover {
      background-color: #eaf7ff;
    }
    #datepicker2:hover {
      background-color: #eaf7ff;
    }
    #datepicker1:focus {
      outline: none;
    }
    #datepicker2:focus {
      outline: none;
    }
    /* calendar table */
    .ui-datepicker {
      display: none;
      background-color: #fff;
      border-radius: 7px;
 /*      margin-top: 10px;
      margin-left: 42.5px;
      margin-right: 42.5px;
      padding: 20px; */
      width: 300px;
    }
    #datepicker:focus>.ui-datepicker {
      display: block;
    }
    .ui-datepicker-prev,
    .ui-datepicker-next {
      cursor: pointer;
    }
    
    .ui-datepicker-prev{
    	float: left;
    }
    
    .ui-datepicker-next {
      float: right;
    }
    .ui-state-disabled {
      cursor: auto;
      color: hsla(0, 0%, 80%, 1);
    }
    .ui-datepicker-title {
      text-align: center;
      padding: 10px;
      font-weight: 100;
      font-family:inherit;
      font-size: 23px;
    }
    .ui-datepicker-calendar {
      width: 100%;
    }
    /* day of week cell */
    .ui-datepicker-calendar>thead>tr>th {
      padding: 5px;
      font-size: 22px;
      font-family:inherit;
      font-weight: 400;
    }
    /* day cell */
    .ui-datepicker-calendar>tbody>tr>td {
      border-radius: 100%;
      width: 28px;
      height: 28x;
      cursor: pointer;
      padding: 3px;
      font-weight: 70;
      font-family:inherit;
      text-align: center;
    }
    .ui-datepicker-calendar>tbody>tr>td:hover {
      background-color: #c6e2f7;
    }
    .ui-datepicker-calendar>tbody>tr>td>a {
      color: #000;
      font-size: 22px;
      font-weight: 400;
      text-decoration: none;
    }
    /* past days */
    .ui-datepicker-calendar>tbody>tr>.ui-state-disabled:hover {
      cursor: auto;
      background-color: #fff;
    }
    /* media */
    @media(max-width: 445px) {
      .wrapper {
        width: calc(100vw - 20px);
      }
      .ui-datepicker {
        margin-right: 0;
        margin-left: 0;
        padding: 10px;
        width: calc(100vw - 20px);
        margin: 10px auto;
      }
      .ui-datepicker-calendar>tbody>tr>td {
        width: 43px;
        height: 43px;
      }
    }


.divparent{
	width: 100%;
	height: 700px;
	position: inherit;

}
.bd{	/*	datepicker를 사용한 테이블을 감싸는 다이브 입니다.	*/
	width: 790px;
	height: 450px;
	margin-right:0px;
	text-align: center;
	padding-bottom: 30px;
	padding-left: 30px;
	padding-right: 30px;
	position: inherit;
	float: left;
	
}
.checkdiv{	/*	체크인 체크아웃 일정, 인원, 객실보러가기 버튼을 구성하는 다이브 */
	width: 350px;
	height: 450px;
	padding-top: 200px;
	padding-bottom: 30px;
	padding-left: 30px;
	padding-right: 30px;
	float: left;
	
}

#daytitle{	/*	일정체크&인원체크 다이브 입니다.	*/
	padding: auto;
	margin: auto;
	width:550px;
	height:auto;
	background-color: #fafafa;
}

#btn{
	background-color: #111111;
	color: #ffffff;
}
#btn:hover{
   background-color: #2A7BD6;
   color: #ffffff;
}

</style>

</head>

<body>
<%

CustomerDto user = (CustomerDto)session.getAttribute("login");
request.setAttribute("_user", user); 

if(user == null){
	System.out.println("CustomerDto user == null");
	response.sendRedirect("/miniProject/customer_servlet?command=loginpage");
}

String BookingRoom = (String)request.getAttribute("BookingRoom");

if(BookingRoom != null){
	%>
	<script type="text/javascript">
		alert("이미 예약된방 입니다.");
	</script>
	<%
}

%>

<header>

	<div id="hbox1">
		<div id="box1" align="center">
			<a href="/miniProject/customer_servlet?command=mainpage"><img src="/miniProject/image/logo.png"></a>
		</div>
		
		<div id="box2" align="center">
	 		<c:if test="${empty _user}">	 	
	 		<!-- /miniProject/customer_servlet?command=logout	 -->	
			 		<a href="/miniProject/customer_servlet?command=account" style="color: #BDBDBD" class="allfont" >회원가입</a>
					<a href="/miniProject/customer_servlet?command=loginpage" style="color: #BDBDBD" class="allfont">로그인</a>
			</c:if>
			
			<c:if test="${not empty _user}">
				<c:if test="${_user.auth != 3}">
				<a href="/miniProject/admin_servlet?command=adminChart" style="color: #BDBDBD" class="allfont">관리자페이지</a>
				</c:if>
		 		<a href="/miniProject/customer_servlet?command=logout" style="color: #BDBDBD" class="allfont">로그아웃</a>
				<a href="/miniProject/customer_servlet?command=mypage" style="color: #BDBDBD" class="allfont">마이페이지</a>
				<a href="/miniProject/booking_servlet?command=bookingcheck" style="color: #BDBDBD" class="allfont">예약조회</a>
			</c:if>
		</div>
		
	</div>
	<div id="hbox2">
		
	    <div class="jbMenu">
	    	<a class="allfont" href="/miniProject/customer_servlet?command=mainpage">홈</a>
	        <a class="allfont" href="/miniProject/notice_servlet?command=notice">공지사항</a>
	        <a class="allfont" href="/miniProject/customer_servlet?command=hotel_intro">시그니엘 소개</a>
	        <a class="allfont" href="/miniProject/customer_servlet?command=room_intro">객실 소개</a>
	        <a class="allfont" href="/miniProject/customer_servlet?command=travel_intro">관광지 소개</a>
	        <button id="btn" class="btn btn-dark">예약하기</button>
	    </div>
	    
	</div>
	
</header>





<main>

<div class="divparent">


	<form action="/miniProject/booking_servlet">
	<input type="hidden" name="command" value="firstBook">
	<input type="hidden" id="visit_date" name="visit_date">
	<input type="hidden" id="leaver_date" name="leaver_date">
	<input type="hidden" id="resultid" name="result_date">
	
	<br><br><br>
	<div id="daytitle">
		<br>
		<h2>일정체크&인원체크</h2>
		<br>
	</div>
	<div class="bd">
		<table class="bt">
			<tr height="120px;">
				
			</tr>
			<tr>
				<td><span style="font-size: 23px; font-weight: bold;">체크인</span></td>
				<td><span style="font-size: 23px; font-weight: bold;">체크아웃</span></td>
			</tr>
			<tr height="350px">
				<td>
					<div style="margin-left: 40px; margin-right: 20px;">
						<div id="datepicker1"></div>
					</div>
				</td>
				<td>
					<div style="margin-left: 20px; margin-right: 40px;">
						<div id="datepicker2"></div>
					</div>
				</td>
			</tr>			
		</table>
	</div>
		<div class="checkdiv">
			<table class="dt">
				<col><col>
				<tr>
					<td align="left">&ensp;&ensp;&ensp;&ensp;체크인</td>
					<td align="center">체크아웃</td>
				</tr>
				<tr height="50px;">
					<td align="center"><h4 id="checkin" style="display: none;"></h4></td>
					<td align="center"><h4 id="checkout" style="display: none;"></h4></td>
				</tr>
				<tr height="40px;">
					<td>객실인원</td>
					<td>
						<select name="adult_number" id="adult_number">
							<option value="1">성인1</option>
							<option value="2">성인2</option>
						</select>
						<select name="child_number" id="child_number">
							<option value="0">어린이0</option>
							<option value="1">어린이1</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2">								 <!-- 부트스트랩 버튼 -->
						<button type="submit" disabled="disabled" class="btn btn-secondary" style="width: 250px; height: 80px;">객실&요금 확인</button>
					</td>
				</tr>
			</table>
		</div>
</div>
		
	
	
	</form>
	

	



</main>



<footer>
	<div id="fbox1">
		<div id="box3">
			<h4 class="allfont" style="color: #ffffff;">소개</h4><br>
				<ul class="allfont">
					<li><a href="/miniProject/customer_servlet?command=hotel_intro" class="fatag">호텔 소개</a></li><br>
					<li><a href="/miniProject/customer_servlet?command=room_intro" class="fatag">객실 소개</a></li><br>
					<li><a href="/miniProject/customer_servlet?command=travel_intro" class="fatag">관광지 소개</a></li>
				</ul>
		</div>
		<div id="box4">
			<h4 class="allfont" style="color: #ffffff">게시판</h4><br>
				<ul class="allfont">
					<li><a href="/miniProject/notice_servlet?command=notice" class="fatag">공지사항</a></li><br>
					<li><a href="/miniProject/personqna_servlet?command=qnapage" class="fatag">고객의 소리</a></li>
				</ul>
		</div>
		<div id="box5">
			<p class="allfont">(주)호텔롯데<br>
						서울특별시 송파구 올림픽로 300<br>
						롯데월드타워 76-101층</p>
						
			<p class="allfont">Copyright ©2019 All rights reserved | This template is made by 3조</p>
		</div>
	</div>
	
	<div id="fbox2">
		<img alt="" src="/miniProject/image/botLogo.jpg">
	</div>
</footer>


<script type="text/javascript">



$(function () {
	
	$("#adultcount").text($("#adult_number").val());
	$("#childcount").text($("#child_number").val());
	

	$( document ).ready( function() {
	    var jbOffset = $( '.jbMenu' ).offset();
	    $( window ).scroll( function() {
	      if ( $( document ).scrollTop() > jbOffset.top ) {
	        $( '.jbMenu' ).addClass( 'jbFixed' );
	      }
	      else {
	        $( '.jbMenu' ).removeClass( 'jbFixed' );
	      }
	    });
	  } );
	  
	$("#btn").click(function() {
		location.href = "/miniProject/booking_servlet?command=first";
	});
	
});

$(function () {
	  var day1, day2, day3;
	 
  $.datepicker.setDefaults({
    closeText: "닫기",
    prevText: "이전달",
    nextText: "다음달",
    currentText: "오늘",
    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월",
      "7월", "8월", "9월", "10월", "11월", "12월"
    ],
    monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월",
      "7월", "8월", "9월", "10월", "11월", "12월"
    ],
    dayNames: ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"],
    dayNamesShort: ["일", "월", "화", "수", "목", "금", "토"],
    dayNamesMin: ["일", "월", "화", "수", "목", "금", "토"],
    weekHeader: "주",
    dateFormat: "yy-mm-dd",
    firstDay: 0,
    isRTL: false,
    showMonthAfterYear: true,
    yearSuffix: "년"
  })
  $("#datepicker1").datepicker({
     minDate: 1, 
     maxDate : 90,
    /* to use in wix */

    onSelect: function (selected, event) {
      console.log(selected);
      /* 
       * wix-send-messages from html component
       * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
       */
      window.parent.postMessage(selected, "*");
      day1 = $("#datepicker1").datepicker({
			dateFormat: "yy/mm/dd"
		}).val();
		$("#day1").text(day1);
		$("#visit_date").val(day1);
		$("#checkintitle").show();
		$("#checkin").show();
		$("#checkin").html(day1 + "&ensp;&ensp; ~");
		
    }
  })
  
  $("#datepicker2").datepicker({
     minDate: 2,
     maxDate : 90,
    /* to use in wix */
    onSelect: function (selected, event) {
      console.log(selected);
      
      /* 
       * wix-send-messages from html component
       * https://support.wix.com/en/article/working-with-the-html-component-in-wix-code
       */
      window.parent.postMessage(selected, "*");
      day2 = $("#datepicker2").datepicker({
			dateFormat: "yy/mm/dd"
		}).val();
		$("#day2").text(day2);
		$("#leaver_date").val(day2);
		$("#checkouttitle").show();
		$("#checkout").show()
		$("#checkout").text(day2);
		day3= day2 > day1;
		
		
		
		
		if(!day3){
			alert("퇴실일을 확인해주세요");
			$("button").attr("disabled", "disabled")
		
		
		}else{
		
			var sNowDay = day1;
			var sNextDay = day2;
			var today = sNowDay.split("-");
			var todayobj = new Date(today[0], Number(today[1])-1, today[2]);

			var NextDay = sNextDay.split("-");
			var Nextobj = new Date(NextDay[0], Number(NextDay[1])-1, NextDay[2]);

			var resultday = ((Nextobj.getTime() - todayobj.getTime())/1000/60/60/24);	
			
			//alert(resultday);
			
			$("#resultid").val(resultday);
			
			$("button").removeAttr("disabled");
		}	
    }
  })

	})

	


</script>

<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->
</body>
</html>