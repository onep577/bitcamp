<%@page import="dao.CoffeeDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

CoffeeDao dao = CoffeeDao.getInstance();
boolean b = dao.getUserId(id);

String msg = null;
if(b){
	msg = "사용 불가능합니다";
}else{
	msg = "사용 가능합니다";
}

out.println(msg);
%>