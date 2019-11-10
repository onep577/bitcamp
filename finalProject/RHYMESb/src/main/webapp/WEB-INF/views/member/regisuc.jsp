<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regisuc.css">
</head>
<body>
<div class="regisucwrap">
	<div align="center" class="topwrap">
		<h2 style="color: #525252;">회원가입이 완료되었습니다.</h2>
		<hr class="hrline">
	</div>
	<div align="center" class="loginwrap">
		<input type="button" onclick="location.href='/member/login'" value="로그인하러 가기" class="goBtn">
	</div>
	
	<c:if test="${auth != 'ROLE_SELLER' }">
		<div align="center" class="cpwrap">
			<span class="welcpText">˚Welcome Coupon</span>
			<img alt="x" src="<%=request.getContextPath() %>/img/member-img/welcome_cp2.png" class=".welcp" style="width: 160px">
		</div>
	</c:if>
</div>
</body>
</html>