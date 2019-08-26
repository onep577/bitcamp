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

<%
//String id = request.getParameter("id");
%>

<form action="accountAf.do" name="frm" onsubmit="return frmsubmit()" method="POST">
ID : <input type="text" name="id" id="id">
<input type="button" id="checkid" value="id중복확인"><br>
<p></p>
PW : <input type="text" name="pwd" id="pwd"><br>
Name : <input type="text" name="name" id="name"><br>
Email : <input type="text" name="email" id="email"><br>

<!-- <input type="submit" id="account" value="회원가입 완료"> -->
<input type="submit" value="회원가입 완료">
</form>

<script type="text/javascript">
$("p").hide();

function frmsubmit(){
	// 입력 안된 정보가 있을 때 submit을 막아준다
	
	//alert( $("#id").val().trim() );
	if( $("#id").val().trim() == "" || $("#pwd").val().trim() == ""
			|| $("#name").val().trim() == "" || $("#email").val().trim() == "" ){
		alert("모두 기입해주세요");
		return false;
	}
	
	if($("p").html() == "사용 불가능합니다"){
		alert("id 중복확인을 해주세요");
		// 텍스트필드의 값을 초기화해서 필요없다
		return false;
	}else if($("p").html() == "사용 가능합니다"){
		return true;
	}
	
}

$("#checkid").click(function () {
	var id = $("#id").val().trim();
	alert(id);
	
	if( id == "" ){
		alert("아이디를 입력해주세요");
		return;
	}
	
	$.ajax({
		url: "idCheck.do",
		data: id,
		datatype: "text",
		type: "get",
		
		success: function( msg ) {
			alert(msg);
			$("p").show();
			$("p").css({"color":"red", 
						"font-size":"12px"});  
			$("p").html( msg.trim() );			
			
			if( msg.trim() == "사용 불가능합니다" ){
				$("p").css("color", "red");
				$("#id").focus();
				$("#id").val("");
			}else {
				$("p").css("color", "blue");
				$("#pwd").focus();
			}	
			/**/
		},
		error: function (){
			alert("통신 실패");
		}
	});
	
});

</script>

</body>
</html>