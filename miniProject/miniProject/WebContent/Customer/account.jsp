<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style type="text/css">

main{
	background-image: url("/miniProject/image/accountback.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	text-align: -webkit-center;
	width: 100%;
	height: -webkit-fill-available;
	position:relative;
}
#divid{
	width: 50%;
	height: 70%;
    position:absolute;
    margin: auto;
    left: 25%;
    top: 10%;
    background-color: rgba(255,255,255, 0.5);
}
.allfont{
  	font-family: 'Noto Sans KR', sans-serif;
  	color: gray;
}
*{
	font-family: 'Noto Sans KR', sans-serif;
}
table{
    width: 500px;
    height: 80%;
    margin: auto;
}

#pwd, #name, #birthday, #phone, #email,#accountbtn{
	width: 480px;
	height: 50px;
	border: 0px;
}
#id{
	width: 415px;
	height: 50px;
	border: 0px;
}
#address{
	width: 375px;
	height: 50px;
	border: 0px;
}
#idcheckbtn, #addressbtn{
	height: 50px;
	background-color: #585858;
	color: #ffffff;
}
#idcheckbtn:hover, #addressbtn:hover{
	background-color: #424242;
	color: #ffffff;
}
#accountbtn{
	background-color: #AD9E87;
	color: #ffffff;
}
#accountbtn:hover{
	background-color: #685F51;
	color: #ffffff;
}

</style>

</head>

<body>

<jsp:include page="../header.jsp" flush="false"/>

<main>

<div id="divid">
  <form action="" id="frm">
  	<input type="hidden" name="command" value="custaccount">
  	<table>
  		<tr>
  			<td colspan="2">
  				<h1 class="allfont">회원가입</h1>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" placeholder="id 입력" id="id" name="id" onkeydown="fn_press_han(this);" style="ime-mode:disabled;">
  				<button type="button" class="btn btn-default" id="idcheckbtn">id체크</button>
  				<input type="hidden" id="idsave" value="">
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<font color="red" id="idfont">7 ~ 20글자의 영문+숫자로 등록해주십시오</font>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="password" placeholder="비밀번호 입력" id="pwd" name="pwd">
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<font color="red" id="pwdfont">8~15자리의 특수,영문+숫자로 등록해주십시오( ~!@\#$%&lt;&gt;^&amp;* 만 지원합니다. )</font>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" placeholder="이름 입력" id="name" name="name">
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<span style="opacity: 0">공간지정</span>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" placeholder="주소입력" id="address" name="address" maxlength="20">
  				<button type="button" class="btn btn-default" id="addressbtn" onclick="sample6_execDaumPostcode()">우편번호찾기</button>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<span style="opacity: 0">공간지정</span>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" placeholder="생년월일(예 : 19920305)" id="birthday" name="birthday" maxlength="8"
  				 onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;">
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<span style="opacity: 0">공간지정</span>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" placeholder="전화번호(예 : 01012345678)" id="phone" name="phone" maxlength="11"
  				 onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_han(this);" style="ime-mode:disabled;">
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<span style="opacity: 0">공간지정</span>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="text" placeholder="이메일(예 : abc@naver.com)" id="email" name="email" onkeydown="fn_press_han(this);" style="ime-mode:disabled;">
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<span style="opacity: 0">공간지정</span>
  			</td>
  		</tr>
  		<tr>
  			<td>
  				<input type="button" value="회원가입하기" class="btn btn-default" id="accountbtn">
  			</td>
  		</tr>
  	</table>
   </form>
  </div>

</main>

<jsp:include page="../footer.jsp" flush="false"/>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>


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
	                    //document.getElementById("sample6_extraAddress").value = extraAddr;
	                
	                } else {
	                    //document.getElementById("sample6_extraAddress").value = '';
	                }
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                //document.getElementById('sample6_postcode').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address").focus();
	            }
	        }).open();
	    }
	
	</script>

<script type="text/javascript">

var check = false;	// 아이디체크용

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

$(function () {
	
	$("#id").on("propertychange change keyup paste input", function() {
				
		var id = $("#id").val().trim();
		
		if( id.length >= 7 && id.length <= 20 && pattern1.test( id ) && pattern2.test( id ) && !pattern3.test( id ) ){
			$("#idfont").css("color", "rgba(255,255,255, 0)" );
		}else {
			$("#idfont").css("color", "rgba(255,0,0, 1)" );
		}
				
	});
	
	$("#pwd").on("propertychange change keyup paste input", function() {
		
		var pwd = $("#pwd").val().trim();
		
		if( pwd.length >= 8 && pwd.length <= 15 && pattern1.test( pwd ) && pattern2.test( pwd ) && pattern3.test( pwd ) ){
			$("#pwdfont").css("color", "rgba(255,255,255, 0)" );
		}else {
			$("#pwdfont").css("color", "rgba(255,0,0, 1)" );
		}
				
	});
	
	$("#accountbtn").click(function () {
		
        var pw = $("#pwd").val().trim();
        
		if(check == false){
			
			alert("id 체크를 하세요");
			
		}else if(!pattern1.test(pw) ||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>15){

            alert("비밀번호는 영문+숫자+특수기호 8~15자리로 구성하여야 합니다.");
            
        }else if($("#name").val().trim() == ""){
			
			alert("이름을 입력하세요");
			
		}else if($("#address").val().trim() == ""){
			
			alert("주소를 입력하세요");
			
		}else if($("#birthday").val().trim().length != 8){
			
			alert("생일을 입력하세요");
			
		}else if($("#phone").val().trim().length != 11){
			
			alert("전화번호를 입력하세요");
			
		}else if($("#email").val().trim().indexOf("@") == -1){
			
			alert("이메일 형식으로 입력해주세요");
			
		}else{
			
			if(confirm("입력하신 " + $("#idsave").val() + " 로 가입하게 됩니다 가입하시겠습니까?") == true){
				
				$("#id").val( $("#idsave").val() )
				
				$("#frm").attr({"action":"customer_servlet", "method":"post"}).submit();
		    }
		    else{
		        return ;
		    }
			
		}
	});
	
	
	$("#idcheckbtn").click(function () {
		//alert($("#id").val().trim().length);
		
		 if($("#id").val().trim().length < 7 || !pattern1.test($("#id").val().trim())){
			
			alert("id의 길이와 형식을 맞춰서 입력해주세요");
			
		}else{  
			$.ajax({
				//이동할때 필요한것
				url: "customer_servlet",		//가야할곳
				type: "get",			//get/post
				data: "command=idcheck&id=" + $("#id").val().trim(),//Parameter(넘겨주는 값)
				////////////////////////////////////////////////////
				
				//통신후 결과
				success:function(data, status, xhr){
					//alert(data);
					//$("#idcheckout").text(data.trim());
					
					if(data == "true"){
						check = true;
						alert("이 아이디는 사용가능합니다");
						
						$("#idsave").val( $("#id").val().trim() );
						
						//alert( $("#idsave").val() );
					}else{
						check = false;
						alert("다른아이디를 사용하여 주십시오");
					}
					 
				},
				error:function(xhr, status, error){
					alert("통신실패");
				}
			});
		} 
		
	});
	
});

</script>



</body>
</html>