<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<%
String id = (String)session.getAttribute("id");

session.setAttribute("id", id);
%>


<form action="bbswriteAf.jsp" onsubmit="return frmsubmit()">
<table>
<col width="100px"><col width="100px"><col width="100px">
<tr>
	<td>
	ID
	</td>
	<td colspan="2">
	<input type="text" name="id" value="<%=id %>" readonly="readonly">
	</td>
</tr>
<tr>
	<td>
	Title
	</td>
	<td colspan="2">
	<input type="text" name="title" id="title">
	</td>
</tr>
<tr>
	<td colspan="3">
	Content
	</td>
</tr>
<tr>
	<td colspan="3">
	<textarea name="content" id="content" cols="50" rows="15"></textarea>
	</td>
</tr>
<tr>
	<td>
	</td>
	<td colspan="2">
	<input type="submit" value="추가">
	<input type="button" value="수정">
	<input type="button" id="goback" value="목록으로 돌아가기">
	</td>
</tr>
</table>
</form>


<script type="text/javascript">
$("#goback").click(function () {
	location.href = "bbslist.jsp";
});

function frmsubmit(){
	// 입력 안된 정보가 있을 때 submit을 막아준다
	
	if( $("#title").val().trim() == "" || $("#content").val().trim() == "" ){
		alert("모두 기입해주세요");
		return false;
	}else{
		return true;
	}
	
}
</script>

</body>
</html>