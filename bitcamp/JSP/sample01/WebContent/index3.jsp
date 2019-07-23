<%@page import="sample01.YouClass"%>
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
YouClass cls = new YouClass(3, "둘리");

//request.setAttribute("you", cls); // 짐 싸!!
//pageContext.forward("index4.jsp"); // 잘 가
// forward는 servlet에서 디스패처 소속이다



request.getSession().setAttribute("you", cls);
// session은 보낸다기보단 저장한다는 개념이 강하다 server의 저장역역에

// cookie는 접속한 사용자의 id를 저장한다 session은 접속한 사용자의 모든 정보를 저장한다

//request.getRequestDispatcher("index4.jsp").forward(request, response);
// 위의 코드와 같다

//HttpServletResponse
response.sendRedirect("index4.jsp");
// sendRedirect는 이동만한다
// 파라미터로 값을 보내면 getAttribute로는 못 받는다

%>



</body>
</html>