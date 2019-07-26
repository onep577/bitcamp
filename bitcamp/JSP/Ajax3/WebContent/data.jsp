<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DB
String userName = "홍길동";
int userNumber = 1001;

String json = "{\"num\" : " + userNumber + 
	", " + "\"name\" : \"" + userName + "\"}";
	
System.out.println("json : " + json);

out.println("json : " + json);
// 다중 데이터를 가져올 때
%>

<%=json %>



