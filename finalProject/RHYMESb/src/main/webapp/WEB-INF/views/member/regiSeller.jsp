<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/regiseller.css">


<script type="text/javascript">
function checkIt() {
	var userinput = eval("document.userinput");
	
	if(!userinput.crname.value) {
		alert("사업자 등록번호를 인증 받으세요");
		$("#_c_num1").focus();
		return false;
	}
}
</script>



</head>
<body>

<div id="wrap">

<!-- 	<form name="frm1">
		<input name="wrkr_no" type="text" value="2208183676"/>
		<input type="button" value="팝업" onclick="onopen();"/>
	</form> -->
	
	<form action="/member/addseller" name="userinput" onsubmit="return checkIt()" method="get">
<!-- 	<input type="hidden" name="authority" value="ROLE_MEMBER"> -->
		<div id="body" align="center">
		
			<div align="center">
				<span class="findidtext">사업자 회원</span><br><br>
			</div>
		
			<table border="1" class="bordertable">
			<tr>
			<td align="center">
			<div class="regisellermargin">
				<span>사업자 등록번호</span>
				<input type="text" name="crnum1" class="inputtext_s" id="_c_num1" minlength="3" maxlength="3" required="required">
				- <input type="text" name="crnum2" class="inputtext_s" id="_c_num2" minlength="2" maxlength="2" required="required">
				- <input type="text" name="crnum3" class="inputtext_s" id="_c_num3" minlength="5" maxlength="5" required="required">
				<input type="button" value="사업자 번호 인증" class="regibutton" id="_r_numBtn">

				<p id="_crText"></p>
			<div class="cnamediv">
				<span class="cnamespan">상호명</span>
				<input type="inputtext" name="crname" id="_c_name" class="inputtext_bname" readonly style="background-color: #f1f1f1"><br><br><br>
			</div>
	
			<div id="footer">
				<input type="submit" name="confirm" class="regiBtn" value="다 음" />
				<input type="reset" name="reset" class="regiBtn" value="다시입력" />
				<input type="button" value="취 소" class="regiBtn" onclick="javascript:window.location='login'" />
			</div>
			</div>
			<td>
			</tr>
		</table>	
		</div>
	</form>

</div>
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
			    $("#_crText").text("이미 RHYMES에 등록되어있는 사업자번호입니다.");
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

<!-- 사업자등록번호 -->
<script language="JavaScript">
function onopen()
{
var url =
"http://www.ftc.go.kr/bizCommPop.do?wrkr_no="+frm1.wrkr_no.value;
window.open(url, "bizCommPop", "width=750, height=700;");
}
</script>

</html>