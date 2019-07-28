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
#wrapper1{
	background-color: #FFFFDA;
	width: 800px;
	height: 350px;
}
#box{
/*  	background-color: gray;  */
	width: 800px;
	height: 250px;
	float: left;
}
#coffeebox{
/* 	background-color: green; */
	width: 500px;
	height: 300px;
	float: left;
}
#optionbox{
	/* background-color: orange; */
	width: 300px;
	height: 300px;
	float: left;
}
.coff{
	background-color: #F2FF92;
	font-size: 20px;
	border-style: solid;
/* 	border-collapse: collapse; */
}
.title{
	background-color: #BCE55C;
	font-size: 25px;
	font-style: italic;
	border-collapse: collapse;
}
#wrapper2{
	background-color: #FFFFDA;
	margin: 10px 0px 0px 0px;
	/* 상 우 하 좌 */
	width: 800px;
	height: 350px;
}
</style>
</head>
<body>

<div id="wrapper1">
<h1 align="center">커피 가격표</h1>
<div id="box">
<div id="coffeebox">
<c:if test="${fn:length(priceList) != 0 }">
<table class="coff">
<tr class="title">
	<td>커피 종류</td>
	<td>short</td>
	<td>tall</td>
	<td>grande</td>
</tr>
<c:forEach begin="0" end="${fn:length(priceList)-1 }" step="1" varStatus="i">
<col width="170px"><col width="100px"><col width="100px"><col width="100px">
<tr class="coff">
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
<div id="optionbox">
<table class="coff">
<col width="150px"><col width="70px">
<tr class="title">
	<td colspan="2">
	추가 옵션
	</td>
</tr>
<tr>
	<td>
	시럽 추가
	</td>
	<td>
	500
	</td>
</tr>
<tr>
	<td>
	샷 추가
	</td>
	<td>
	500
	</td>
</tr>
<tr>
	<td>
	휘핑크림 추가
	</td>
	<td>
	500
	</td>
</tr>
</table>
</div>
</div>
</div>



<div id="wrapper2">
<br><br>
<form action="coffee">
커피 종류 <select name="">
	<option value="아메리카노">아메리카노</option>
	<option value="프라프치노">프라프치노</option>
	<option value="카라멜 마끼아또">카라멜 마끼아또</option>
	<option value="카푸치노">카푸치노</option>
	<option value="오늘의 커피">오늘의 커피</option>
</select>
<br><br>

커피 사이즈 <select name="">
	<option value="short">short</option>
	<option value="tall">tall</option>
	<option value="grande">grande</option>
</select>
<br><br>

시럽 추가 <input type="checkbox" name="syrub">
<br><br>

샷 추가 <input type="checkbox" name="shot">
<br><br>

휘핑크림 추가 <input type="radio" name="whip"> 비추가 <input type="radio" name="whip">
<br><br>

<input type="hidden" name="command" value="payment">
<input type="submit" value="결제">
</form>
</div>










</body>
</html>