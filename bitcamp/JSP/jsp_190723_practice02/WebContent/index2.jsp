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
int i;
// request.getSession().getAttribute("count") != null 도 꼭 기억하다
if(session.getAttribute("count") != null){
	i = (Integer)session.getAttribute("count");
}else{
	i = 0;
}

i++;

%>

<h3>JSP 실습</h3>
<h3><input type="text" value="<%=i %>" size="10">번째 방문입니다</h3>

<%
session.setAttribute("count", new Integer(i) );

// session.invalidate(); // session 해방시키는 것
%>

</body>
</html>