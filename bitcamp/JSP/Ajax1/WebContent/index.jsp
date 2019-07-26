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

<%--
	Ajax : Asynchronous Javascript And Xml
			비동기 통신
	Ajax 목적 : 현재를 비동기 형식으로 유지하면서 데이터를 가져온다
			
	JQuery 소속
	
	synchronous:	form.jsp -> XXXaf(경로, DB) -> list.jsp
	Ajax:			form.jsp <- DB, Data
	
--%>

<p id="demo"></p>
<br>

<button type="button">click</button>

<script type="text/javascript">
$(function () {
	
	$("button").on("click", function() {
		// document를 읽은 다음 또 읽을 수 있다
	
	//$("button").click(function () {
		/*
		//$("#demo").load("data.html");
		$("#demo").load("data.html #data2");
		// 사실 parsing에 들어간다. 자기자신은 가만히 있으면서 데이터를 가져왔다
		/**/
		
		//$("#demo").load("data.jsp", "t1=abc&t2=가나다");
		// data.jsp의 파라미터가 t1, t2이다
		
		//$("#demo").load("data.jsp", { t1:"bcd", t2:"나다라" });
		// 데이터를 json 형식으로 넘겨도 잘 넘어간다
		
		$("#demo").load("data.jsp", function (data, status, xhr) {
			// data : 데이터, status : 현재상태, xhr : object
		
			// load는 읽어 온다 가는 게 아니다
			$("#demo").append("<br>");
			$("#demo").append("data = " + data + "<br>");
			$("#demo").append("data = " + status + "<br>");
			$("#demo").append("data = " + xhr + "<br>");
			
		});
		
	});
	
});
</script>


















</body>
</html>