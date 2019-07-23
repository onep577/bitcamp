<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// 내장객체 : 동적할당을 하지 않고 사용할 수 있는 class
// Servlet : request의 원본이름 - HttpServletRequest
// Scriptlet : request
// 내장객체 중에 request를 제일 많이 사용한다
// 내장 객체를 scriptlet에서 사용하려면 이렇게 쓴다

String name = request.getParameter("name");
out.println("name = " + name);

String age = request.getParameter("age");
out.println("age = " + age);

// checkbox, select(multi)
String hobby[] = request.getParameterValues("hobby");
if(hobby != null && hobby.length > 0){
	for(int i = 0; i < hobby.length; i++){
		out.println("hobby = " + hobby[i] + "<br>");
	}
}

%>

</body>
</html>