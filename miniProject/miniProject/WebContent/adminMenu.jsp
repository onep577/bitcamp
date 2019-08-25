<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#adminMenu{
	overflow: inherit;
	padding-top: 60px;
	padding-left: 30px;
	width: 16%;
	height: auto;
	float: left;
	background-color: gray;
	font-family: 'Noto Sans KR', sans-serif;
}

.menu > li > a{
	list-style:none;
	color: #eee;
}  
.menu > li > a:hover{
	list-style:none;
	color: black;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<ul class="menu">
			<li><a href="/miniProject/admin_servlet?command=adminChart" class="fatag">매출통계</a></li><br>
			<li><a href="/miniProject/customer_servlet?command=adminCustomer" class="fatag">회원 관리</a></li><br>
			<li><a href="/miniProject/admin_servlet?command=roomadmin" class="fatag">객실정보 관리</a></li><br>
			<li><a href="/miniProject/booking_servlet?command=adminBooking" class="fatag">예약 관리</a></li><br>
			<li><a href="/miniProject/admin_servlet?command=qnalist&choice=&str=&pageNum=1" class="fatag">고객의소리 관리</a></li><br>
			<li><a href="/miniProject/notice_servlet?command=notice_adm" class="fatag">공지게시판 관리</a></li><br><br>
		</ul>

</body>
</html>