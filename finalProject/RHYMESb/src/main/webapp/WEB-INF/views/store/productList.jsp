<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>     

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>

<meta charset="UTF-8">
<!-- security ajax -->
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<% String ctx = request.getContextPath(); %>

<meta name="description" content="">
<meta 
http-equiv="X-UA-Compatible" content="IE=edge">

<link rel="stylesheet" href="/css/store/productList.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/store/productlist.js"></script>

</head>
<body>


<%-- c1 : ${c1_name }<br>
c2 : ${c2_name }<br>
c3 : ${c3_name }<br>
key : ${key}<br>
keyword : ${keyword }<br>
criterion : ${criterion }<br>
sorting : ${sorting } <br>
pageNumber : ${pageNumber }<br>
총 상품갯수 : ${totalRecordCount } --%>

<c:if test="${empty plist }">
<div align="center" id="emptyProduct" style="margin-top: 300px">
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT09uR_LfHPdzAfTxt9K3hvmH6atw3ZJRM6lMX9BaaDf9U1EMHfcQ"><br>
<h3>등록된 상품이 없습니다.</h3>
</div>
</c:if>

<div class='mainDiv'>
	<c:if test="${not empty plist }">
	<div class="titleDiv">
		<div class="trackingDiv">
			<c:if test="${not empty c1_name and not empty c2_name and not empty c3_name }">
			${c1_name }&nbsp;>&nbsp;${c2_name }&nbsp;>&nbsp;<span id="c3fontstyle">${c3_name }</span>
			</c:if>
			<c:if test="${key eq 'newarrival' }">
			<%-- ${c1_name }&nbsp;>&nbsp;<span id="c3fontstyle">${fn:toUpperCase(key)}</span> --%>
			${c1_name }&nbsp;>&nbsp;<span id="c3fontstyle">NEW ARRIVAL</span>
			</c:if>
			<c:if test="${key eq 'sale' }">
			<%-- ${c1_name }&nbsp;>&nbsp;<span id="c3fontstyle">${fn:toUpperCase(key)}</span> --%>
			${c1_name }&nbsp;>&nbsp;<span id="c3fontstyle">SALE</span>
			</c:if>
			<c:if test="${key eq 'best' }">
			<%-- ${c1_name }&nbsp;>&nbsp;<span id="c3fontstyle">${fn:toUpperCase(key)}</span> --%>
			${c1_name }&nbsp;>&nbsp;<span id="c3fontstyle">BEST</span>
			</c:if>
			
		</div>
		<div class="sortingDiv">
			<label onclick="sortingBy('NEW')" class="sortingBy" style="${sorting == null ? 'color:black;font-weight:bolder;':'' }">NEW</label>
			<label onclick="sortingBy('BEST')" class="sortingBy" style="${sorting == 'BEST'? 'color:black;font-weight:bolder;':'' }">BEST</label>
			<label onclick="sortingBy('PRICEDOWN')" class="sortingBy" style="${sorting == 'PRICEDOWN'? 'color:black;font-weight:bolder;':'' }">PRICE↓</label>
			<label onclick="sortingBy('PRICEUP')" class="sortingBy" style="${sorting == 'PRICEUP'? 'color:black;font-weight:bolder;':'' }">PRICE↑</label>
		</div>
		
	</div>
	</c:if>
	<div class='subDiv'>
		<c:set value="${plist[0].c1_name }" var="c1name"/>
			<input type="hidden" class="hdnC1name" value="${c1name }">
		<c:forEach items="${plist }" var="pro" varStatus="vs">
		<div class='eachDiv' style="cursor:pointer;" onclick="detail(${pro.p_seq })"> 
			<%-- <div align="left">${pro.rnum }</div> --%>
			<div style="margin-top: 18px; margin-bottom: 25px;"><img alt="사진없음" src="/upload/store/${pro.photo1_file }" style="width:250px;height:250px;" style="margin:3%;"><br>
			</div>
			<c:if test="${pro.sum > 0}">
			<font size="3px"><b>${pro.p_name }</b></font><br>
			</c:if>
			<c:if test="${pro.sum eq 0}">
			<font size="3px" style="text-decoration: line-through;"><b>${pro.p_name }</b></font><br>
			</c:if>
			
			<font size="2px">${pro.c_name }</font><br>
			<%-- <font size="2px">(${pro.p_color })</font><br> --%>
			<c:if test="${pro.sum > 0}">			
				<font size="2px">
				<c:if test="${pro.bfs_price ne 0 }">
					&#8361;<font style="text-decoration: line-through;">${pro.bfs_price2 }</font>
				</c:if>			
				&#8361;${pro.p_price2 }</font>
			</c:if>
			<c:if test="${pro.sum eq 0}">
				<font style="color:orange; font-weight: bolder;">SOLD OUT</font>
			</c:if>
			<br>
			
		</div>	
		</c:forEach>
	</div>
</div>

<!-- paging zone -->
<c:if test="${key ne 'newarrival' && key ne 'best'}">
<div id="paging_wrap" style="border: 0px solid red; width:90%%; height:50px; text-align: center;">
	<jsp:include page="/WEB-INF/views/store/productPaging.jsp" flush="false">
		<jsp:param name="pageNumber" value="${pageNumber }"/>
		<jsp:param name="totalRecordCount" value="${totalRecordCount }"/>
		<jsp:param name="pageCountPerScreen" value="${pageCountPerScreen }"/>
		<jsp:param name="recordCountPerPage" value="${recordCountPerPage }"/>
	</jsp:include>
</div>
</c:if>
               
<form action="/store/productDetail" id="moveFrm" method="get">
	<%-- <!-- ★ csrf 예방을 위한 코드추가 -->
 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>
	<input type="hidden" id="p_seq" name="p_seq" value="0">
	<input type="hidden" name="c1_name" value="${c1name }">
	<input type="hidden" name="c2_name" value="${c1name }">
	<input type="hidden" name="c3_name" value="${c1name }">
	<input type="hidden" name="keyword" value="${keyword }">
</form>

<!-- 페이징 FORM -->
<form id="_frmFormSearch" method="get" action="/store/productList" >
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:0 }">
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?0:recordCountPerPage }">
	<input type="hidden" name="c1_name" value="${c1_name }">
	<input type="hidden" name="c2_name" value="${c2_name }">
	<input type="hidden" name="c3_name" value="${c3_name }">
	<input type="hidden" name="keyword" value="${keyword }">
	<input type="hidden" name="criterion" value="${criterion }">
	<input type="hidden" name="key" value="${key }">
</form>

<!-- 정렬 FORM -->
<form id="sortingFrm" method="get" action="/store/productList" >
	<input type="hidden" name="sorting" class="_sorting" value="">
	<input type="hidden" name="c1_name" class="_c1name" value="${c1_name }">
	<input type="hidden" name="c2_name" class="_c2name" value="${c2_name }">
	<input type="hidden" name="c3_name" class="_c3name" value="${c3_name }">
	<input type="hidden" name="criterion" class="_criterion" value="${criterion }">
	<input type="hidden" name="keyword" class="_keyword" value="${keyword }">
	<input type="hidden" name="key" value="${key }">
</form>




</body>
</html>