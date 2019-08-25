<%@page import="dto.CustomerDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustomerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="toFormat" uri="JSTLTagFilter" %>

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
	overflow : inherit;
	width: 80%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	/* background-color: red; */
}

ul{
   list-style:none;
   padding-left:0px;
}
.page-link{
	margin: 0;
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
	/* background-color: lightgray; */
	padding-bottom: 150px;
}
.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;
  	color: red;

}
#getcustomer{
	overflow : inherit;
	/* background-color: red; */
	padding-left: 10px;
	width: 100%;
	height: auto;
}

.tb{
    border-collapse: collapse;
}
.tb th, .tb td{
	border-bottom: 1px solid #D6B78D;
	font-size: 14px;
}
.tb td{
	padding: 10px;
}
.tb th{
	padding: 15px;
	background: #D6B78D;
	text-align: center;
	color: white;
	font-family: 'Noto Sans KR', sans-serif;
}

.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: #D6B78D;
  border-color: #D6B78D;
}

</style>
</head>



<body>

<jsp:include page="../header.jsp" flush="false"/>
 
<main>

<%-- <c:set var="listPage" value="${listPage}"></c:set> --%>
<c:set var="search" value="${search }"></c:set>
<c:set var="text" value="${text }"></c:set>

<%
//List<CustomerDto> list = (List<CustomerDto>)request.getAttribute("list");
//List<CustomerDto> listPage = (List<CustomerDto>)request.getAttribute("listPage");
//String search = (String)request.getAttribute("search");
//String text = (String)request.getAttribute("text");

//System.out.println("글의 총 갯수 : " + list.size());

//int listPageCount = 0; 	// 페이지 수
//int pageSize = 10;		// 한 페이지당 글의 갯수

//int pageClickNum = 1;	// 선택한 페이지 번호. 초기값 1

// 페이지 수 = 글의 총 갯수 / 한 페이지당 글의 갯수
//listPageCount = list.size() / pageSize;
// 나머지가 있으면 +1
//if(list.size() % pageSize > 0){
//	listPageCount++;
//}
//System.out.println("페이지 수 : " + listPageCount);
%>






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
	
	<div id="getcustomer">
	<h2 class="allfont" style="color: black;">회원관리</h2>
	
		<table class="tb">
		<col width="60"><col width="100"><col width="100"><col width="300">
		<col width="120"><col width="150"><col width="200">
		<col width="70"><col width="100"><col width="120">
		<tr>
			<th>번호</th>
			<th>ID</th>
			<th>이름</th>
			<th>주소</th>
			<th>생일</th>
			<th>phone</th>
			<th>email</th>
			<th>등급</th>
			<th>예약횟수</th>
			<th>소비금액</th>
		</tr>
		
		<c:if test="${empty listPage}">
		<tr>
			<td colspan="10">해당하는 회원이 없습니다</td>
		</tr>
		</c:if>
		
		
		
		<c:if test="${fn:length(listPage) != 0 }">
		<c:forEach begin="0" end="${fn:length(listPage)-1 }" step="1" varStatus="i">
			<tr>
				<td>
				<c:out value="${i.index+1 }"></c:out>
				</td>
				<td>
				<c:out value="${listPage[i.index].id}"></c:out>
				</td>
				<td>
				<c:out value="${listPage[i.index].name }"></c:out>
				</td>
				<td>
				<c:out value="${listPage[i.index].address }"></c:out>
				</td>
				<td>
				<c:out value="${fn:substring(listPage[i.index].birthday,0,4) }-${fn:substring(listPage[i.index].birthday,4,6) }-${fn:substring(listPage[i.index].birthday,6,8) }"></c:out>
				</td>
				<td>
				<c:out value="${fn:substring(listPage[i.index].phone,0,3) }-${fn:substring(listPage[i.index].phone,3,7) }-${fn:substring(listPage[i.index].phone,7,11) }"></c:out>
				</td>
				<td>
				<c:out value="${listPage[i.index].email }"></c:out>
				</td>
				<td>
				<c:out value="${listPage[i.index].grade }"></c:out>
				</td>
				<td>
				<c:out value="${listPage[i.index].booking_count }"></c:out>   
				</td>
				<td>
				<c:out value="${toFormat:commaFormat(listPage[i.index].total_payment) }원"></c:out>
				</td>
			</tr>
			
		</c:forEach>
			
			<tr>
			<td colspan="10">
				
				<c:if test="${paging.prev }">
				<ul class="pagination pagination-sm justify-content-center">
					<li class="page-item"><a class="page-link" href="customer_servlet?command=adminCustomer&search=${search}&text=${text}&page=${paging.startPage-1}">prev</a></li>
				</ul>
				</c:if>
			
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" step="1" varStatus="i">
				
					<c:if test="${paging.pageNum eq i.index }">
						<ul class="pagination pagination-sm justify-content-center pagination my">
							<li class="page-item active color:red"><a class="page-link">${i.index }</a></li>
						</ul>
					</c:if>
					
					<c:if test="${paging.pageNum ne i.index }">
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item"><a class="page-link" href="customer_servlet?command=adminCustomer&search=${search}&text=${text}&page=${i.index}">${i.index}</a></li>
						</ul>
					</c:if>
				
				</c:forEach>
				
				<c:if test="${paging.next }">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a class="page-link" href="customer_servlet?command=adminCustomer&search=${search}&text=${text}&page=${paging.endPage+1}">next</a></li>
					</ul>
				</c:if>
				
			</td>
			</tr>
			
			
			
		</c:if>
		
		<tr>
			<td colspan="10">
	
				<form id="frm">
					<select name="search">
						<option value="id">아이디</option>
						<option value="name">이름</option>
						<option value="grade">등급</option>
						<option value="phone">전화번호</option>
						<option value="email">이메일</option>
						<option value="address">주소</option>
					</select>
					<input type="text" name="text" id="text">
					<input type="hidden" name="command" value="adminCustomer">
					<input type="button" id="btn1" value="검색">
				</form>
			</td>
		</tr>
		
		</table>
	
	
	</div>
	
	<!-- adminMain 클래스 div 닫는 태그이다 -->
	</div>



</main>








<jsp:include page="../footer.jsp" flush="false"/>

<script type="text/javascript">
$(document).ready(function () {
	$("#btn1").click(function () {
		
		$("#frm").attr("action","customer_servlet").submit();
	});
});
</script>

</body>
</html>