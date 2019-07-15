<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
// scriptlet = script + applet
// Java 영역
System.out.println("----------NewFile.jsp로 이동");
// request(요청)
// response(응답)
// 웹과 자바가 통신한다 파라메터 안의 id와 pwd는 input의 name 어트리뷰트이다
// url에서 getParameter로 가져온다 웹상의 파라미터가 url이다
String id = request.getParameter("id");
System.out.println("id = " + id);
String pwd = request.getParameter("pwd");
System.out.println("pwd = " + pwd);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



</body>
</html>