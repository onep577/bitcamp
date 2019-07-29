<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>
</head>
<body>



<form action="loginAf.jsp" name="frm" onsubmit="return frmsubmit()">
ID : <input type="text" name="id" id="userId"><br>
PW : <input type="text" name="password" id="userpw"><br><br>
<input type="submit" value="로그인">
<input type="button" id="account" value="회원가입">
</form>



<script type="text/javascript">
function frmsubmit(){	
	// 입력 안된 정보가 있을 때 submit을 막아준다
	
	//alert( $("#userId").val().trim() );
	if( $("#userId").val().trim() == "" || $("#userpw").val().trim() == "" ){
		alert("모두 기입해주세요");
		return false;
	}else{
		return true;
	}
}
	
$("#account").click(function () {
	location.href="account.jsp";
});
	


</script>

</body>
</html>