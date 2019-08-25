<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>


<style type="text/css">

main{
	background-image: url("/miniProject/image/travel5.png");
	background-size: cover;
	background-repeat: no-repeat;
	text-align: -webkit-center;
	width: 100%;
	height: -webkit-fill-available;
	position:relative;
}
#divid{
	width: 40%;
	height: 55%;
    position:absolute;
    margin: auto;
    left: 30%;
    top: 10%;
    background-color: rgba(255,255,255, 0.5);
    padding-left: 5%;
}
.allfont{
  	font-family: 'Noto Sans KR', sans-serif;
  	color: gray;
}
table{
    width: 70%;
    margin: auto;
    margin-top: 3%;
    /* height: 200px; */
    /* border: 1px solid; */
}

#id, #email{
	width: 60%;
	height: 50px;
	margin-bottom: 30px;
	padding-left: 15px;
}
#pwdbtn{
	width: 60%;
	height: 50px;
	margin-top: 7px;
}
#pwd{
	width: 60%;
	height: 50px;
	padding-left: 15px;
	margin-bottom: 7px;
}
#cernum{
	width: 60%;
	height: 50px;
	padding-left: 15px;
	margin-bottom: 30px;
}
#cernumbtn{
	width: 27%;
	height: 50px;
}

</style>

</head>

<body>

<jsp:include page="../header.jsp" flush="false"/>

<main>



	  		
	  		
<div id="divid">
	<form action="" id="frm">
	<input type="hidden" name="command" value="pwdchange">
  	<table>
  		<tr>
	  			<td>
	  				<h1 class="allfont">비밀번호찾기</h1>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<input type="text" placeholder="id 입력" id="id" name="id">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<!-- <input type="text" placeholder="전화번호(예 : 01012345678)" id="phone" name="phone" maxlength="11"
  				 onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;"> -->
  				 <input type="text" placeholder="이메일(예 : abc@naver.com)" id="email" name="email" onkeydown="fn_press_han(this);" style="ime-mode:disabled;">
  				 <input type="button" value="인증번호 전송" class="btn btn-default" id="cernumbtn">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<input type="text" placeholder="인증번호" id="cernum" name="cernum">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<input type="password" placeholder="바꾸실비밀번호" id="pwd" name="pwd">
	  			</td>
  			</tr>
  			<tr>
	  			<td>
	  				<font color="red">8~15자리의 특수,영문+숫자로 등록해주십시오<br>
	  				( ~!@\#$%&lt;&gt;^&amp;* 만 지원합니다. )</font>
	  			</td>
  			</tr>
	  		<tr>
	  			<td>
	  				<input type="button" value="비밀번호 바꾸기" class="btn btn-default" id="pwdbtn">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<h4 id="number"></h4>
	  			</td>
	  		</tr>
  	</table>
   </form>
  </div>


</main>
 
<jsp:include page="../footer.jsp" flush="false"/>


<script type="text/javascript">

var cer = false; // 인증을 했는지 안했는지 변수

var pattern1 = /[0-9]/;	//숫자패턴용

var pattern2 = /[a-zA-Z]/; // 영어패턴용

var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거

/*숫자만 입력하게함*/
function fn_press(event, type) {
	if(type == 'numbers'){
		if((event.keyCode < 48) || (event.keyCode > 57)){
			return false;
		}
	}
}

/* 한글입력방지 */
function fn_press_han(obj) {
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 ||
			event.keyCode == 39 || event.keyCode == 46){
		return;
	}
	obj.value = obj.value.replace(/[\ㄱ-ㅎ ㅏ-ㅣ 가-힣]/g, "");
}

function randomRange() { // 인증번호 생성
	  return Math.floor( (Math.random() * (9999 - 1000 + 1)) + 1000 );
}

var number = randomRange()+"";

$(document).ready(function() {
	
	
	
	$("#cernumbtn").click(function() {
		
		if($("#id").val().trim() == ""){
			
			alert("ID를 입력하세요");
			
		}else if($("#email").val().trim().indexOf("@") == -1){
			
			alert("이메일을 입력하세요");
			
		}else{
			
			number = randomRange()+"";
			
			$.ajax({
				//이동할때 필요한것
				url: "customer_servlet",		//가야할곳
				type: "get",			//get/post
				data: "command=idandemail&id=" + $("#id").val().trim() + "&email=" + $("#email").val().trim() + "&cernumber=" + number,//Parameter(넘겨주는 값)
				////////////////////////////////////////////////////
				
				//통신후 결과
				success:function(data, status, xhr){
					//alert(data);
					//$("#idcheckout").text(data.trim());
					
					if(data == "true"){
						
						cer = true;
						alert("해당 이메일로 발송하였습니다 확인후 인증번호를 입력하여 주세요");
						//$("#number").text(number);
						
					}else{
						check = false;
						alert("아이디와이메일이 일치하는 아이디가 없습니다.");
					}
					 
				},
				error:function(xhr, status, error){
					alert("통신실패");
				}
			});
			
		}
		
		
		
	});
	
	$("#pwdbtn").click(function() {
		
		var cernum = $("#cernum").val().trim();
		
		var pw = $("#pwd").val().trim();
		
		if(cer == false){
			alert("인증을 먼저 받아주세요");
		}
		else if(number.trim() != cernum){
			alert("인증번호를 정확히 입력하여 주세요");
		}		 
		else if(!pattern1.test(pw) ||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>15){

            alert("비밀번호는 영문+숫자+특수기호 8~15자리로 구성하여야 합니다.");
            
        }
		else{
			
			$("#frm").attr({"action":"customer_servlet", "method":"post"}).submit();
			
		}
		
	});
	 
	
});

</script>



</body>
</html>