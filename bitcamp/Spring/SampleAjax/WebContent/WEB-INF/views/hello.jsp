<%@page import="bit.com.a.model.MyClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h1>hello.jsp</h1>
<br><br><br><br>

<!-- 1.scriptlet -->
<%
MyClass cls = (MyClass)request.getAttribute("mycls");
%>
<h3>scriptlet</h3>
number:<%=cls.getNumber() %>
<br>
name:<%=cls.getName() %>
<br><br>



<!-- 1.EL tag -->
<h3>EL tag</h3>
number:${mycls.number }
<br>
name:${mycls.name }
<br><br>



<!-- 2 -->
<form action="inputData.do">
번호: <input type="text" name="number">
<br>
이름: <input type="text" name="name">
<br>
<input type="submit" value="전송">
</form>
<br><br>



<!-- 3 -->
<form action="move.do">
<input type="submit" value="move">
</form>



<!-- 4 -->
<form method="get">
아이디: <input type="text" id="checkid">
<br><br>
<button type="button" id="_check" onclick="idcheck()">id체크</button>
</form>



<script type="text/javascript">
function idcheck(){
	alert("idcheck");
	
	$.ajax({
		url:"idcheck.do",
		type:"get",
		data:"id="+$("#checkid").val(),
		success:function(data){
			//alert("success");
			alert(data);
		},
		error:function(req, status, error){
		// error:function(r, s, err) 로 줄이는 경우가 많다
			alert("error");
		}
	});
}
</script>
<br><br><br>


<!-- 5 -->
<form method="post">
이름: <input type="text" id="_name"><br>
전화: <input type="text" id="_phone"><br>
이메일: <input type="text" id="_email"><br>
생년월일: <input type="text" id="_birth"><br>
<button type="button" id="account">account</button>
</form>

<script type="text/javascript">
$(document).ready(function () {
	$("#account").click(function () {
		//alert("account");
		
		var mydata = {
				// key, value
				name:$("#_name").val(),
				tel:$("#_phone").val(),
				email:$("#_email").val(),
				birth:$("#_birth").val()
		};
		
		$.ajax({
			url:"account.do",
			data:mydata,
			type:'post',
			dataType:'json',			// 보내는 데이터는 json으로
			async:true,
			success:function(resp){
				//alert("success");		// 받는 데이터(Map)
				alert(resp.msg);
				alert(resp.data);
			},
			error:function(){
				alert("error");
			}			
		});
		
	});
});
</script>
<br><br><br>



<!-- 6 -->
이름: <input type="text" id="_name1"><br>
전화: <input type="text" id="_phone1"><br>
이메일: <input type="text" id="_email1"><br>
생년월일: <input type="text" id="_birth1"><br>
<button type="button" id="account1">account</button>

<script type="text/javascript">
$(function () {
	$("#account1").on("click", function () {
		alert("account1 click");
		
		var data = {};
		
		// key, value
		data["name"] = $("#_name1").val();
		data["tel"] = $("#_phone1").val();
		data["email"] = $("#_email1").val();
		
		var birth = $("#_birth1").val();
		// /-/g 는 2019-08-26 -> 20190826
		data["birth"] = birth.replace(/-/g, "");
		
		//alert(data["birth"]);
		//data:JSON.stringify() - json을 string으로 바꿔준다
		// parse를 쓰면 string을 json으로 바꿔준다
		
		$.ajax({
			contentType:'application/json',
			dataType:'json',
			url:'updateUser.do',
			type:'post',
			data:JSON.stringify(data),		// 보낸는 부분 -> Map
			
			success:function(resp){			// json
				alert("success");
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

