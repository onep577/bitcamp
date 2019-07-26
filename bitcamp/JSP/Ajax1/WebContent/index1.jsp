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

<p id="demo"></p>
<br>

<button type="button">click</button>

<script type="text/javascript">
$(function () {
	
	$("button").click(function () {
		
		$.ajax({
			// ------------------------------------------ 이동할 때 setting
			// key값 value값
			url: "data.jsp",				// 가야 할 곳 즉, 데이터나 정보를 가져오는 곳
			type: "get",					// get/post 방식을 정한다
			//data: "t1=ABC&t2=가나다",		// Parameter(넘겨주는 값)
			data: { t1:"bcd", t2:"나다라" },
			
			// 지금은 파일로 가지만 웹으로도 갈 수 있다 xml, json 다 가져올 수 있다
			// get, post방식은 생략 가능하다
			
			
			
			// ------------------------------------------
			success:function(data, status, xhr){
				// 갔다가 오는 게 성공했을 때 여기로 온다
				//alert("통신 성공");
				//alert( data );
				alert("status : " + status);  
				$("#demo").html( data );
			},
			error:function(xhr, status, error){
				alert("통신 실패");
			},
			complete:function(xhr, status){
				alert("통신 종료");
			}
			
			
			
		}); // ajax
		
	});
	
});
</script>

</body>
</html>