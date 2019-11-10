<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RHYMES</title>
<style type="text/css">

</style>
<link rel="stylesheet" href="<%=ctx%>/css/member/layout/login_template.css">

    
</head>
<body>
	<div id="header_wrap">
	<tiles:insertAttribute name="header"/> <!--  /WEB-INF/views/common/layout/header.jsp -->
	</div>
	
	<div id="member_header">
	<section class="member_top_template">
		<tiles:insertAttribute name="member_top"/> <!-- 마이페이지 상단 메뉴 -->
	</section>
	</div>
	
	<div id="body_wrap">			
		<section class="member_middle_content_template">
			<tiles:insertAttribute name="mypage_content"/> <!-- 마이페이지 본문 -->
		</section>
	</div>
	
	<div id="footer_wrap">
	<tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/common/layout/footer.jsp -->
	</div>
</body>
</html>