<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
int seq = Integer.parseInt(request.getParameter("seq"));

//하나의 데이터를 가져온다
PdsDao dao = PdsDao.getInstance();

PdsDto dto = dao.getOnePds(seq);

%>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h1>자료 상세정보</h1>

<div align="center">

<form id="frm" method="post" enctype="multipart/form-data">

<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>&nbsp;<%=dto.getId() %>
		<input type="hidden" name="id" value="<%=dto.getId() %>">
		<input type="hidden" name="seq" value="<%=dto.getSeq() %>">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" value="<%=dto.getTitle() %>">
	</td>
</tr>
 
<tr>
	<th>업로드된 파일</th>
	<td>&nbsp;<%=dto.getFilename() %>
		<input type="hidden" name="filename1" value="<%=dto.getFilename() %>">
	</td>
</tr>
 
<tr>
	<th>업로드할 파일</th>
	<td>
		<input type="file" name="filename2" value="<%=dto.getDowncount() %>">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"><%=dto.getContent() %></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="button" id="update" value="수정완료">
		<input type="button" id="goback" value="목록으로 돌아가기">
	</td>
</tr>

</table>
</form>
</div>



<script type="text/javascript">
$(document).ready(function () {
	$("#goback").click(function () {
		location.href="pdslist.jsp";
	});
	$("#update").click(function () {
		$("#frm").attr("action", "pdsupdateAf.jsp").submit();
	});
});
</script>



</body>
</html>