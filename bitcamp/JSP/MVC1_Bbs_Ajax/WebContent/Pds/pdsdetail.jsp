<%@page import="pds.PdsDto"%>
<%@page import="pds.PdsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
int seq = Integer.parseInt(request.getParameter("seq"));

// 하나의 데이터를 가져온다
PdsDao dao = PdsDao.getInstance();

PdsDto dto = dao.getOnePds(seq);
boolean b = dao.readcount(seq);

//System.out.println( dto.getSeq() + ", " + dto.getId() + ", " +  dto.getTitle() + ", " + dto.getContent() + ", " + dto.getReadcount()
//					+ ", " + dto.getDowncount() + ", " + dto.getFilename() + ", " + dto.getRegdate());

//System.out.println("조회수 : " + b);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h1>자료 상세정보</h1>

<div align="center">

<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">

<table border="1">
<col width="200"><col width="500">
<tr>
	<th>아이디</th>
	<td>&nbsp;<%=dto.getId() %>
		<input type="hidden" name="id" value="<%=dto.getId() %>">
	</td>
</tr>

<tr>
	<th>제목</th>
	<td>&nbsp;<%=dto.getTitle() %>
		<input type="hidden" name="title" value="<%=dto.getTitle() %>">
	</td>
</tr>
 
<tr>
	<th>업로드된 파일</th>
	<td>&nbsp;<%=dto.getFilename() %>
		<input type="hidden" name="filename" value="<%=dto.getFilename() %>">
	</td>
</tr>
 
<tr>
	<th>파일 다운로드수</th>
	<td>&nbsp;<%=dto.getDowncount() %>
		<input type="hidden" name="filename" value="<%=dto.getDowncount() %>">
	</td>
</tr>

<tr>
	<th>작성일</th>
	<td>&nbsp;<%=dto.getRegdate() %>
		<input type="hidden" name="filename" value="<%=dto.getRegdate() %>">
	</td>
</tr>

<tr>
	<th>조회수</th>
	<td>&nbsp;<%=dto.getReadcount() %>
		<input type="hidden" name="readcount" value="<%=dto.getReadcount() %>">
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content" readonly="readonly"><%=dto.getContent() %></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="button" id="update" value="수정">
		<input type="button" id="delete" value="삭제">
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
	
	$("#delete").click(function () {
		location.href="pdsdelete.jsp?seq=<%=seq %>";
	});
	
	$("#update").click(function () {
		location.href="pdsupdate.jsp?seq=<%=seq %>";
	});
});
</script>





</body>
</html>