<%@page import="elTag.JSTLTagFilter"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.BookingCheckDto"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ taglib prefix="toFormat" uri="JSTLTagFilter" %>

<%
List<BookingCheckDto> list = (List<BookingCheckDto>)request.getAttribute("list");

Calendar cal = Calendar.getInstance();
int year = cal.get(Calendar.YEAR);
String month = ""+(cal.get(Calendar.MONTH)+1);
if(month.length() < 2){
	month = "0"+month;
}
String day = ""+(cal.get(Calendar.DATE));
if(day.length() < 2){
	day = "0"+day;
}

String date = ""+year+month+day;

System.out.println("사용자 예약조회 date : " + date);
request.setAttribute("date", date);
%>

<c:set var="list" value="${list }"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<style type="text/css">
main{
	overflow: inherit;
	width: 70%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	min-height: 400px;
	/* background-color: blue; */
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
.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;
  	color: red;
}
.nameBox{
	width: 100%;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 35px;
	padding-top: 20px;
	padding-bottom: 20px;
	background-color: #fafafa;
}
.checkBox{
	overflow: inherit;
	height: auto;
	width: 100%;
	margin-bottom: 150px;
	margin-top: 50px;
	margin-left: auto;
	margin-right: auto;
	/* background-color: red; */
}

.tb{
	width: 100%;
    border-collapse: collapse;
}
.tb th, .tb td{
	border-bottom: 1px solid #D6B78D;
	text-align: center;
}
.tb th{
	font-size: 15px;
	padding: 20px;
	background: #D6B78D;
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
}
.tb td{
	padding: 10px;
	font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>



<body>

<jsp:include page="../header.jsp" flush="false"/>
 
<main>


<div class="nameBox" align="center">
<b><c:out value="${_user.name }"></c:out>님의 예약 현황</b>
</div>



<div class="checkBox" align="center">
<table class="tb">

<tr>
	<th>번호</th><th>예약 날짜</th><th>입실 날짜</th><th>퇴실 날짜</th><th>총 금액</th><th>어른 인원수</th><th>어린이 인원수</th><th>취소여부</th>
</tr>

<c:if test="${empty list }">
<tr>
	<td colspan="9">예약이 없습니다</td>
</tr>
</c:if>


<c:if test="${not empty list }">
<c:forEach begin="0" end="${fn:length(list)-1 }" step="1" varStatus="i">
<tr>
	<td><c:out value="${i.index+1 }"></c:out></td>
	<td>${fn:substring(list[i.index].wdate,0,4) }-${fn:substring(list[i.index].wdate,4,6) }-${fn:substring(list[i.index].wdate,6,8) }</td>
	<td>${fn:substring(list[i.index].visit_date,0,4) }-${fn:substring(list[i.index].visit_date,4,6) }-${fn:substring(list[i.index].visit_date,6,8) }</td>
	<td>${fn:substring(list[i.index].leave_date,0,4) }-${fn:substring(list[i.index].leave_date,4,6) }-${fn:substring(list[i.index].leave_date,6,8) }</td>
	
	<td><c:out value="${toFormat:commaFormat(list[i.index].total_price) }"></c:out>원</td>
	
	<td><c:out value="${list[i.index].adult_number}"/>명</td>
	<td><c:out value="${list[i.index].child_number}"/>명</td>
	
	<c:if test="${list[i.index].visit_date eq date }">
	<td style="color: red">취소불가</td>
	</c:if>
	<c:if test="${list[i.index].visit_date ne date }">
	<td><input type="button" class="cancel" value="취소" onclick="func(${i.index})">
	<input type="hidden" class="abc${i.index }" value="${list[i.index].total_price }">
	<input type="hidden" class="seq${i.index }" value="${list[i.index].seq }">
	</td>
	</c:if>
	
</tr>
</c:forEach>
</c:if>

</table>
</div>


</main>

<script type="text/javascript">
function func(i){
	//alert("취소");
	var total_price = $(".abc"+i).val();
	//alert( total_price );
	
	var seqNum = $(".seq"+i).val();
	//alert( seqNum );
	
	var confirmCheck = confirm("예약을 취소하시겠습니까?");
	
	if( confirmCheck == true ){
		location.href="booking_servlet?command=delete&seq="+seqNum+"&total_price="+total_price;
	}
}

</script>




<jsp:include page="../footer.jsp" flush="false"/>

</body>
</html>