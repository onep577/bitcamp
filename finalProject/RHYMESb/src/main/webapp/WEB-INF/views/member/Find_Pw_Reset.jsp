<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/inputText.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>

<script type="text/javascript">
function checkIt() {
	
	var userinput = eval("document.userinput");
	
	if(userinput.userpw.value != userinput.userpw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#_pwd2").focus();
		return false;
	}
	// 비밀번호 검증
    var password = userinput.userpw.value;
	var id = userinput.userid.value;
    if(!/^[a-zA-Z0-9]{8,25}$/.test(password)){
        alert('숫자+영문자 조합으로 8~25자까지 사용가능합니다.');
        $('#_pwd').val('').focus();
        return false;
    }
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#_pwd').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(password)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#_pwd').val('').focus();
        return false;
    }
        
    if(password.search(id) <	 -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $('#_pwd').val('').focus();
        return false;
    }
    return true;
}
</script>

<body>
	<div align="center">
		<span class="findidtext">
			비밀번호 재설정
		</span>
	</div>
	<br>
<div align="center">
<form action="/member/userpwreset" name="userinput" onsubmit="return checkIt()" method="get">
<input type="hidden" value="${userid }" name="userid">
	<input type="password" name="userpw" class="inputtext_b_long" required placeholder="비밀번호"><br>
	<input type="password" name="userpw2" id="_pwd2" class="inputtext_b_long" required placeholder="비밀번호 재확인"><br>
	<br><button type="submit" class="regibutton_long"><span style="color:#545454;">확인</span></button>
</form>
</div>
</body>
</html>