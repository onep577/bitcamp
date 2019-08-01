<%@page import="pds.PdsDao"%>
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
int seq = Integer.parseInt(request.getParameter("seq"));

PdsDao dao = PdsDao.getInstance();
boolean b = dao.deletePds(seq);

if(b){
	%>
	<script type="text/javascript">
	alert("삭제 성공");
	location.href="pdslist.jsp";
	</script>
	<%
}else{
	
}
%>

</body>
</html>