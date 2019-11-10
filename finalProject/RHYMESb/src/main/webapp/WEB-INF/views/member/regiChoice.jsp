<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regiChoice.css">
</head>
<body>
<div align="center" class="regiintroducediv123">
	
 	<div align="center" class="regiintroducediv">
		<span class="regiintroduce">안녕하세요.</span><br>
		<span class="regiintroduce">빠르고 간편한 쇼핑, RHYMES입니다.</span>
	</div>
	
	<div class="btndiv">	
		<button type="button" class="regibutton" onclick="location.href='/member/regimember'">일반 회원가입</button>
		<button type="button" class="regibutton" onclick="location.href='/member/regiseller'">사업자 회원가입</button>
		
		<div align="center" class="regiintroducediv2">
			<span class="txtposition1">사업자이신가요?</span>
						<span class="txtposition">사업자등록증을 보유한 판매회원</span>
		</div>
	</div> 
	
<!-- 	<table id="choicetable" border="1">
		<tr>
			<td colspan="2" align="center" class="intro_top">
				<br><br><br><span class="regiintroduce">안녕하세요.</span><br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<span class="regiintroduce">빠르고 간편한 쇼핑, RHYMES입니다.</span><br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<br><br><br><button type="button" class="regibutton" onclick="location.href='/member/regimember'">일반 회원가입</button>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="left">
				<span class="selletext">사업자이신가요?</span>
			</td>
		</tr>
		<tr>
			<td align="center" class="">
				<span>사업자등록증을 보유한 판매회원</span><br><br><br>
			</td>
			<td class="">
				<button type="button" class="regibutton" onclick="location.href='/member/regiseller'">사업자 회원가입</button><br><br><br>
			</td>
		</tr>
	
	</table> -->
	
</div>
</body>
</html>