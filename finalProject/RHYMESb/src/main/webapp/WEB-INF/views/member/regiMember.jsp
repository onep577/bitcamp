<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regimem.css">


<script type="text/javascript">
$(document).ready(function () {
	$(".txt").hide();
});
</script>
<script type="text/javascript">
$(document).ready(function () {
	$("#_id").click(function(){
		$(".txt1").show();
	});
	$("#_pwd").click(function(){
		$(".txt2").show();
	});
	$("#_name").click(function(){
		$(".txt3").show();
	});
	$("#_pwd2").click(function(){
		$(".txt2_1").show();
	});
	$("#_email").click(function(){
		$(".txt4").show();
	});
});
</script>

<script type="text/javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	if(!userinput.userid.value) {
		alert("아이디를 입력하세요");
		$("#_id").focus();
		return false;
	}
	if(!userinput.userpw.value) {
		alert("비밀번호를 입력하세요!");
		$("#_pwd").focus();
		return false;
	}
	if(userinput.userpw.value != userinput.userpw2.value) {
		alert("비밀번호가 일치하지 않습니다.");
		$("#_pwd2").focus();
		return false;
	}
	
	// 이름검증
	if(!userinput.username.value){
		return true;
	}else{
	    var userName = userinput.username.value;
	    var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;
    	if (!deny_char.test(userName)) {
    		alert("영문자 또는 한글 입력을 입력해주세요");
    		$("#_name").focus();
    		return false;
    	}
    	return true;
	}
	
	// 이메일 검증
	if(!userinput.useremail.value){
		return true;
	}else{
	    var userEmail = userinput.useremail.value;
    	var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;
    	var bChecked = pattern.test(userEmail);
    	if(!pattern.test(userEmail)){
	    	$("#_email").focus();
		    	return false;
    		}
    	}
    	return true;
	// 아이디 검증
	var saveId;
	$('[name=userid]').on('focus',function(){
	    saveId = $(this).val();
	    $(this).parent().find('.txt_guide').show();
	});
	// 아이디 - 숫자와 영문자 조합으로 6~12자
    var isTrue = $("input:text[idNumberEngOnly]").attr("idNumberEngOnly");
    var thisVal = $("input:text[idNumberEngOnly]").val();
 
    if(isTrue == "true") {
      if(!/^[a-zA-Z0-9]{6,12}$/.test(thisVal)) {
        alert("[아이디]는 숫자와 영문자 조합으로 6~12자까지 사용 가능합니다.");
 
        if(focusYN == "Y") {
          $("input:text[idNumberEngOnly]").focus();
        }
        return false;
        
      }
    }
    return true;
  
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
        
    if(password.search(id) > -1){
        alert("비밀번호에 아이디가 포함되었습니다.");
        $('#_pwd').val('').focus();
        return false;
    }
    return true;
    
}
</script>

<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@키보드 검증@@@@@@@@@@@@@@@@@@ -->
<!-- 키보드 비밀번호 검증 -->
<script type="text/javascript">
function isPostNum(obj) {
	
	var str = obj.value;
	var userinput = eval("document.userinput");
	var password = userinput.userpw.value;
	var id = userinput.userid.value;
	var checkNumber = str.search(/[0-9]/g);
	var checkEnglish = str.search(/[a-z]/ig);
	
	if(!/^[a-zA-Z0-9]{8,25}$/.test(str)){
	    $(".txt2").text("숫자+영문자 조합으로 8~25자까지 사용가능합니다.");
	    $(".txt2").css("color","red");
	}
	else if(checkNumber <0 || checkEnglish <0){
	    $(".txt2").text("숫자와 영문자를 혼용하여야 합니다.");
	    $(".txt2").css("color","red");
	}
	else if(/(\w)\1\1\1/.test(str)){
	    $(".txt2").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
	    $(".txt2").css("color","red");
	}
	else if(str.search(id) > -1){
	    $(".txt2").text("비밀번호에 아이디가 포함되었습니다.");
	}
	else{
		$(".txt2").text("사용가능한 비밀번호입니다.");
	    $(".txt2").css("color","blue");
	}
	
}
</script>

<!-- 키보드 비밀번호 재확인 -->
<script type="text/javascript">
function isPostNum2(obj) {
	var userinput = eval("document.userinput");
	var pw = obj.value;
	if(userinput.userpw.value != pw) {
// 		alert("cc");
		$(".txt2_1").text("비밀번호가 일치하지 않습니다.");
	    $(".txt2_1").css("color","red");
	}else{
		$(".txt2_1").text("확인");
	    $(".txt2_1").css("color","blue");
	}
}
</script>



<!-- 키보드 아이디 검증 -->
<script type="text/javascript">
function isCheckKeybord(obj) {
	
	var inputid = obj.value;
	var userinput = eval("document.userinput");
	
	if(!/^[a-zA-Z0-9]{6,16}$/.test(inputid)) {
        /* alert("[아이디]는 숫자와 영문자 조합으로 6~16자까지 사용 가능합니다."); */
		$(".txt1").text("숫자와 영문자 조합으로 6~16자까지 사용 가능합니다.");
	    $(".txt1").css("color","red");
	}
}
</script>

<!-- 키보드 이름 검증 -->
<script type="text/javascript">
function isCheckKeybordName(obj) {
	
	var inputname = obj.value;
	var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;
	
 	if (!deny_char.test(inputname)) {
//  		alert("dd");
 		$(".txt3").text("영문자 또는 한글 입력을 입력해주세요");
	    $(".txt3").css("color","red");
 	}
 	else{
 		$(".txt3").text("");
 	}
 	
}
</script>

<!-- 키보드 이메일 검증 -->
<script type="text/javascript">
function isCheckKeybordEmail(obj) {
	
	var inputemail = obj.value;
	var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;
	var bChecked = pattern.test(inputemail);
	if(!pattern.test(inputemail)){
		$(".txt4").text("이메일 형식에 맞춰주세요");
	    $(".txt4").css("color","red");
	    	
	}else{
		$(".txt4").text("");
	}
 	
}
</script>











<script type="text/javascript">
// 아이디 - 숫자와 영문자 조합으로 6~16자
function idCheck(focusYN) {
    var isTrue = $("input:text[idNumberEngOnly]").attr("idNumberEngOnly");
    var thisVal = $("input:text[idNumberEngOnly]").val();
 	
    if(isTrue == "true") {
      if(!/^[a-zA-Z0-9]{6,16}$/.test(thisVal)) {
        alert("[아이디]는 숫자와 영문자 조합으로 6~16자까지 사용 가능합니다.");
 
        if(focusYN == "Y") {
          $("input:text[idNumberEngOnly]").focus();
        }
 
        return false;
      }
    }
    
 //   boolean idcheck = false;
 
 var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});
    
//     alert("ok");
//     alert($("#_id").val());
    $.ajax({
		url:"/member/getIDCheck",
		type:"post",
		data:{id:$("#_id").val()},
		success:function(msg){
//  			alert("suc");
			if(msg == 'YES'){
	 		//	alert("msg == YES");	// id있음	
	 		$(".txt1").html("사용할 수 없는 아이디입니다.");
	 		$(".txt1").css("color", "red");
	 		$("#_id").val("");
	 //		$("#_userid").val("");
	 		$("#_id").focus();
	 		
			}else{
	 //		alert("msg == NO");			// 없음
	 		$(".txt1").text("사용 가능한 아이디입니다.");
	 		$(".txt1").css("color", "blue");
	 //		$("#_userid").val($("#_id").val());
	 		$("#_pwd").focus();
 	// 		idcheck = true;
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
  	
    return true;
}
</script>

</head>
<body>

<div id="wrap">
	<form action="/member/addmem" name="userinput" onsubmit="return checkIt()" method="post">
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	<input type="hidden" name="authority" value="ROLE_MEMBER">
<!-- 	<div class="backcolor" align="center"></div> -->
		<div id="body" align="center">
			<div align="center"><span class="findidtext">가입정보 입력</span></div>
				<table width="500px;" class="regi_table">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tr>
						<th colspan="2" class="subTitle">
						<span class="txt_point_b">*</span>
						필수
						
						</th>
					</tr>
					<tr>
						<th>
							<span class="txt_point">*</span>
							<span class="th_title">아이디</span>
						</th>
						<td>
							<input type="button" name="confirm_id" value="ID 중복확인" 
							class="regibutton1" id="inputBtn" onclick="idCheck()">
							<input type="text" id="_id" name="userid" onchange="isCheckKeybord(this)" class="inputtext_s" maxlength="12" minlength="6" idnumberengonly="true" placeholder="아이디">
							
							<span class="txt txt1">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
							<p id="_rgetid"></p>
						</td>
					</tr>
					<tr>
						<th>
							<span class="txt_point">*</span>
							<span class="th_title">비밀번호</span>
						</th>
						<td>
							<input type="password" onchange="isPostNum(this)" name="userpw" 
								maxlength="25" minlength="8" class="inputtext_s" id="_pwd" placeholder="비밀번호">
							<span class="txt txt2">숫자+영문자 조합으로 8~25자까지 사용가능합니다.</span>
						</td>
					</tr>
					<tr>
						<th>
							<span class="txt_point">*</span>
							<span class="th_title">비밀번호 확인</span>
						</th>
						<td>
							<input type="password" onchange="isPostNum2(this)" name="userpw2" class="inputtext_s" maxlength="25" id="_pwd2" placeholder="비밀번호 확인">
							<span class="txt txt2_1"></span>
						</td>
					</tr>
					
					<div class="middleLine"></div>
					
						<tr class="addinfo">
							<th colspan="2" class="subTitle addinfo">개인정보 입력</th>
						</tr>
						
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">사용자 이름</span>
							</th>
							<td>
								<input type="text" class="inputtext_s addinfo" onchange="isCheckKeybordName(this)" name="username" id="_name" placeholder="이름">
								
								<span class="txt addinfo txt3">영문자 또는 한글 입력</span>
							</td>
						</tr>
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">이메일</span>
							</th>
							<td>
								<input type="text" name="useremail" class="inputtext_b addinfo" onchange="isCheckKeybordEmail(this)" id="_email" maxlength="30" placeholder="이메일">
								<span class="txt addinfo txt4"></span>
							</td>
						</tr>
	 					<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">휴대폰</span>
							</th>
							<td>
								<input type="number" class="inputtext_s addinfo" name="phone" maxlength="11" minlength="11" placeholder="전화번호">
							</td>
						</tr>
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">주소</span>
							</th>
							<td>
								<div class="wrap-input100 bg1 rs1-wrap-input100 addinfo">
								<input type="button" onclick="sample6_execDaumPostcode()" class="postBtn" value="우편번호 찾기"><br>
								<input type="text" id="_postcode" class="inputtext_s" name="postcode" placeholder="우편번호">
								<input type="text" id="_address" name="address" class="inputtext_s" placeholder="주소"><br>
								<input type="text" id="_detailAddress" name="detailAddress" class="inputtext_b" placeholder="상세주소">
								<input type="hidden" id="_extraAddress" name="extraAddress" placeholder="참고항목">
								</div>
								<br>
							</td>
						</tr>
	
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">성별</span>
							</th>
							<td>
								<input type="radio" name="gender" value="female" class="addinfo radiobtn"><span class="addinfo radiobtn">여자</span>
								<input type="radio" name="gender" value="male" class="addinfo radiobtn"><span class="addinfo radiobtn">남자</span>
							</td>
						</tr>
						
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">생년월일</span>
							</th>
							<td>
								<input type="number" name="birth" class="inputtext_s addinfo" placeholder="YYYYMMDD" maxlength="8" minlength="8">
							</td>
						</tr>	
								
				</table>
		</div>

		<div class="regibtn" align="center">
<!-- 			<div id="avoidDbl"> -->
				<input type="submit" name="confirm" class="regibutton addinfo" value="등 록"><br>
<!-- 			</div> -->
			<input type="reset" name="reset" class="regibutton addinfo" value="다시입력"><br>
			<input type="button" value="취 소" class="regibutton addinfo" onclick="javascript:window.location='login'">
		</div>
	</form>

</div>
</body>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('_postcode').value = data.zonecode;
                document.getElementById("_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("_detailAddress").focus();
            }
        }).open();
    }
</script>


</html>