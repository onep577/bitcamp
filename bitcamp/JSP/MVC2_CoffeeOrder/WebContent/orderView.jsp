<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
.coff1{
	font-size: 25px;
	font-style: italic;
}
.coff2{
}
</style>
</head>
<body>

<div align="center" style="background-color: #AB1297">
<h1>커피 가격표</h1>
<c:if test="${fn:length(priceList) != 0 }">
<table border="1" style="background-color: #FFC6FF">
<tr class="coff1">
	<th>커피 종류</th>
	<th>short</th>
	<th>tall</th>
	<th>grande</th>
</tr>
<c:forEach begin="0" end="${fn:length(priceList)-1 }" step="1" varStatus="i">
<col width="150px"><col width="100px"><col width="100px"><col width="100px">
<tr class="coff2">
	<td>
	<c:out value="${priceList[i.index].coff_type }"></c:out>
	</td>
	<td>
	<c:out value="${priceList[i.index].coff_short }"></c:out>
	</td>
	<td>
	<c:out value="${priceList[i.index].coff_tall }"></c:out>
	</td>
	<td>
	<c:out value="${priceList[i.index].coff_grand }"></c:out>
	</td>
</tr>
</c:forEach>
</table>
<br><br>
</c:if>
</div>

<script type="text/javascript">
alert();
</script>

</body>
</html>