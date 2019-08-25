<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.BookingDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

	<%!

	  public String toNumFormat(int num) {
	  DecimalFormat df = new DecimalFormat("#,###");
	  return df.format(num);
	 }

%>
  
  
    <%
    System.out.println("서드 북 시작");
    BookingDto dto = (BookingDto)request.getAttribute("dto");
    
    /* 로그인 */
/*     Object ologin = session.getAttribute("login");
    CustomerDto CDto = (CustomerDto)ologin; */
    
	/* 여기서 update 실행..혹은 secondBook에서 실행 */
    %>
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<style type="text/css">


main{
	overflow: inherit;
	width: 80%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
}

.enddiv{	/* 메인의 크기에 맞춰서 버튼을 제외한 글들을 포함하는 다이브 입니다. */
	width: 100%;
	height: auto;
}

.infodiv {
	background: #e3e3e3;
	margin-top: 50px;
	width: 90%;
	height: auto;
   	border-radius: 10px;
   	
}
tr {
	height: 40px;
}
.endbtn {	/* 홈, 마이페이지 가는 버튼의 다이브 입니다. */
	margin-top: 50px; 
}

/* 
.enddiv2{
	width: 100%;
	height: auto;
	margin-top: 150px;
	margin-bottom: 15px;
	text-align: center;	
}

.endbtn{
	text-align: center;
	width: 100%;
	height: auto;
	
}
table{
	border: 1px solid;
	border-collapse: collapse;
	position: inherit;
	margin: auto;
} */
</style>

</head>

<body>

<jsp:include page="../header.jsp" flush="false"/>

<main>


<div class="enddiv" align="center">
	<h1 style="margin-top: 50px;"><strong>예약이 정상적으로 처리되었습니다.</strong></h1>
	<h4 style="font-family: sans-serif; color: gray;"><%=dto.getId()%>님, 항상 저희 호텔을 이용해 주셔서 감사합니다.</h4>
	
	<div class="infodiv">
	
		<h1 style="padding-top: 50px; margin: 0;">예약정보</h1>
		<hr width="90%" style="border-top: 1px solid #777">
		
		<table style="font-size: 20px">
			<col width="200px"><col width="330px">
			<tr>
				<th>예약 객실</th>
	<%
		if(Integer.parseInt(dto.getRoom_number()) > 100 && Integer.parseInt(dto.getRoom_number()) < 200){
			%>
				<td>디럭스룸</td>
			<%
		}else if(Integer.parseInt(dto.getRoom_number()) > 200 & Integer.parseInt(dto.getRoom_number()) < 400 ){
			%>
				<td>프리미어룸</td>
			<%
		}else{
			%>
				<td>스위트룸</td>
			<%
		}
	%>
					
			</tr>
			<tr>
				<th>예약 인원</th>
				<td>어른&nbsp;&nbsp; <%=dto.getAdult_number() %>명 / 아이&nbsp;&nbsp;<%=dto.getChild_number() %>명</td>		
			</tr>
			<tr>
				<th>숙박 기간</th>
				<td><%=dto.getVisit_date() %>~<%=dto.getLeave_date() %></td>		
			</tr>
		</table>
		<hr width="90%" style="border-top: 1px solid #777">
		<h3 style="padding: 50px; margin: 0; " align="right">총 결제금액 &nbsp;&nbsp;&nbsp; <strong><%=toNumFormat(dto.getTotal_price())%></strong> 원 </h3>
		
	</div>
	
	
	<div class="infodiv" align="left">
		<h3 style="padding: 30px; padding-bottom: 0;margin: 0;">취소규정사항</h3>
			<br>
			<p style="padding: 30px; margin: 0;">
				상기 홈페이지 요금은 정상가에서 할인된 금액으로 중복 할인은 불가능합니다.<br>
				예약 취소 및 변경은 체크인 하루 전 18:00(한국시간)까지 가능합니다.<br>
				예약하신 일자에 체크인 되지 않거나 또는 위의 지정 시간 이후에 예약을 취소했을 경우에는
				예약 사항에 대해 노-쇼 (No Show) 처리 되며,<br>
				이에 따른 위약금으로 예약 첫날에 해당하는 1박 객실요금이 청구되오니 유의하시기 바랍니다.
			</p>
	</div>
		
</div>
	
	
<div class="endbtn" align="center">
	<button id="btnhome" class="btn btn-dark navbar-btn">홈으로</button>
	<button id="btnmypage" class="btn btn-dark navbar-btn">마이페이지</button>		
</div>	



</main>

<jsp:include page="../footer.jsp" flush="false"/>

<script type="text/javascript">

$(function () {
	$("#btnhome").click(function() {
		location.href="customer_servlet?command=mainpage";
	});
	$("#btnmypage").click(function() {
		location.href="customer_servlet?command=mypage";
	});
})

</script>

</body>
</html>