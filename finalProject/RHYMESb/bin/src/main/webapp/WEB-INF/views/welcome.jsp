<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common/welcome.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/common/welcome.js"></script>

</head>
<body>
Welcome Page
<<<<<<< HEAD
<form action="/logout" method='post'>
<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
<input type="submit" value="로그아웃">
</form>
=======
>>>>>>> master
</body>
</html>