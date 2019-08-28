<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<c:if test="${not empty login }">
${login.id }님 안녕하세요

<table border="1" style="background-color: purple;">
<col width="200">
<tr>
	<td>
		<a href="bbsList.do">글목록</a>
	</td>
</tr>
<tr>
	<td>
		<a href="bbsList.do">글쓰기</a>
	</td>
</tr>
</table>
</c:if>



<c:if test="${empty login }">

<form action="loginAf.do" method="post">
<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" size="20">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="log-in">
	</td>
</tr>
</table>

<a href="account.do">회원가입</a>

</form>
</c:if>
