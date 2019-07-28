<%@page import="servlet.CustomerServlet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
</head>
<body>



<form action="customer" name="frm" onsubmit="return frmsubmit()" method="post">
<input type="hidden" name="command" value="loginAf">
ID : <input type="text" name="id" id="userid"><br>
PW : <input type="text" name="password" id="userpw"><br><br>
<input type="submit" value="로그인">
<input type="button" id="account" value="회원가입">
</form>



<script type="text/javascript">
function frmsubmit(){
	// 입력 안된 정보가 있을 때 submit을 막아준다
	alert("로그인");
	
	//alert( $("#userId").val().trim() );
	if( $("#userid").val().trim() == "" || $("#userpw").val().trim() == "" ){
		alert("모두 기입해주세요");
		return false;
	}else{
		return true;
	}
}

$(document).ready(function () {
	$("#account").on("click", function () {
		alert("회원가입");
		location.href= "customer?command=account";
	});
		
});



</script>

</body>
</html>