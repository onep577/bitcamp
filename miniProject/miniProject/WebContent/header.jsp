<%@page import="dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/miniProject/js/jquery.min.js"></script>
 
<link rel="stylesheet" href="/miniProject/css/bootstrap.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript" src="/miniProject/js/jquery.cookie.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />

<!-- JQuery 밑에다 하자
일별 통계 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

<!-- 연령별 통계에 추가로 필요하다 -->
<script src="https://code.highcharts.com/modules/series-label.js"></script>

<!-- 정렬테이블 쓰기위한 스크립트 -->
<link rel="stylesheet" href="/miniProject/css/style.css" type="text/css" media="print, projection, screen">
<script type="text/javascript" src="/miniProject/js/jquery.tablesorter.js"></script>
<script type="text/javascript" src="/miniProject/js/jquery.tablesorter.min.js"></script>

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
.allfont{
  	font-family: 'Noto Sans KR', sans-serif;
  	color: gray;
}

body {
  margin: 0px;
  padding: 0px;
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
a{
	text-decoration: none;
	margin-right: 30px;
}
a:hover{
	text-decoration: none;
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

%>

<header>

	<div id="hbox1">
		<div id="box1">
			<a href="/miniProject/customer_servlet?command=mainpage"><img src="/miniProject/image/logo.png"></a>
		</div>
		
		<div id="box2">
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
	        <!-- <button id="chatBtn" class="btn btn-dark">채팅상담</button> -->
	    </div>
	    
	</div>
	
</header>





<script type="text/javascript">

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
$("#chatBtn").click(function () {
	<c:if test="${empty _user}">
		alert("로그인 후 이용이 가능합니다.");
		location.href = "/miniProject/customer_servlet?command=loginpage";
	</c:if>
	<c:if test="${not empty _user}">
		window.open("chat_main.jsp?id=<%=user.getId() %>", "chatWindow",
					"width=500, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=no,toolbars=no, menubar=no" );    
	</c:if>
}); 
</script>

<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->
</body>
</html>