<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KakaoAddInfo</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regikakaoadd.css">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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

</head>
<body>

<div id="kakao_acc_wrap">

	<form action="/member/kakaoregiAf" name="userinput" onsubmit="return checkIt()" method="get" id="_userinput">
	<input type="hidden" name="authority" value="ROLE_MEMBER">
	<input type="hidden" name="userpw" value="${userpw }">
	
<%-- 	<input type="hidden" name="userpw" value="${pmem.userpw }"> --%>
	
	<div class="backcolor" align="center"></div>
		<div id="body" align="center">
		<br><br><br>
			<div align="center"><span class="findidtext">추가정보 입력</span></div>
			<div align="center"><span class="findidtextsub">*필수입력사항</span></div>
				<table width="500px;" class="regi_table" >
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>					
					
<!-- 					<div class="middleLine"></div> -->
						
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">사용자 이름</span>
							</th>
							<td>
								<input type="text" class="inputtext_s addinfo" name="username" id="_name" value="${username }" readonly>
							</td>
						</tr>
						<tr>
							<th>
								<span class="txt_point2 addinfo">*</span>
								<span class="th_title addinfo">이메일</span>
							</th>
							<td>
								<input type="text" name="useremail" class="inputtext_s addinfo" required
								onchange="isCheckKeybordEmail(this)" id="_email" placeholder="카카오 이메일을 입력해주세요">
								<span class="txt addinfo txt4"></span>
								<input type="button" id="_emailBtn" value="이메일 인증" class="emailBtn epbtn">
								<input type="text" id="_emailText" class="inputtext_s" minlength="6" maxlength="6" placeholder="인증번호 입력">
								<input type="button" id="_emailNumBtn" value="확인" class="emailBtn eposition">
											<input type="hidden" id="_hiddenCode" name="hiddenCode" placeholder="확인용">
											<input type="hidden" id="_checkCode" name="checkCode" placeholder="이메일 인증했는지 체크">
								<p id="emailNumText" class="th_title addinfo"></p>
								
							</td>
						</tr>
	 					
								
				</table>
				
				<div class="regibtn" align="center">
	<!-- 			<div id="avoidDbl"> -->
					<input type="submit" name="confirm" class="regibutton addinfo" value="등 록"><br>
	<!-- 			</div> -->
					<input type="reset" name="reset" class="regibutton addinfo" value="다시입력"><br>
					<input type="button" value="취 소" class="regibutton addinfo" onclick="javascript:window.location='login'">
				</div>
		</div>


	</form>

</div>


</body>





<!-- 이메일 인증 -->
<script type="text/javascript">
$(document).ready(function() {

   $("#_emailBtn").click(function() {
	   
	   var useremail = $("#_email").val();
	   var pattern = /^([\w]{1,})+[\w\.\-\_]+([\w]{1,})+@(?:[\w\-]{2,}\.)+[a-zA-Z]{2,}$/;
	   var bChecked = pattern.test(useremail);
	   
	   if(!pattern.test(useremail)){
		   
	   	   $(".txt4").text("이메일 형식에 맞춰주세요");
		   $(".txt4").css("color","red");
		    	
	   }else{
		   $(".txt4").text("");
	   
	   
	   var number = Math.floor(Math.random() * 100000) + 100000;
       if(number>100000){
          number = number - 10000;
       }

		$.ajax({
		    url:"/member/getEmailCheck2",
		    type:"get",
		    data:{useremail: useremail,
		    		code: number		
		    },
		  	success:function(code){
				alert("[useremail]" + " 이메일로 인증번호를 보냈습니다."); 
				$("#_hiddenCode").val(code);
		  	},
		    	error(){
			  		alert("err");
		  		}
		});
	   }
	   
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
			alert("인증번호를 입력해 주세요");
			$("#_emailText").focus();
		}
		else if(emailcode=="" || emailcode==null){
			alert("이메일 인증번호를 발급받으세요");			
		}
		
		else if(usercode == emailcode){
		//	alert("확인되었습니다.");
			$("#_emailText").css("background-color","f1f1f1");
			$("#emailNumText").text("이메일 인증 완료");
			$("#emailNumText").css("color","green");
			$("#_checkCode").val(emailcode);
			
		}else{
		//	alert("인증번호가 틀렸습니다. 다시 확인해주세요");
			$("#emailNumText").text("인증번호가 틀렸습니다. 다시 확인해주세요");
			$("#emailNumText").css("color","red");
			$("#_emailText").focus();
		}

		
	})
});
</script>

</html>