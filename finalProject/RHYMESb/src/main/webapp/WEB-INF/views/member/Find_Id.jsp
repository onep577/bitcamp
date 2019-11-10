<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/member/content/findid.css">

  <!-- 
<style type="text/css">
.section_login{
	width: 400px;
	height: 500px;
/* 	background-color: orange; */
	float: left;
}
.section_login_email{
	width: 350px;
    height: 200px;
/* 	background-color: blue; */
	margin: 400px;	
}
.section_login_pw{
	width: 350px;
	height: 200px;
/* 	background-color: olive; */
}
.tit_label{
	paddin:1px;
}

</style>
 -->

<script type="text/javascript">

function chkForm() {
	var userinput = eval("document.userinput");
	if(!userinput.userid.value) {
		alert("아이디를 입력하세요");
		$("#_id").focus();
		return false;
	}
}
	
</script>

<script>
/*   $( function() {
    $( "#tabs" ).tabs();
  } ); */
  
$(document).ready(function(){
	$("#tabs-1").hide();
	$("#12").css("border-color", "rgb(223, 255, 140)");
});
  </script>
  <script>
  $(document).ready(function(){
	  $("#34").click(function() {
		 
		  $("#tabs-1").show();		// 비밀번호찾기 
		  $("#tabs-2").hide();		// 아이디찾기
	  
	  });
  });
  </script>
  <script>
  $(document).ready(function(){
	  $("#12").click(function() {
		  $("#tabs-1").hide();
		  $("#tabs-2").show();
	  });
  });
 </script>
 
 <!-- text박스 테두리 -->

 
 <script type="text/javascript">
 $(document).ready(function(){
	 $("#34").mouseover(function () {
			$(this).css("cursor", "pointer");	// 커서가 화살표 모양이 아닌 손가락 모양으로 바뀐다.
	});
	 $("#34").mousedown(function () {
			$(this).css("border-color", "rgb(223, 255, 140)");
			$("#12").css("border-color", "#e6e6e6");
	});
	 
	 
	 $("#12").mouseover(function () {
			$(this).css("cursor", "pointer");	// 커서가 화살표 모양이 아닌 손가락 모양으로 바뀐다.
			$(this).css("border-color", "rgb(223, 255, 140)");
			$("#34").css("border-color", "#e6e6e6");
		});
 });
 </script>
 
 
<script type="text/javascript">
function checkIt() {
	// abcde12ef34형태로 만들기
	
	// abcde
	var number1 = Math.floor(Math.random() * 10000) + 10000;
    if(number1>10000){
       number1 = number1 - 1000;
    }
    
    //12
    var number2 = Math.floor(Math.random() * 10) + 10;
    if(number2>100){
       number2 = number2 - 10;
    }
    
    //ef
    var number3 = Math.floor(Math.random() * 10) + 10;
    if(number3>100){
       number3 = number3 - 10;
    }
    //34
    var number4 = Math.floor(Math.random() * 10) + 10;
    if(number4>100){
       number4 = number4 - 10;
    }

    $("#pwcode1").val(number1);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
    $("#pwcode2").val(number2);
    $("#pwcode3").val(number3);
    $("#pwcode4").val(number4);
}
 </script>
 
</head>
<body>

<div id="tabs">
<!--   <ul>
    <li><a href="#tabs-2">아이디 찾기</a></li>
    <li><a href="#tabs-1">비밀번호 찾기</a></li>
  </ul> -->
<div align="center">

	<div class="findidtext">
		아이디 찾기
	</div>

	<div class="">
		<button id="12" class="idpwbtn" >개인회원</button>
	
		<button id="34" class="idpwbtn">사업자회원</button>
	</div>

  </div>
  
  
  <!-- 개인회원 -->
  <div id="tabs-2">
    <div class="section_login">
		<div class="section_login_email" align="center">
			<form action="/member/getFindID" name="userinput" method="post" onsubmit="return checkIt()">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>	
				<div class="textdiv">
					<span class="text">등록된 내 회원정보로 찾을 수 있습니다.</span>
				</div>
				
				<input type="text" class="inputtext_b_long12" name="useremail" size="29"  required placeholder="이메일"><br>
	
				<input type="password" class="inputtext_b_long12" name="userpw" size="29" required placeholder="비밀번호"><br>
				<br>
				<div class="findidbtn">
					<button type="submit" class="regibutton_long"><span>확인</span></button><br>
					<button type="button" class="regibutton_long" onclick="javascript:window.location.href='login'"><span >돌아가기</span></button>
				</div>		
			</form>
		</div>
	</div>
  </div>
  
  
  <!-- 사업자회원 상호명+사업자번호 -->
  <div id="tabs-1">
    <div class="section_login">
		<div class="section_login_email" align="center">
			<form action="/member/getFindID_seller" name="userinput" method="post" onsubmit="return checkIt()">			
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<div class="textdiv">
				<span class="text">가입 시 입력한 상호명, 사업자번호로 아이디를 찾을 수 있습니다.</span>
			</div>
				<div class="sendnum">
					<input type="text" class="inputtext_b_long" name="c_name" placeholder="상호명" required><br>
				</div>		
				
				<input type="text" name="crnum1" class="inputtext_s" id="_c_num1" minlength="3" maxlength="3" required placeholder="사업자번호">
				- <input type="text" name="crnum2" class="inputtext_s" id="_c_num2" minlength="2" maxlength="2" required>
				- <input type="text" name="crnum3" class="inputtext_s" id="_c_num3" minlength="5" maxlength="5" required>
				<br><br>
				
				<div class="findBtn">
					<button type="submit" class="regibutton_b_long"><span>확인</span></button><br>
					<button type="button" class="regibutton_b_long" onclick="javascript:window.location.href='login'"><span>돌아가기</span></button>
				</div>
				
			</form>
		</div>
	</div>
  </div>

</div>






</body>

<script type="text/javascript">
$("#_idbtn").click(function(){
	
	$.ajax({
		url:"/member/getIDCheck",
		type:"get",
		data:{id:$("#_userid").val()},
		success:function(msg){
 			alert("suc");
			if(msg == 'YES'){
	 			alert("확인");	// id있음	
	 		$("#to").focus();
	 			$("#IdText").val($("#_userid").val());
	 		
			}else{
	 		alert("없는 아이디입니다.");			// 없음
	 		$("#_userid").val("");
	 //		$("#_userid").val($("#_id").val());
	 		$("#_userid").focus();
 	// 		idcheck = true;
			}
		},
		error:function(request,status,error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);


		}
	});
	
});


</script>

<!-- 전화번호 인증 -->
<script>
var count = 0; /* 문자 중복을 막기 위한 인증번호 */

$(document).ready(function() {

   $("#send").click(function() {
      
	  /*  if($("#IdText").text() == "" || $("#IdText").text()==null){
		   alert("아이디 확인을 해주세요");
		   $("#_userid").focus();
	   }else{ */
		   
	       var number = Math.floor(Math.random() * 100000) + 100000;
	       if(number>100000){
	          number = number - 10000;
	       }
	
	       $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
	      
	       var to = $("#to").val();
	       var frontnum = $("#telSelect").val();
	       alert("frontnum:" + frontnum);
	       $("#frontto").val(frontnum+to);
	       alert($("#frontto").text(frontnum+to));
	       if(to == "" || to == null){
	           alert("번호를 입력해 주세요");
	           $("#to").focus();
	       }
	       else {

			   var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
			 
	           if(con_test == true){
	        	   
	               if(count < 3){      /* 추후 데이터베이스에 컬럼 값을 확인하여 count 값을 비교 할 예정 */
	            	   dd
	 
		              $.ajax({
		                  url:"sendSms.do",
		                  type:"get",
		                  data:{to: $("#frontto").val(),
		                       text: $("#text").val()
		                       },
		                success:function(){
		                  alert("해당 휴대폰으로 인증번호를 발송했습니다");
		                  count++;
		                  
		                  alert(count);
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
// 	   }
	})
   

   $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
      alert($("#text").val());
      var userNum = $("#userNum").val();
      
      var sysNum = $("#text").val();         
      
      if(userNum == null || userNum == ""){
         alert("휴대폰으로 발송된 인증번호를 입력해주세요");
      }
      else{
          
          if(userNum.trim() == sysNum.trim()){
             alert("성공");
             $("#textresult").val(sysNum);
          }
          else {
             alert("실패");
          }          
      }

   });
});

</script>

</html>