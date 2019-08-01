<%@page import="java.util.Date"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto user = (MemberDto)session.getAttribute("login");

/*
// 시간을 취득
String fname = (new Date().getTime() + "");
System.out.println("fname : " + fname);
/**/
/*
시간이 흐를때마다 달라진다 즉, 충돌 될 수 없다 seq보다 더 정확할 수 있다
이름만 바뀐 후 업로드 되어있다가 다운로드 하면 원래 이름으로

누군가가 mydata.txt를 저장 -> 1564623577444.txt로 저장
1564623577444.txt -> 다운로드 끝-> mydata.txt
*/

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	주의사항 : 같은 파일명이 업로드 될 수 있다.
				주로 사용되는 방법은 Date().getTime()
				한글명은 사용하지 말것. (DB에 올리는 것은 괜찮지만 폴더에는 안된다)
--%>

<h1>자료 올리기</h1>

<div align="center">

<%--
	id, title, content -> String으로 되어있다
	file -> byte로 되어있다
	두가지 방식을 다 전송하기 위해서 필요한것이 multipart이다
--%>

<form action="pdsupload.jsp" method="post" enctype="multipart/form-data">
<!-- get방식은 동작 안된다 무조건 post로 해야한다 -->
<!-- enctype는 인코딩타입이다 -->

<table border="1">
<col width="200"><col width="500">

<tr>
	<th>아이디</th>
	<td><%=user.getId() %>
		<input type="hidden" name="id" value="<%=user.getId() %>">
	</td>
</tr>
<tr>
	<th>제목</th>
	<td>
		<input type="text" name="title" size="50">
	</td>
</tr>

<tr>
	<th>파일 업로드</th>
	<td>
		<input type="file" name="fileload" style="width: 400px">
		<!-- text로 넘긴거는 String으로 받고 file로 넘긴거는 byte로 받는다 -->
	</td>
</tr>

<tr>
	<th>내용</th>
	<td>
		<textarea rows="20" cols="50" name="content"></textarea>
	</td>
</tr>

<tr align="center">
	<td colspan="2">
		<input type="submit" value="자료올리기">
	</td>
</tr>

</table>
</form>

</div>
</body>
</html>