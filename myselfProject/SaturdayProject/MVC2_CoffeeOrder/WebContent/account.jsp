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
String id = request.getParameter("id");
%>

<form action="coffee" name="frm" method="post" onsubmit="return frmsubmit()">
<input type="hidden" name="command" value="accountAf">
ID : <input type="text" name="id" id="a_id">
<input type="button" id="checkid" value="id중복확인"><br>
<p></p>
PW : <input type="text" name="password" id="a_pw"><br>
Name : <input type="text" name="name" id="a_name"><br>
Email : <input type="text" name="email" id="a_email"><br>

<input type="submit" id="account" value="회원가입 완료">
</form>

<script type="text/javascript">
$("p").hide();

function frmsubmit(){
	// 입력 안된 정보가 있을 때 submit을 막아준다
	
	//alert( $("#a_id").val().trim() );
	if( $("#a_id").val().trim() == "" || $("#a_pw").val().trim() == ""
			|| $("#a_name").val().trim() == "" || $("#a_email").val().trim() == "" ){
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
	if( $("#a_id").val().trim() == "" ){
		alert("아이디를 입력해주세요");
		return;
	}else{
		//alert( $("#a_id").val().trim() );
	}
	
	$.ajax({
		url: "checkId.jsp",
		data: "id="+$("#a_id").val().trim(),
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
				$("#a_id").focus();
				$("#a_id").val("");
			}else {
				$("p").css("color", "blue");
				$("#a_pw").focus();
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