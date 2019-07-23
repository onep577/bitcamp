<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%!
int num1 = 0;
%>

<%
num1++;
%>

<table border="1">
<%for(int i = 0; i < num1; i++){
%>
<tr>
	<%for(int j = 0; j < num1; j++){
		int result = i * j;
	%>
	<td>
		<%=i %> * <%=j %> = <%=result %>
	</td>
	<%} %>
</tr>
<%} %>
</table>


</body>
</html>