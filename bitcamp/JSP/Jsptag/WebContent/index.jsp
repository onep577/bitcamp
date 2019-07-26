<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- include -->
<h3>index.jsp start</h3>

<jsp:include page="NewFile.jsp" flush="false"></jsp:include>

<h3>index.jsp end</h3>
<br><br>

<!-- forward -->
<%-- <jsp:forward page="NewFile.jsp"></jsp:forward> --%>

<%
MemberDto mem = new MemberDto();
mem.setMessage("안녕하세요");
String msg = mem.getMessage();

request.setAttribute("mem", mem);
%>

mem:${mem.message }


<jsp:useBean id="_mem" class=dto.MemberDto></jsp:useBean>

<!-- preperty는 변수명이다  name은 인스턴스이다 -->
<!-- mem.setMessage이다 -->
<jsp:setProperty property="message" name="_mem" value="반갑습니다"/>

<jsp:getProperty property="message" name="_mem"/>

_mem:${_mem.message }


</body>
</html>