<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public String setColorHTML(String str, String color){
	return "<font color='" + color + "'>" + str + "</font>";
}
%>
<%
String redText = setColorHTML("빨간 텍스트", "#ff0000");
String blueText = setColorHTML("파란 텍스트", "#00ff00");
String greenText = setColorHTML("초록 텍스트", "#0000ff");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#p1{
	color: red;
}
#p2{
	color: blue;
}
#p3{
	color: green;
}
</style>

</head>
<body>


<p>-- 메소드를 사용하는 예 --</p>
<%=redText %><br>
<%=blueText %><br>
<%=greenText %><br>

</body>
</html>