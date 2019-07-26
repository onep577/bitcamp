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

ID : <input type="text" id="idText">
<button type="button">click</button>

<p id="demo"></p>
<br>

<script type="text/javascript">
$(function () {
	$("button").click(function () {
		var u_id = $("#idText").val();
		//alert( user_id );
		
		$.ajax({
			url: "idCheck.jsp",
			type: "get",
			datatype: "text",
			data: "id="+u_id,
			
			success: function( msg ){
				//alert("통신 성공");
				alert(msg);
				$("p").html(msg.trim());
				// trim() 중요하다 꼭 기억하자
			},
			error: function(){
				alert("통신 실패");
			},
			complete:function(){
				//alert("통신 종료");
			}
		});
		
	});	
});
</script>

</body>
</html>