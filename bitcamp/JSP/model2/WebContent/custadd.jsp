<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="custusercontrol" method="post">
	<input type="hidden" name="command" value="insertAf">
	<!-- 파라미터로 넘어가는 것 -->
ID : <input type="text" name="id"><br>
이름 : <input type="text" name="name"><br>
주소 : <input type="text" name="addr"><br><br>
<input type="submit" value="추가">
</form>

</body>
</html>