<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctx = request.getContextPath(); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=ctx %>/js/used/notesanswer.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/used/noteswrite.css">
</head>
<body>
	<div>
	<form id="_notesform">
		<input type="hidden" value="${userloginid }" name="send_id">
		<input type="hidden" value="${dto.send_id }" name="recv_id">
		받는사람 :&nbsp;${dto.send_id }
		<hr>
    	<textarea id="content" name="content" cols="60" rows="14" maxlength="1000"  style="resize: none;"></textarea>
		<div class="wrap">
    	<span id="counter">###</span>
		</div>
		<br>
		<input type="checkbox" id="_save" name="save">
		<font size="2px"><b><a href="#none" onclick="save()">보낸쪽지함에 저장</a></b> (보낸쪽지함에 저장하면 수신확인/발송취소가 가능합니다.)</font>
		<br>
		<button type="button" id="_send" class="rhybtn"><b>보내기</b></button><button type="button" id="_cancel" class="rhybtn">취소</button>
	</form>
	</div>
</body>
</html>