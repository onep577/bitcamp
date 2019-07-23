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
<form id="frm">
이름 : <input type="text" id="_name" name="name"><br>
생년월일 : <input type="text" id="_birth" name="birth"><br>
<input type="button" id="btn" value="OK">
</form>

<script type="text/javascript">
$("#btn").click(function () {
	//location.href = "index4.jsp?name=" + $("#_name").val()
	//+ "&birth=" + $("#_birth").val();
	$("#frm").attr("action", "index4.jsp").submit();
});


</script>

</body>
</html>