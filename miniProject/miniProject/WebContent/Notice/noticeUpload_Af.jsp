<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>
</head>
<body>
<%
boolean isS = (boolean)request.getAttribute("isS");


if(isS){
	%>
	<script type="text/javascript">
		alert("공지 업로드 완료");
		location.href = "/miniProject/notice_servlet?command=notice_adm";
	</script>
	<%
}else{
%>	<script type="text/javascript">
		alert("공지 업로드 실패");
		location.href = "/miniProject/notice_servlet?command=notice_adm";
	</script>
<%
}
%>
</body>
</html>