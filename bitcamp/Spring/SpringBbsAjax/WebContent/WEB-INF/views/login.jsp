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



<!-- <form action="bbsList.do" name="frm" onsubmit="return frmsubmit()"> -->
<form id="frm">
ID : <input type="text" name="id" id="id"><br>
PW : <input type="text" name="pwd" id="pwd"><br><br>
<input type="button" id="login" value="로그인">
<input type="button" id="account" value="회원가입">
</form>



<script type="text/javascript">
/*
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
/**/

/*
$("#login").click(function () {
	//location.href="bbsList.do";
	var id = $("#id").val().trim();
	var pwd = $("#pwd").val().trim();
	//alert(id + pwd);
	
	var mydata = {
			id: id,
			pwd: pwd
	};
	
	$.ajax({
		data: mydata,
		type: "get",
		url: "loginAf.do",
		
		success:function(data){
			//alert(data);
			
			if(data == "ok"){
				location.href="bbsList.do";
			}else if(data == "no"){
				$("#id").val("");
				$("#pwd").val("");
			}
		},
		error:function(error){
			alert("통신실패 : " + error);
		}
	});
});
/**/

$("#login").click(function () {
	var id = $("#id").val().trim();
	var pwd = $("#pwd").val().trim();
	alert(id + pwd);
	
	$("#frm").attr("action","loginAf.do").submit();
});

$("#account").click(function () {
	location.href="account.do";
});
	


</script>

</body>
</html>