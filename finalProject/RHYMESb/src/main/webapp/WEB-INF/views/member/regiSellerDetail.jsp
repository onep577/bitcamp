<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regisellerdetail.css">

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
// 아이디 - 숫자와 영문자 조합으로 6~10자
function idCheck(focusYN) {
    var isTrue = $("input:text[idNumberEngOnly]").attr("idNumberEngOnly");
    var thisVal = $("input:text[idNumberEngOnly]").val();
 
    if(isTrue == "true") {
      if(!/^[a-zA-Z0-9]{6,10}$/.test(thisVal)) {
        alert("[아이디]는 숫자와 영문자 조합으로 6~10자까지 사용 가능합니다.");
 
        if(focusYN == "Y") {
          $("input:text[idNumberEngOnly]").focus();
        }
 
        return false;
      }
    }
    
 //   boolean idcheck = false;
    

    $.ajax({
		url:"/member/getIDCheck",
		type:"get",
		data:{id:$("#_id").val()},
		success:function(msg){

			if(msg == 'YES'){
// 	 			alert("msg == YES");	// id있음	
	 		$("#_rgetid").html("사용할 수 없는 아이디입니다.");
	 		$("#_rgetid").css("color", "#b3130b");
	 		$("#_id").val("");
	 //		$("#_userid").val("");
	 		$("#_id").focus();
	 		
			}else{
	 //		alert("msg == NO");			// 없음
	 		$("#_rgetid").text("사용 가능한 아이디입니다.");
	 		$("#_rgetid").css("color", "#0b0fb3");
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
	    
	    var userName = userinput.name.value;
	    var deny_char = /^[ㄱ-ㅎ|가-힣|a-z|A-Z|\*]+$/;
    	if (deny_char.test(userName)) {
    		alert("영문자 또는 한글 입력을 입력해주세요");
    		$("#_name").focus();
    		return true;
    	}
    	return false;
	}
	
	// 이메일 검증
	if(!userinput.useremail.value){
		return true;
	}else{
	    var userEmail = userinput.username.value;
    	var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;
    	var bChecked = pattern.test(userEmail);
    	$("#_email").focus();
	    	return false;
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
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(userinput.userpw.value)){            
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
<script type="text/javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	
	if(!userinput.c_name.value) {
		alert("사업자 번호를 인증 받으세요");
		$("#_c_num1").focus();
		return false;
	}
	if(!userinput.checkCode.value) {
		alert("담당이메일을 입력하세요");
		$("#_ic_email1").focus();
		return false;
	}
	if(!userinput.hiddenCode.value) {
		alert("담당이메일을 입력하세요");
		$("#_email2").focus();
		return false;
	}
	if(!userinput.c_address.value) {
		alert("회사 주소를 입력하세요");
		$("#_address").focus();
		return false;
	}
		if(!userinput.s_address.value) {
		alert("출고지 주소를 입력하세요");
		$("#S_address").focus();
		return false;
	}
	if(!userinput.r_address.value) {
		alert("교환/반품 주소를 입력하세요");
		$("#R_address").focus();
		return false;
	}
	if(!userinput.textresult.value){
		alert("담당자 번호를 입력하세요");
		$("#textresult").focus();
		return false;
	}

	
}
</script>
</head>


<body>


<form action="/member/addsellerdetail" name="userinput" onsubmit="return checkIt()" method="post">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<input type="hidden" name="authority" value="ROLE_SELLER">
<div id="body" align="center">
	<table class="regi_table">
	
		<tr>
			<th>
			<span class="th_title fname">상호 명</span>
			</th>
			<td>
				<span class="c_name">${crdto.crname}</span>
				<input type="hidden" name="c_name" value="${crdto.crname }">
				
				<span class="c_num">사업자등록번호</span>

				<span class="c_num">${crdto.crnum1 }-${crdto.crnum2 }-${crdto.crnum3 }</span>
				<input type="hidden" name="crnum1" value="${crdto.crnum1 }">
				<input type="hidden" name="crnum2" value="${crdto.crnum2 }">
				<input type="hidden" name="crnum3" value="${crdto.crnum3 }">
				
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">아이디</span>
			</th>
			<td>
				<input type="text" id="_id" name="userid" maxlength="12" minlength="6" idnumberengonly="true" onclick="idOn()" class="inputtext_s" placeholder="아이디" required/>
				<input type="button" name="confirm_id" value="중복확인" 
				class="regibutton" id="inputBtn" onclick="idCheck()" />
				<span id="_rgetid" class="txt">6자 이상의 영문 혹은 영문과 숫자를 조합</span>
			</td>
		</tr>
		<tr>
			<th>
			<span class="txt_point">*</span>
			<span class="th_title">비밀번호</span>
			</th>
			<td>
				<input type="password" name="userpw" maxlength="25" minlength="8" class="inputtext_s" 
				id="_pwd" onchange="isPostNum(this)" required placeholder="비밀번호">
				<span class="txt txt2">숫자+영문자 조합으로 8~25자까지 사용가능합니다.</span>
			</td>
		</tr>
		<tr>
			<th>
			<span class="txt_point">*</span>
			<span class="th_title">비밀번호 확인</span>
			<td>
				<input type="password" name="userpw2" maxlength="25" id="_pwd2" 
				onchange="isPostNum2(this)" class="inputtext_s" required placeholder="비밀번호 확인"/>
				<span class="txt txt2_1">숫자+영문자 조합으로 8~25자까지 사용가능합니다.</span>
			</td>
		</tr>	
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">대표자 명</span>
			</th>
			<td>
				<input type="text" name="p_name" id="_p_name" class="inputtext_b" required placeholder="대표자 명">
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">업태</span>
			</th>
			<td>
				<input type="text" name="c_cond" id="_c_cond" class="inputtext_b" required placeholder="업태">
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">종목</span>
			</th>
			<td>
				<input type="text" name="c_type" id="_c_type" class="inputtext_b" required placeholder="종목">
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">담당자 이름</span>
			</th>
			<td>
				<input type="text" name="ic_name" id="_ic_name" class="inputtext_b" required placeholder="담당자 이름">
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">담당자 번호</span>
			</th>
			<td>
				<input type="number" id="to" name="to" minlength="11" maxlength="11" class="inputtext_b" placeholder="- 없이(ex 01012345678)">   <!-- 인증번호 받을사람 휴대폰 번호 -->
	 					<input type="button" id="send" value="전송" class="regibutton"> <!-- 문자보내는 전송버튼 -->
	 					<input type="number" id="userNum" class="inputtext_s" placeholder="인증번호 입력">   <!-- 인증번호 입력창 -->
						<input type="button" id="enterBtn" value="확인" class="regibutton">   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
						<input type="hidden" name="text" id="text" placeholder="확인용">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
						<input type="hidden" id="textresult" name="textresult" placeholder="textresult">
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">담당자메일</span>
			</th>
			<td>
				<input type="text" name="ic_email1" class="inputtext_email" id="_ic_email1">
				@
				<input type="text" name="ic_email2" class="inputtext_email" id="_email2">
				<span>
				<select name="ic_email3" class="inputtext_email eposition" id="_emailSelect" onchange="changeEmail()">
					<option value="x">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="gmail.com">gmail.com</option>
				</select>
				</span>
				<input type="button" id="_emailBtn" value="이메일 인증" class="regibutton epbtn"/><br>
				<input type="text" id="_emailText" class="inputtext_s" minlength="6" maxlength="6" placeholder="인증번호 입력"/>
				<input type="button" id="_emailNumBtn" value="인증번호 확인" class="regibutton"/>
							<input type="hidden" id="_hiddenCode" name="hiddenCode" placeholder="확인용">
							<input type="hidden" id="_checkCode" name="checkCode" placeholder="이메일 인증했는지 체크">
				<p id="emailNumText" class="txt txt2"></p>
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">회사주소</span>
			</th>
			<td>
				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<input type="text" id="_postcode" name="c_postcode" class="inputtext_s" placeholder="우편번호" required>
					<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="regibutton"><br>
					<input type="text" id="_address" name="c_address" class="inputtext_long" placeholder="주소" required><br>
					<input type="text" id="_detailAddress" name="c_detailAddress" class="inputtext_b" placeholder="상세주소" required>
					<input type="hidden" id="_extraAddress" name="c_extraAddress" placeholder="참고항목">
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">출고지주소</span>
			</th>
			<td> 
				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<input type="text" id="S_postcode" name="s_postcode" class="inputtext_s" placeholder="우편번호" required>
					<input type="button" onclick="S_execDaumPostcode()" value="우편번호 찾기" class="regibutton"><br>
					<input type="text" id="S_address" name="s_address" class="inputtext_long" placeholder="주소" required><br>
					<input type="text" id="S_detailAddress" name="s_detailAddress" class="inputtext_b" placeholder="상세주소" required>
					<input type="hidden" id="S_extraAddress" name="s_extraAddress" placeholder="참고항목">
				</div>
			</td>
		</tr>
		<tr>
			<th>
				<span class="txt_point">*</span>
				<span class="th_title">반품/교환지주소</span>
			</th>
			<td>
				<div class="wrap-input100 bg1 rs1-wrap-input100">
					<input type="text" id="R_postcode" name="r_postcode" class="inputtext_s" placeholder="우편번호" required>
					<input type="button" onclick="R_execDaumPostcode()" value="우편번호 찾기" class="regibutton"><br>
					<input type="text" id="R_address" name="r_address" class="inputtext_long" placeholder="주소" required><br>
					<input type="text" id="R_detailAddress" name="r_detailAddress" class="inputtext_b" placeholder="상세주소" required>
					<input type="hidden" id="R_extraAddress" name="r_extraAddress" placeholder="참고항목">
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<div class="regibtn" align="center">
				<input type="submit" value="확인" class="inputregibtn">
				<input type="button" value="취소" onclick="javascript:window.location.href='login'" class="inputregibtn">
			</div>
			</td>
		</tr>
	</table>
</div>

</form>
</body>


<!-- 사업자번호인증 -->
<script type="text/javascript">
$(document).ready(function() {

   $("#_r_numBtn").click(function() {
	//  alert("사업자 번호 인증 클릭"); 
	//  alert($("#_c_num1").val());
		$.ajax({
		    url:"/member/getCRCheck",
		    type:"get",
		    data:{_c_num1: $("#_c_num1").val(),
		    	_c_num2: $("#_c_num2").val(),
		    	_c_num3: $("#_c_num3").val()
		         },
		  success:function(msg){
			  if(msg=="1"){
		//	    alert("RHYMES에 등록되어있는 사업자번호입니다.");
			    $("#_crText").text("RHYMES에 등록되어있는 사업자번호입니다.");
			    $("#_crText").css("color", "red");
			  }
			  else if(msg=="NO"){
		//		alert("등록되지 않은 사업자번호입니다.");
			    $("#_crText").text("등록되지 않은 사업자번호입니다.");
			    $("#_crText").css("color", "red");
			  }
			  else{
			//	  alert("확인되었습니다. : " + msg);
				  $("#_crText").text("확인되었습니다.");
				  $("#_crText").css("color", "green");
				  
				  $("#_c_name").val(msg);	// 상호명
				  
				  $("#_c_num1").css("background-color","#f1f1f1");
				  $("#_c_num1").attr("readonly","readonly");
				  $("#_c_num2").css("background-color","#f1f1f1");
				  $("#_c_num2").attr("readonly","readonly");
				  $("#_c_num3").css("background-color","#f1f1f1");
				  $("#_c_num3").attr("readonly","readonly");
			  }

		    },
		    error(){}
		    
		 });
   })
   
});

</script>


<!-- 이메일 인증 -->
<script type="text/javascript">
$(document).ready(function() {

   $("#_emailBtn").click(function() {
	   
	   var number = Math.floor(Math.random() * 100000) + 100000;
       if(number>100000){
          number = number - 10000;
       }

	   var e1 = $("#_ic_email1").val();
	   var e2 = $("#_email2").val();

			$.ajax({
			    url:"/member/getEmailCheck",
			    type:"get",
			    data:{e1: e1,
			    		e2: e2,
			    		code: number		
			    },
			  	success:function(code){
			  		
			  		if(code=='no'){
			  			alert("이미 등록되어있는 이메일입니다.");
			  		}else{
				  
						alert("[" + e1+"@"+e2+ "]" + " 이메일로 인증번호를 보냈습니다.");
	
						$("#_hiddenCode").val(code);
			  		}
			  	},
			    	error(){
				  		alert("err");
			  		}
			});
	   
   })
   
});
</script>

<!-- 이메일 번호 일치확인 -->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#_emailNumBtn").click(function(){
		
		var usercode = $("#_emailText").val();	// 유저가 입력한 인증번호
		var emailcode = $("#_hiddenCode").val();	// 이메일로 발송된 인증번호
		
		if(usercode=="" || usercode==null){
// 			alert("인증번호를 입력해 주세요");
			$("#emailNumText").text("인증번호를 입력해 주세요");
			$("#emailNumText").css("color","#B3130B");
			$("#_emailText").focus();
		}
		if(emailcode=="" || emailcode==null){
// 			alert("이메일 인증번호를 발급받으세요");		
			$("#emailNumText").text("이메일 인증번호를 발급받으세요");
			$("#emailNumText").css("color","#B3130B");
			$("#_emailText").focus();
		}
		if(emailcode==""){
			$("#emailNumText").text("이메일을 입력해주세요");
			$("#emailNumText").css("color","#B3130B");
		}
		else if(usercode == emailcode){
			$("#_emailText").css("background-color","f1f1f1");
			$("#emailNumText").text("이메일 인증 완료");
			$("#emailNumText").css("color","#0B0FB3");
			$("#_checkCode").val(emailcode);
			
		}else{
			$("#emailNumText").text("인증번호가 틀렸습니다. 다시 확인해주세요");
			$("#emailNumText").css("color","#B3130B");
			$("#_emailText").focus();
		}

		
	})
});
</script>



<!-- 전화번호 인증 -->
<script>
var count = 0; /* 문자 중복을 막기 위한 인증번호 */

$(document).ready(function() {

   $("#send").click(function() {
      
      var number = Math.floor(Math.random() * 100000) + 100000;
         if(number>100000){
            number = number - 10000;
         }

         $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
      
      var to = $("#to").val();
      
      if(to == "" || to == null){
         alert("번호를 입력해 주세요");
         $("#to").focus();
      }
      
      else {
      var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
         
         if(con_test == true){
              
            if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
 
              $.ajax({
                  url:"sendSms.do",
                  type:"get",
                  data:{to: $("#to").val(),
                       text: $("#text").val()
                       },
                success:function(){
                  alert("해당 휴대폰으로 인증번호를 발송했습니다");
                  count++;
                  
//                   alert(count);
                  },
                  error(){}
               });
            } else {
               alert("휴대폰 인증 그만하세요")
            }
         
         }
            else if(con_test == false){
               
            }
      }     
   })

   $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
      
      var userNum = $("#userNum").val();
      
      var sysNum = $("#text").val();         
      
      if(userNum == null || userNum == ""){
         alert("휴대폰으로 발송된 인증번호를 입력해주세요");
      }
      
      else{
          
          if(userNum.trim() == sysNum.trim()){
             alert("확인되었습니다.");
             $("#textresult").val(sysNum);
          }
          else {
//              alert("실패");
          }          
      }

   });
});

</script>



<!-- 이메일 SELECT박스 -->
<script>
function changeEmail(){
    var langSelect = document.getElementById("_emailSelect");
//	alert("langSelect: " + langSelect);
	
    var selectValue = langSelect.options[langSelect.selectedIndex].value;
//	alert("selectValue: " + selectValue);
	
    var selectText = langSelect.options[langSelect.selectedIndex].text;
//	alert("selectText: " + selectText);
	
	if(selectText=='naver.com' || selectText=='hanmail.net' ||selectText=='gmail.com'){
		var textemail = document.getElementById("_email2").value=selectText;
	//	alert("textemail: " + textemail);		
	}
	if(selectText=='직접입력'){
		var textemail = document.getElementById("_email2").value="";
	}
	
	
}
</script>



<!-- 회사주소 -->
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


<!-- 출고지주소 -->
<script>
    function S_execDaumPostcode() {
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
                    document.getElementById("S_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("S_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('S_postcode').value = data.zonecode;
                document.getElementById("S_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("S_detailAddress").focus();
            }
        }).open();
    }
</script>


<!-- 반품/교환지주소 -->
<script>
    function R_execDaumPostcode() {
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
                    document.getElementById("R_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("R_extraAddress").value = '';
                }
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('R_postcode').value = data.zonecode;
                document.getElementById("R_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("R_detailAddress").focus();
            }
        }).open();
    }
</script>


</html>