<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<%
class MyClass{
	public static String p1(){
		return "p1";
	}
}
%>

<p>-- 메소드를 사용하는 예 --</p>
<p id="<%=MyClass.p1() %>">빨간색 텍스트</p>
<p id="p2">파란색 텍스트</p>
<p id="p3">녹색 텍스트</p>

</body>
</html>