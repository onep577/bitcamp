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

<p>-- 입력 페이지 --</p>
이름 : <input type="text" id="name"><br>
생년월일 : <input type="text" id="birth"><br>
<input type="button" id="btn" value="OK">


<script type="text/javascript">
$("#btn").click(function () {
	location.href = "index4.jsp?name=" + $("#name").val()
	+ "&birth=" + $("#birth").val();
});

</script>

</body>
</html>