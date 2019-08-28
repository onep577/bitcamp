<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!-- <!DOCTYPE html> -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 화면 배치용 jsp -->

<table border="1" style="width: 100%; height: 100%; border-color: gray;">

<!-- header -->
<tr align="center">
	<td height="10%" colspan="2">
		<tiles:insertAttribute name="header"/>
	</td>
</tr>

<tr>
	<!-- menu -->
	<td width="30%" height="30%" valign="top">
		<tiles:insertAttribute name="menu"/>
	</td>
	<!-- main -->
	<td>
		<tiles:insertAttribute name="content"/>
	</td>
</tr>

<!-- footer -->
<tr align="center">
	<td height="10%" colspan="2">
		<tiles:insertAttribute name="footer"/>
	</td>
</tr>

</table>

</body>
</html>

