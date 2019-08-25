<%@page import="java.util.Calendar"%>
<%@page import="dto.AdminTodayBookingDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
String date = (String)request.getAttribute("date");

String year = date.substring(0, 4);
String month = date.substring(4, 6);
String day = date.substring(6, 8);

if(month.substring(0, 1).equals("0") ){
	month = month.substring(1);
}
if(day.substring(0, 1).equals("0") ){
	day = day.substring(1);
}
System.out.println("adminbooking.jsp : year : " + year + ", month : " + month + ", day : " + day);

Calendar cal = Calendar.getInstance();
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>
<!-- 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script type="text/javascript" src="../js/jquery.min.js"></script> 
<link rel="stylesheet" href="../css/bootstrap.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
 -->
<style type="text/css">
main{
	overflow: inherit;
	width: 83%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
}
ul{
   list-style:none;
   padding-left:0px;
}
.menu > li{
	list-style:none;
	color: #eee;
}
.menu > li > a{

	color: #eee;
}  
.menu > li > a:hover{
	list-style:none;
	color: black;
}
#adminMenu{
	overflow: inherit;
	padding-top: 60px;
	padding-left: 30px;
	width: 16%;
	height: auto;
	float: left;
	background-color: gray;
}
#adminMain{
	overflow: inherit;
	width: 84%;
	height: auto;
	float: left;
	text-align: center;
	padding-left: 10px;
	/* background-color: lightgray; */
	padding-bottom: 150px;
}
.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;
  	color: red;

}
#getcustomer{
	overflow: inherit;
	background-color: red;
	width: 65%;
	height: auto;
}
.cus{
	/* background-color: orange; */
}

.tableWrapper{
	/* background-color: red; */
}
.tablechild1{
	/* background-color: orange; */
	margin-right: 10px;
	float: left;
}
.tablechild2{
	/* background-color: blue; */
	margin-right: 10px;
	float: left;
}
.tablechild3{
	/* background-color: blue; */
	margin-right: 10px;
	float: left;
}

.tbEnter, .tbLeave{
	font-family: 'Noto Sans KR', sans-serif;"
}
.tbEnter th, .tbLeave th{
	background: #D6B78D;
	text-align: center;
	color: white;
	padding: 5px;
}
.tbEnter td, .tbLeave td{
	padding: 5px;
}
.tbEnter th, .tbEnter td, .tbLeave th, .tbLeave td{
	font-size: 13px;
	border-bottom: 1px solid #D6B78D;
}
</style>
</head>



<body>

<jsp:include page="../header.jsp" flush="false"/>
 
<main>

<div>
	<div id="adminMenu">
	<!-- 
		<ul class="menu">
			<li><a href="/miniProject/admin_servlet?command=adminChart" class="fatag">메인으로</a></li><br>
			<li><a href="/miniProject/customer_servlet?command=adminCustomer" class="fatag">회원 관리</a></li><br>
			<li><a href="/miniProject/admin_servlet?command=roomadmin" class="fatag">객실정보 관리</a><br>
				<ul class="menu"><br>
					<li><a href="/miniProject/admin_servlet?command=" class="fatag">&nbsp;&nbsp;&nbsp;객실정보 등록</a></li><br>
					<li><a href="/miniProject/admin_servlet?command=" class="fatag">&nbsp;&nbsp;&nbsp;객실정보 수정</a></li><br>
					<li><a href="/miniProject/admin_servlet?command=" class="fatag">&nbsp;&nbsp;&nbsp;객실정보 삭제</a></li><br>
				</ul>
			</li>
			<li><a href="/miniProject/booking_servlet?command=adminBooking" class="fatag">예약 관리</a></li><br>
			<li><a href="/miniProject/admin_servlet?command=qnalist&choice=&str=&pageNum=1" class="fatag">고객의소리 관리</a></li><br>
		</ul>
 -->
 	<jsp:include page="../adminMenu.jsp" flush="false"/>
	</div>
	
	<div id="adminMain">
	
	<h2>예약관리</h2>
	<h1><%=year %>년 <%=month %>월 <%=day %>일 &nbsp;검색 결과</h1>
	
	<form id="frm">
	<input type="hidden" name="command" value="adminBooking">
	<select name="year" id="year">
	<%
	for(int i = 2018; i < 2026; i++){
	%>
		<option <%=year.equals(""+i)?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
	<%
	}
	%>
	</select>년&nbsp;
	
	
	<select name="month" id="month">
	<%
	for(int i = 1; i <= 12; i++){
	%>
		<option <%=month.equals(i+"")?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
	<%
	}
	%>
	</select>월&nbsp;
	<b id="monthValue"></b>
	

	<select name="day" id="day">
	<%
		for(int i = 1; i <= cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
			// 1 ~ 마지막날
			%>
			<option <%=day.equals(i+"")?"selected='selected'":"" %>
				value="<%=i %>"><%=i %></option>
				
			<%
		}
	%>		
	</select>일&nbsp;&nbsp;

	
	<input type="hidden" name="command" value="adminCustomer">
	<input type="button" id="btn1" value="검색">&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" id="btn2" value="당일로 검색">
	</form>
	<br><br><br><br>
	
	
	
	
	
	<div class="tableWrapper">
	<div class="tablechild1">
	
		<table class="tbEnter">
			<tr>
				<th colspan="6" style="font-size: 20px">입실</th>
			</tr>
			<tr>
				<th>방 번호</th>
				<th>고객 이름</th>
				<th>고객 아이디</th>
				<th>고객 등급</th>
				<th>어른 인원수</th>
				<th>어린이 인원수</th>
			</tr>
			
			<%			
			List<AdminTodayBookingDto> visitlist = (List<AdminTodayBookingDto>)request.getAttribute("visitlist");
			
			if (visitlist == null || visitlist.size() == 0){
			%>
			<td colspan="6">입실할 고객이 없습니다</td>
			<%
			}
			
			if (visitlist != null && visitlist.size() != 0){
				System.out.println("jsp 페이지의 조건문 통과 ");
			
				for(int i=0; i<visitlist.size(); i++){
					boolean b = true;
				%>
					<tr>
					<th class="cus"><%=visitlist.get(i).getRoom_number() %></th>
					
					<td class="cus"><%=visitlist.get(i).getName() %></td>
					<td class="cus"><%=visitlist.get(i).getId() %></td>
					<td class="cus"><%=visitlist.get(i).getGrade() %></td>
					<td class="cus"><%=visitlist.get(i).getAdult_number() %></td>
					<td class="cus"><%=visitlist.get(i).getChild_number() %></td>
					
				</tr>
				<%} 
			}
			%>
		</table>
	
	</div>
		<div class="tablechild2">
	
		<table class="tbEnter">
			<tr>
				<th colspan="6" style="font-size: 20px">예약중</th>
			</tr>
			<tr>
				<th>방 번호</th>
				<th>고객 이름</th>
				<th>고객 아이디</th>
				<th>고객 등급</th>
				<th>어른 인원수</th>
				<th>어린이 인원수</th>
			</tr>
			
			<%			
			List<AdminTodayBookingDto> bookinglist = (List<AdminTodayBookingDto>)request.getAttribute("bookinglist");
			
			if (bookinglist == null || bookinglist.size() == 0){
			%>
			<td colspan="6">예약된 고객이 없습니다</td>
			<%
			}
			
			if (bookinglist != null && bookinglist.size() != 0){
				System.out.println("jsp 페이지의 조건문 통과 ");
			
				for(int i=0; i<bookinglist.size(); i++){
					boolean b = true;
				%>
					<tr>
					<th class="cus"><%=bookinglist.get(i).getRoom_number() %></th>
					
					<td class="cus"><%=bookinglist.get(i).getName() %></td>
					<td class="cus"><%=bookinglist.get(i).getId() %></td>
					<td class="cus"><%=bookinglist.get(i).getGrade() %></td>
					<td class="cus"><%=bookinglist.get(i).getAdult_number() %></td>
					<td class="cus"><%=bookinglist.get(i).getChild_number() %></td>
					
				</tr>
				<%} 
			}
			%>
		</table>
	
	</div>
	<div class="tablechild3">
		<table class="tbLeave">
			<tr>
				<th colspan="6" style="font-size: 20px">퇴실</th>
			</tr>
			<tr>
				<th>방 번호</th>
				<th>고객 이름</th>
				<th>고객 아이디</th>
				<th>고객 등급</th>
				<th>어른 인원수</th>
				<th>어린이 인원수</th>
			</tr>
			
			
			<%			
			List<AdminTodayBookingDto> leavelist = (List<AdminTodayBookingDto>)request.getAttribute("leavelist");
			
			if (leavelist == null || leavelist.size() == 0){
			%>
			<td colspan="6">퇴실할 고객이 없습니다</td>
			<%
			}
			
			if (leavelist != null && leavelist.size() != 0){
				System.out.println("jsp 페이지의 조건문 통과 ");
			
				for(int i=0; i<leavelist.size(); i++){
					boolean b = true;
				%>
					<tr>
					<th class="cus"><%=leavelist.get(i).getRoom_number() %></th>
					
					<td class="cus"><%=leavelist.get(i).getName() %></td>
					<td class="cus"><%=leavelist.get(i).getId() %></td>
					<td class="cus"><%=leavelist.get(i).getGrade() %></td>
					<td class="cus"><%=leavelist.get(i).getAdult_number() %></td>
					<td class="cus"><%=leavelist.get(i).getChild_number() %></td>
					
				</tr>
				<%} 
			}
			%>
		</table>
	</div>
	
	
	
	
	
	<!-- 두개의 테이블의 감싸는 .tableWrapper div 태그를 닫는다 -->
	</div>
		
	
	
	
	
	<!-- adminMain 끝나는 태그 -->
	</div>


</div>

</main>








<jsp:include page="../footer.jsp" flush="false"/>

<script type="text/javascript">
$(document).ready(function () {
	
	// month의 값이 달라졌을 때 해달 월에 맞는 마지막날을 구한다
	$("select[name='month']").change(function (){
		var month = $("select[name='month']").val();

		// 년도와 달을 통해서 마지막 날짜를 구한다
		var lastDate = (new Date("2019", month, 0)).getDate();
		
		var str="";
		for(i = 1; i <= lastDate; i++){
			str += "<option value='" + i + "'>" + i + "</option>";
		}
		$("select[name='day']").html( str );
	});


	// 검색한 후 해당 달을 자동 감지해서 마지막날을 구한다
	var month = $("select[name='month']").val();

	// 년도와 달을 통해서 마지막 날짜를 구한다
	var lastDate = (new Date("2019", month, 0)).getDate();
	
	var day = <%=day%>
	//alert(day);
	
	var str="";
	for(i = 1; i <= lastDate; i++){
		
		if(i == day){
			str += "<option selected value='" + i + "'>" + i + "</option>";
		}else{
			str += "<option value='" + i + "'>" + i + "</option>";
		}
		
	}
	$("select[name='day']").html( str );

});



$(document).ready(function () {
	$("#btn1").click(function () {		
		
		var year = $("#year").val();
		var month = $("#month").val();
		var day = $("#day").val();
		
		if( month.length < 2 ){
			month = "0"+$("#month").val();
		}
		if($("#day").val().length < 2){
			day = "0"+$("#day").val();
		}
		//alert(year + ", " + month + ", " + day);

		location.href="/miniProject/booking_servlet?command=adminBooking&year="+year+"&month="+month+"&day="+day;
		
	});
	$("#btn2").click(function () {
		location.href="booking_servlet?command=adminBooking";
	});
});
</script>

</body>
</html>