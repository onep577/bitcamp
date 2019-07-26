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
String id = request.getParameter("id");
String user_id = "abc";

String msg = null;
if( user_id.equals(id) ){
	msg = "사용중인 id가 있습니다";
}else{
	msg = "사용중인 id가 없습니다";
}

out.println(msg);
%>

</body>
</html>