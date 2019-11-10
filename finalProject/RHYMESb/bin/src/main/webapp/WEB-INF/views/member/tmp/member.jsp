<%@page import="java.util.Iterator"%>
<%@page import="java.util.Collection"%>
<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="java.util.Enumeration"%>
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
	Object prc = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	UserDetails ud = (UserDetails)prc;
	
	out.println( ud.getUsername() + "<br>");
	out.println( ud.getPassword() + "<br>");
	Collection c = ud.getAuthorities();
	Iterator it = c.iterator();
	while( it.hasNext() ){
		String s = it.next() + "";
		out.println( s + "<br>" );
	}

	out.println("<br><br>**********************************************<br><br>");
	

	Enumeration enum1 = request.getSession().getAttributeNames();
	
	while( enum1.hasMoreElements() ){
		out.println(enum1.nextElement() + "");
	}
	
	out.println("<br><br>**********************************************<br><br>");
	
	Enumeration enum2 = request.getAttributeNames();
	
	while( enum2.hasMoreElements() ){
		out.println(enum2.nextElement() + "<br><br>");
	}
%>
For member
<a href="/member/admin">admin!</a>
<form action="/logout" method='post'>
<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
<input type="submit" value="로그아웃">
</body>
</html>