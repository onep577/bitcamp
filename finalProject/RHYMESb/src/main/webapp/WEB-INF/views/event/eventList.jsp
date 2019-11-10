<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EventList</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/event/eventlist.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin/member/paging.css">
</head>
<body>


<div align="center">
	<table class="list_table">
	
	<c:if test="${empty eventlist }">
		<tr align="center">
			<td colspan="2">리스트가 없습니다</td>
		</tr>
	</c:if>
	<c:forEach var="event" items="${eventlist }" varStatus="vs">
	<tr>
		<td colspan="2">
			<c:if test="${event.seq == 90 }">
				<img alt="x" src="/upload/event/${event.photo_banner }" onclick="location.href='/event/eventdetail/sms';" class="bannerimg">
			</c:if>
			<c:if test="${event.seq != 90 }">
				<img alt="x" src="/upload/event/${event.photo_banner }" onclick="godetail(${event.seq});" class="bannerimg">
			</c:if>	
		</td>
	</tr>
	<tr>
		<td><span id="etitle">[${event.title }]</span></td>
		<td align="right">${event.sdate }~ ${event.edate }<br><br></td>
	</tr>
	</c:forEach>
	
	
	</table>
	<!-- 페이징 -->
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/event/paging.jsp" flush="false">
			<jsp:param name="pageNumber" value="${pageNumber }" />
			<jsp:param name="totalRecordCount" value="${totalRecordCount }" />
			<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }" />
			<jsp:param name="recordCountPerPage" value="${recordCountPerPage }" />
		</jsp:include>
	</div>
	<!-- 페이징끝 -->
	<form id="_frm" method="get">
	<input type="hidden" name="code" value="${code }">
	<input type="hidden" name="pageNumber" id="_pageNumber" value="0">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage"
			value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	</form>
	
</div>

</body>


<script type="text/javascript">
$(".bannerimg").mouseover(function(){
	$(this).css("cursor", "pointer");
});

function godetail(seq){
 	location.href="eventdetail?seq="+seq;
}


</script>

<!-- 페이징 -->
<script type="text/javascript">
	function goPage(pageNumber) {

		$("#_pageNumber").val(pageNumber); // 들어오는 값을 가져옴 
		$("#_frm").attr("action", "eventmain").submit(); //

	}

</script>

</html>