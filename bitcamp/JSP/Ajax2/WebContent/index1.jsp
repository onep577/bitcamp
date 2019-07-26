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
var target = []; // java script의 배열이다
var link = [];
var aname = [];

$(function () {
	
	$("button").click(function () {
		
		$.ajax({
			url: "data.xml",
			datatype: 'xml',
			// get,post를 빼면 get으로 들어간다
			
			success:function( data ){
				//alert("success");
				var _xml = $(data).find("xmldata");
				// root태그이다
				var len = _xml.find("news").length;
				//alert("len : " + len); // 3
				
				for(i = 0; i < len; i++){
					target[i] = _xml.find("news").eq(i).find("target").text();
					link[i] = _xml.find("news").eq(i).find("link").text();
					aname[i] = _xml.find("news").eq(i).find("name").text();
					
					$("#demo").append(target[i]).append(link[i]).append(aname[i] + "br");
				}
			},
			error:function(){
				alert("error");
			}
			
		});
		
	});
	
});
</script>

</body>
</html>