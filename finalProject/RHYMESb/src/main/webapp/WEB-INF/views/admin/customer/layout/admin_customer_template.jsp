<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>RHYMES</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">        
<!-- Favicon -->
<link rel="icon" href="/img/main-img/core-img/favicon.ico">      
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/admin/common/admin_body.css">
<tiles:insertAttribute name="ex_resources"/><!-- 외부리소스 -->
</head>
<body id="page-top">

<div id="wrapper">
	<tiles:insertAttribute name="left_menu"/><!-- 좌측 네비게이션바 -->
	<div id="content-wrapper" class="d-flex flex-column">
		<div id="content">
			<tiles:insertAttribute name="header"/> <!-- 상단 메뉴바 -->
			<tiles:insertAttribute name="body"/> <!-- 본문 -->
			<tiles:insertAttribute name="footer"/> <!-- /WEB-INF/views/common/layout/footer.jsp -->
		</div>		
	</div>
</div>
</body>
</html>