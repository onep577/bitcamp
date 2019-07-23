<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
String str = "Hello World";
%>

<h2><%=str%></h2>

<%
out.println("<h2>" + str + "</h2>");
%>

<%
out.println(str);
%>

<!-- 서버 코드인 자바에서 클라이언트 코드인 자바 스크립트로 값을 넘겨줄 때는 쌍따옴표 기억하자
쌍따옴표 없으면 값이 안나온다 -->
<script type="text/javascript">
var v = "<%= str %>";
document.write( v );
</script>


</body>
</html>