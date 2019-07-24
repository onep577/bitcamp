<%@page import="dto.Member"%>
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
Member mem  = (Member)request.getAttribute("info");

/*
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String[] hobby = request.getParameterValues("hobby");
String age = request.getParameter("age");
String etc = request.getParameter("etc");
*/
%>


아이디 : <input type="text" value="<%=mem.getId() %>"><br>
패스워드 : <%=mem.getPwd() %><br>
<%for(int i = 0; i < mem.getHobby().length; i++){ %>
취미 : <%=mem.getHobby()[i] %><br>
<%} %>
나이 : <%=mem.getAge() %><br>
상세내역 : <%=mem.getEtc() %><br>


<%-- 
아이디 : <%=id %><br>
패스워드 : <%=pwd %><br>
<%for(int i = 0; i < hobby.length; i++){ %>
취미 : <%=hobby[i] %><br>
<%} %>
나이 : <%=age %><br>
상세내역 : <%=etc %><br>
 --%>
</body>
</html>