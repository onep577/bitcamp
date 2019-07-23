<%@page import="dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form id="frm" action="info" method="post">
아이디 : <input type="text" name="id"><br>
패스워드 : <input type="password" name="pwd">

<br><br>

취미<br>
<input type="checkbox" name="hobby" value="잠자기">잠자기
<input type="checkbox" name="hobby" value="노래하기">노래하기
<input type="checkbox" name="hobby" value="게임하기">게임하기

<br><br>

연령대<br>
<input type="radio" name="age" value="10">10대
<input type="radio" name="age" value="20">20대
<input type="radio" name="age" value="30">30대
<input type="radio" name="age" value="40">40대
<input type="radio" name="age" value="50">50대
<input type="radio" name="age" value="60">60대이상

<br><br>

기타 하고싶은 말<br>
<input type="text" name="etc">

<br><br>

<input type="submit" id="move" value="전송">
<input type="button" value="취소">
</form>

</body>
</html>