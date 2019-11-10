<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RHYME!!S</title>
<link rel="stylesheet" href="<%=ctx%>/css/member/layout/mypage_temp.css">
<!-- Favicon -->
<link rel="icon" href="/main/img/core-img/favicon.ico">   
    
</head>
<body>
	<div id="header_wrap">
		<tiles:insertAttribute name="header"/> <!--  /WEB-INF/views/common/layout/header.jsp -->
	</div>
	
	<tiles:insertAttribute name="mypage_top"/> <!-- 마이페이지 상단 메뉴 -->

	<div class="mypage_middle_left_template">
		<tiles:insertAttribute name="mypage_left"/> <!-- 마이페이지 좌측 메뉴 -->
	</div>
	
	<div class="mypage_middle_content_template">
		<tiles:insertAttribute name="mypage_content"/> <!-- 마이페이지 본문 -->
	</div>
	
	<div class="mypage_footer">
		<tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/common/layout/footer.jsp -->
	</div>	
	
</body>
</html>