<%@page import="main.MovieManager"%>
<%@page import="dto.MovieVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<MovieVo> list = MovieManager.getCGVdata();

for(int i = 0; i < list.size(); i++){
	System.out.println(list.get(i).toString());
}
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