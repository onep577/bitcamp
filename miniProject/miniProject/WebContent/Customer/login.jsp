<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>


<style type="text/css">

main{
	background-image: url("/miniProject/image/loginback.jpg");
	background-size: cover;
	background-repeat: no-repeat;
	text-align: -webkit-center;
	width: 100%;
	height: -webkit-fill-available;
	position:relative;
}
#divid{
	width: 40%;
	height: 60%;
    position:absolute;
    top: 10%;
	left:30%;
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
    width: 80%;
    height: 80%;
}
tr, td, th{
	/* border: 1px solid; */
}
td{
	width: 256px;
}
#loginbtn{
	width: 100%;
	height: 50px;
	border: 0px;
}
#id, #pwd{
	width: 100%;
	height: 50px;
	border: 0px;
	padding-left: 15px;
}
#pwdfindbtn{
	width: 99%;
	height: 50px;
	border: 0px;
	margin-right: 1%;
}
#accountbtn{
	width: 99%;
	height: 50px;
	margin-left: 1%;
}
#accountbtn, #pwdfindbtn{
	background-color: #585858;
	color: #ffffff;
}
#accountbtn:hover, #pwdfindbtn:hover{
	background-color: #424242;
	color: #ffffff;
}
#loginbtn{
	background-color: #AD9E87;
	color: #ffffff;
}
#loginbtn:hover{
	background-color: #685F51;
	color: #ffffff;
}
.login_a{
	margin-right: 0px;
}
</style>

</head>

<body>

<% 
String message = (String)request.getAttribute("message");
if(message != null){
%>
	<script>
	alert("<%=message%>");
	</script>
<%
}
%>

<jsp:include page="../header.jsp" flush="false"/>

<main>
	
	<div id="divid">
	<br><br>
	<img id="logoimg" src="/miniProject/image/login_logo.png" style=" width: 603px; height: 161px;">
	<br><br><br><br>
	  <form action="" id="frm">
	  	<input type="hidden" name="command" value="login">
	  	<table>
	  		<tr>
	  			<td colspan="2">
	  				<input type="text" placeholder="id 입력" id="id" name="id">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td colspan="2">
	  				<span style="opacity: 0">공간 맞추기</span>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td colspan="2">
	  				<input type="password" placeholder="비밀번호 입력" id="pwd" name="pwd">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td colspan="2">
	  				<input type="checkbox" name="idcheck" id="chk_save_id"><span style="font-weight: bold;">Remember ME</span>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td colspan="2">
	  				<input type="button" value="로그인" class="btn btn-default" id="loginbtn">
	  			</td>
	  		</tr>
	  		<tr>
	  			<td colspan="2">
	  				<span style="opacity: 0">공간 맞추기</span>
	  			</td>
	  		</tr>
	  		<tr>
	  			<td>
	  				<a href="/miniProject/customer_servlet?command=pwdfind" class="login_a"><input type="button" value="비밀번호 찾기" class="btn btn-dark" id="pwdfindbtn"></a>
	  			</td>
	  			<td>
	  				 <a href="/miniProject/customer_servlet?command=account" class="login_a"><button type="button" class="btn btn-dark" id="accountbtn">회원가입</button></a>
	  			</td>
	  		</tr>
	  	</table>
	   </form>
	  </div>
	  
</main>	  
	
<jsp:include page="../footer.jsp" flush="false"/>


<script type="text/javascript">


$(document).ready(function() {

	
	$("#loginbtn").click(function() { // 로그인 버튼 누를때
		 
		if( $("#id").val().trim() == "" ){
			alert("id를 입력해주십시오");
			$("#id").focus();
		}
		else if( $("#pwd").val().trim() == "" ){
			alert("password를 입력해주십시오");
			$("#pwd").focus();
		}
		else{
			$("#frm").attr({"action":"/miniProject/customer_servlet", "method":"post"}).submit();
		}
		
	});
	 
	var user_id = $.cookie("user_id");
	
	if( user_id != null){ // 지정한 쿠키가 있을때
		//alert("쿠키 있음");	
		$("#id").val( user_id );
		$("#chk_save_id").attr("checked", "checked");
	}

	$("#chk_save_id").click(function() {
		if( $("#chk_save_id").is(":checked") ){ // 체크되었을떄
			//alert("체크됌");
			if($("#id").val().trim() == ""){
				alert("id를 입력해주십시오");
				$("#chk_save_id").prop("checked", false);
			}else{ //정상기입 한경우
				$.cookie("user_id", $("#id").val().trim(), {expires:7, path:'/'}); // 쿠키를 사용하고 7일간 저장 (expires:저장기간 path:모든경로 ?)
			}
		}else{ // 체크 해제되었을때
			//alert("체크 없어짐");
			$.removeCookie("user_id", {path:'/'}); // 기한을 없애면서 삭제가 된다.
		}
		
	}); 
});

</script>



</body>
</html>