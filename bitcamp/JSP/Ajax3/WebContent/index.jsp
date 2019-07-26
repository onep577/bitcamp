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

<!-- 로그인 화면에서 id 있는지 체크할 때, 게시판 답글에서 Ajax쓴다 -->

<script type="text/javascript">
$(function () {
	$("button").click(function () {
		
		$.ajax({
			type: "get",
			url: "data.jsp",
			datatype: "json",
			
			success: function(obj){
				//alert("success");
				//alert( obj );
				// obj는 String으로 왔다 그래서 json으로 바꿔줘야 한다 parse
				
				var data = JSON.parse(obj); // String -> json
				//alert( data.num );
				
				var str = JSON.stringify(data); // json -> String
				alert( str.num );
			},
			error: function(){
				//alert("error");
			}
			
		});
		
	});
});
</script>

</body>
</html>