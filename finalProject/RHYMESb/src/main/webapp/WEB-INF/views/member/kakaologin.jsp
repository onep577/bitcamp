<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body onload="submitfun()">
<form action="/login" name="frm" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="username" value="${username }">
	<input type="hidden" name="password" value="${password }">
</form>

</body>

<script type="text/javascript">
function submitfun(){
	setTimeout("submitgo()", 0);
}
function submitgo(){
	document.frm.submit();
}

</script>

</html>