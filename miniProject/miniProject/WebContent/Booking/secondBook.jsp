<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.CustomerDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.BookingDto"%>
<%@page import="dto.RoomDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%!

public String toNumFormat(int num) {
	  DecimalFormat df = new DecimalFormat("#,###");
	  return df.format(num);
	 }

%>

<%

/* 로그인 */
/* Object ologin = session.getAttribute("login");
CustomerDto CDto = (CustomerDto)ologin; */


BookingDto BDto = (BookingDto)request.getAttribute("dto");
List<RoomDto> list = (List<RoomDto>)request.getAttribute("All");

//System.out.println(list.size());

int result_date = 0;
result_date = (int)request.getAttribute("result_date");
//System.out.println("secondbook resultdate" + result_date);

CustomerDto user = (CustomerDto)session.getAttribute("login");

if(user == null){
	System.out.println("CustomerDto user == null");
	response.sendRedirect("/miniProject/customer_servlet?command=loginpage");
	
}


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<style type="text/css">

main{
	width: 70%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
	min-height: 400px;
}
.tablelistdiv{
	width: 100%;
	height: auto;
	margin-top: 50px;
	margin-bottom: 70px;
	
}
.listtable{
	margin: auto;
	position: inherit;
	border-collapse: collapse;
	
    font-family: 'Noto Sans KR', sans-serif;
}

tr{
	height: 75px;
	
}
.listtable td{	
	padding: 20px;
	border-bottom: 1px solid lightgray;
	
}

.imgdiv img{
	transform-origin: 0% 0% 0;
	-webkit-transform:scale(1);
    -moz-transform:scale(1);
    -ms-transform:scale(1); 
    -o-transform:scale(1);  
    transform:scale(1);
    -webkit-transition:.3s;
    -moz-transition:.3s;
    -ms-transition:.3s;
    -o-transition:.3s;
    transition:.5s;
}
.imgdiv:hover img {
	cursor:pointer;
	transform-origin: 0% 0% 0;
    -webkit-transform:scale(3);
    -moz-transform:scale(3);
    -ms-transform:scale(3);   
    -o-transform:scale(3);
    transform:scale(3);
    position: relative;
    z-index: 4;
}


</style>

</head>

<body>

<jsp:include page="../header.jsp" flush="false"/>

<main>


<div class="tablelistdiv">

<table class="listtable">
	<col width="180px"><col width="450px"><col width="250px"><col width="105px">
	<tr style="background-color: #f1f1f1">
		<td colspan="4" style="text-align: center" align="center">
			<h4>선택한 일정 <%=BDto.getVisit_date()%> ~ <%=BDto.getLeave_date() %>  |  
			성인 <%=BDto.getAdult_number() %>, 어린이 <%=BDto.getChild_number() %></h4>
		</td>
		
	<tr>
		<td colspan="4"><h5>이미지 위에 마우스를 올리면 확대된 사진을 보실 수 있습니다.</h5></td>
	</tr>
	
	<%
	if(list == null || list.size()==0){	// 리스트가 없는경우
	%>	
		<tr>
			<td><h4>이용 가능한 객실이 없습니다.</h4></td>
		</tr>
	<%	
	}else{	// 리스트가 있는경우
				
		for(int i=0; i<list.size();i++){
			RoomDto RDto = list.get(i);
			System.out.println(RDto.toString());
			 
			if(user.getGrade().equals("일반")){
			
		%>
			<form action="/miniProject/booking_servlet" class="a<%=i%>">
				<input type="hidden" name="command" value="secondBook">
				<input type="hidden" name="id" value="<%=user.getId()%>">
				<input type="hidden" value="<%=BDto.getVisit_date() %>" name="visit_date">
				<input type="hidden" value="<%=BDto.getLeave_date() %>" name="leave_date">
				<input type="hidden" value="<%=BDto.getAdult_number() %>" name="adult_number">
				<input type="hidden" value="<%=BDto.getChild_number() %>" name="child_number">
				<input type="hidden" value="<%=RDto.getRoom_number()%>" name="room_number">
				<input type="hidden" value="<%=RDto.getPrice()%>" name="price"> 
				<input type="hidden" value="<%=result_date%>" name="result_date">
				
				<!-- ID -->
				<tr>				
					<td>
					<div class="imgdiv">
						<img src="/miniProject/image/<%=RDto.getRoom_number() %>.jpg" class="small" id="pic" width="250px" height="180px"> <br>
					</div>
					<%-- <%=RDto.getRoom_number() %>호 --%></td>
					
					<td align="left"><h3><%=RDto.getGrade() %></h3><br>
						<% if(RDto.getGrade().equals("디럭스")){%> 
							<h4 style="color: gray">전망 시티뷰 및 리버뷰 | 객실크기 40~50 ㎡</h4>
						<%} else if(RDto.getGrade().equals("프리미어")){ %>
							<h4 style="color: gray">전망 시티뷰 및 리버뷰 | 객실크기 56~65 ㎡</h4>
						<%} else if(RDto.getGrade().equals("스위트")){ %>
							<h4 style="color: gray">전망 시티뷰 및 리버뷰 | 객실크기 59~73 ㎡</h4>
						<%}%>
						
					</td>
					<td align="center"><h4>KRW</h4><h3><%=toNumFormat(RDto.getPrice())%>~</h3><br>
						<h5 style="color: gray">평균가/1박<br>(세금, 봉사료 별도)</h5>
					</td>
					
					<td><input type="submit" value="예약하기" class="btn btn-primary"></td>
				</tr>
			</form>
			
		<%
			}else{
				
				int discount = 0;
				if(user.getGrade().equals("실버")){	// 실버...
					discount = (int)Math.round(RDto.getPrice() * 0.99) ;
				}else if(user.getGrade().equals("골드")){	// 골드...
					discount = (int)Math.round(RDto.getPrice() * 0.98) ;
				}else if(user.getGrade().equals("VIP")){	// VIP...
					discount = (int)Math.round(RDto.getPrice() * 0.97) ;
				}else if(user.getGrade().equals("VVIP")){	// VVIP...
					discount = (int)Math.round(RDto.getPrice() * 0.96) ;
				}
				
				%>
				<form action="/miniProject/booking_servlet" class="a<%=i%>">
					<input type="hidden" name="command" value="secondBook">
					<input type="hidden" name="id" value="<%=user.getId()%>">
					<input type="hidden" value="<%=BDto.getVisit_date() %>" name="visit_date">
					<input type="hidden" value="<%=BDto.getLeave_date() %>" name="leave_date">
					<input type="hidden" value="<%=BDto.getAdult_number() %>" name="adult_number">
					<input type="hidden" value="<%=BDto.getChild_number() %>" name="child_number">
					<input type="hidden" value="<%=RDto.getRoom_number()%>" name="room_number">
					<input type="hidden" value="<%=discount%>" name="price">
					<input type="hidden" value="<%=result_date%>" name="result_date">
				
					
					<!-- ID -->
					<tr>				
						<td>
						<div class="imgdiv">
							<img src="/miniProject/image/<%=RDto.getRoom_number() %>.jpg" class="small" id="pic" width="250px" height="180px"> <br>
						</div>
						<%-- <%=RDto.getRoom_number() %>호 --%></td>
						
						<td align="left"><h3><%=RDto.getGrade() %></h3><br>
							<% if(RDto.getGrade().equals("디럭스")){%> 
								<h4 style="color: gray">전망 시티뷰 및 리버뷰 | 객실크기 40~50 ㎡</h4>
							<%} else if(RDto.getGrade().equals("프리미어")){ %>
								<h4 style="color: gray">전망 시티뷰 및 리버뷰 | 객실크기 56~65 ㎡</h4>
							<%} else if(RDto.getGrade().equals("스위트")){ %>
								<h4 style="color: gray">전망 시티뷰 및 리버뷰 | 객실크기 59~73 ㎡</h4>
							<%}%>
							
						</td>
						<td align="center"><h4>KRW</h4><h4><del><%=toNumFormat(RDto.getPrice()) %></del></h4>
							<h3 style="color: red;"><%=toNumFormat(discount) %></h3>
							
							<% 
							if(user.getGrade().equals("실버")){
								%>
									<h5>실버 등급이라 1% 할인 되었습니다.</h5>
								<%
							}else if(user.getGrade().equals("골드")){
								%>
									<h5>골드 등급이라 2% 할인 되었습니다.</h5>
								<%
							}else if(user.getGrade().equals("VIP")){
								%>
									<h5>VIP 등급이라 3% 할인 되었습니다.</h5>
								<%
							}else if(user.getGrade().equals("VVIP")){
								%>
									<h5>VVIP 등급이라 4% 할인 되었습니다.</h5>
								<%
							}
							%>
							
							<h5 style="color: gray">평균가/1박<br>(세금, 봉사료 별도)</h5>
						</td>
						
						<td><input type="submit" value="예약하기" class="btn btn-primary"></td>
					</tr>
				</form>
				
			<%
				
				
			}
		}
	}
	 %>
</table>

 
 </div>
 
</main>


<jsp:include page="../footer.jsp" flush="false"/>

<script type="text/javascript">

		window.history.forward();

		function noBack() {

			window.history.forward();

		}

</script>



</body>


</html>