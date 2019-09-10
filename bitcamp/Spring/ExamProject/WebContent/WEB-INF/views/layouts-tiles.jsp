<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- tiles -->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!-- core tag -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- fmt setCharacterEncoding 대신 쓸 수 있다 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:requestEncoding value="utf-8"/>

<%--
request.setCharacterEncoding("utf-8");
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<tiles:insertAttribute name="header"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/style.css">

</head>
<body>

<div id="body_wrap">
	<div id="main_wrap">
		<tiles:insertAttribute name="top_inc" />
		<tiles:insertAttribute name="top_menu" />
	</div>

	<div id="middle_wrap">
		<div id="sidebar_wrap">
			<tiles:insertAttribute name="left_menu" />
		</div>

		<div id="content_wrap">
			<div id="content_title_wrap">
				<!-- doc_title?? -->
				<div class="title">${doc_title }</div>
			</div>

			<tiles:insertAttribute name="main" />
		</div>
	</div>

	<div id="footer_wrap">
		<tiles:insertAttribute name="bottom_inc" />
	</div>

</div>



<script type="text/javascript">
$(document).ready(function () {
	
	$("#content_title_wrap div.title").css("background-image", "url('./image/ico_sub_sb.gif')");
	
});
</script>

</body>
</html>