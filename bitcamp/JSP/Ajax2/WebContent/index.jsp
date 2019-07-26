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
	
	$("button").click(function() {
		//alert("클릭");
		
		$.ajax({
			type: 'get',
			url: './data.json',
			// 현재 경로의 data.json, 넘겨주는 건 없고 받아오기만 한다
			datatype: 'json',
			
			success: function( json ){
				//alert("sucees");
				//alert(json[0].name + " " + json[0].age);
				/*
				for(i = 0; i < json.length; i++){
					$("#demo").append(json[i].name + " " );
					$("#demo").append(json[i].age + " " );
					$("#demo").append(json[i].address + " " );
					$("#demo").append(json[i].phone + "<br>" );
				}
				/**/
				
				// item은 하나 하나
				$.each(json, function (index, item) {
					$("#demo").append(index + " ");
					$("#demo").append(item.name + " " );
					$("#demo").append(item.age + " " );
					$("#demo").append(item.address + " " );
					$("#demo").append(item.phone + "<br>" );
				});
				/**/
			},
			error: function( json ){
				//alert("error");
			}
		}); // ajax
		
	});
	
});
</script>


















</body>
</html>