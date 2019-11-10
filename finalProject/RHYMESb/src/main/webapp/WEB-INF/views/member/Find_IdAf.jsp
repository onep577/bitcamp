<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/findidAf.css">
</head>



<body>

<form action="/member/getFindIDEmail" method="get">
<div class="findidAf" align="center">
	<div>
		<span class="findidtext">아이디 찾기</span><br>
	</div>
	<hr class="hrline">
	
	<br>
	
	<div>
		<span class="findidtext_s">고객님의 아이디 찾기가 완료되었습니다.</span>
	</div>
	
	<br>
	
	<div>
		<span class="findidtext_s_id">아이디 : ${founduserid }</span>
	</div>
	
	<br>

	
	<div>
		<input type="submit" value="등록되어있는 이메일로 아이디 보내기" name="confirm" class="regibutton">
	</div>
	<input type="hidden" id="_userid" value="${userid }" name="userid">
	<input type="hidden" id="_useremail" value="${useremail }" name="useremail">
</div>
</form>

</body>



</html>