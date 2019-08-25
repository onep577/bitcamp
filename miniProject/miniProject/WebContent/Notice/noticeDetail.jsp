<%@page import="dto.NoticeDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지상세보기</title>

<style type="text/css">
main{
	width: 80%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
}
.allfont{
	font-family: 'Noto Sans KR', sans-serif;
	color: gray;
}
/* 
#btn{
	margin-top: 15px;
}
 */
 
.div_list{
	margin-top: 50px;
}

table.type02 {
	
	/* 
	border-collapse: separate;
	border-spacing: 0;
	text-align: left;
	line-height: 1.0;
	border-top: 1px solid #ccc;
	border-left: 1px solid #ccc;
	 */
	margin-top: 20px;
    border-collapse: collapse;
    font-family: 'Noto Sans KR', sans-serif;
	min-width: 90%;
}
table.type02 th {
	/* 
	width: 150px; 
	padding: 10px;
	font-weight: bold;
	vertical-align: middle;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	border-top: 1px solid #fff;
	border-left: 1px solid #fff;
	background: #eee;
	text-align: center;
	*/
	
	padding: 20px;
	background: #D6B78D;
	text-align: center;
	color: white;
	font-size: 1em;
	border-bottom: 1px solid #D6B78D;
}	
table.type02 td {
	/* width: 350px; 	
	padding: 10px;
	vertical-align: middle;
	border-right: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	 */   
	 
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #D6B78D;
}

#frm h2{
	padding : 20px;
	font-family: sans-serif;
} 
</style>
</head>
<body>

<jsp:include page="../header.jsp" flush="false"/>

<main>

<%
NoticeDto dto = (NoticeDto)request.getAttribute("dto");	
%>

<div align="center">

	<form name="frm" id="frm">
		<h2><%=dto.getTitle() %></h2>
		<table class="type02">
		<col width="150"> <col width="400"> <col width="150"> <col width="150">
		
		<tr>
			<th style="border-bottom: 1px solid #fff;">작성일</th>
			<td><%=dto.getWdate().substring(0, 11) %></td>
			<th style="border-bottom: 1px solid #fff;">조회수</th>
			<td><%=dto.getReadcount() %></td>			
		</tr>
		<tr>
			<th>첨부파일</th>
			<td>
				<%if(dto.getFilename().equals("-") ){
					%>
					<%=dto.getFilename() %>
					<%
				}else{
				%>
				<a href="/miniProject/notice_servlet?command=filedown&filename=<%=dto.getFilename() %>&seq=<%=dto.getSeq() %>"><%=dto.getFilename() %></a>	
				<%} %>			
			</td>
			<th>다운로드수</th>
			<td>
				<%=dto.getDowncount() %>
			</td>
		</tr>
		<tr>
			
			<td colspan="5" align="left">
			<div align="center" style="margin: 10px; width: 100%;">
				<img alt="" src="./noticefile/<%=dto.getFilename() %>" align="center" style="max-width: 550px;">
			</div><br>
			<textarea rows="40" cols="100" readonly="readonly" 
				style="border:0;overflow-y:hidden; background:clear; width: 100%; resize: none; outline: none;"><%=dto.getContent() %></textarea>
			</td>
		</tr>
		</table>
		
		<br>
		
		<button type="button" onclick="location.href='/miniProject/notice_servlet?command=notice'">목록으로</button>
		
	</form>
</div>

</main>	

<jsp:include page="../footer.jsp" flush="false"/>	

</body>
</html>