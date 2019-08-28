<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
</head>
<body>



<c:if test="${not empty userId }">
${userId }님 안녕하세요

<table border="1" style="background-color: #ffaaff;">
<col width="200">
<tr>
	<td>
		<a href="bbsList.do">글목록</a>
	</td>
</tr>
<tr>
	<td>
		<a href="bbsWrite.do">글쓰기</a>
	</td>
</tr>
<tr>
	<td>
		<a href="logout.do">로그아웃</a>
	</td>
</tr>
</table>
</c:if>



<c:if test="${empty userId }">

<form action="loginAf.do" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" size="20">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="log-in">
	</td>
</tr>
</table>

<a href="account.do">회원가입</a>

</form>
</c:if>



<script type="text/javascript">

$("#login").click(function () {
	var id = $("#id").val().trim();
	var pwd = $("#pwd").val().trim();
	alert(id + pwd);
	
	$("#frm").attr("action","loginAf.do").submit();
});

$("#account").click(function () {
	location.href="account.do";
});
	


</script>

</body>
</html>
