<%@page import="dto.PersonQnADto"%>
<%@page import="java.util.List"%>
<%@page import="dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<script type="text/javascript" src="./js/jquery.min.js"></script>
 
<link rel="stylesheet" href="./css/bootstrap.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">

<style type="text/css">

main{
	overflow: inherit;
	width: 80%;
	height: auto;
	margin: auto;
	margin-bottom: 30px;
}

#totalpage{
	overflow: inherit;
	width: 100%;
	height: auto;
	font-family: 'Noto Sans KR', sans-serif;
	/* background-color: yellow; */
}

.tb{
	margin-top: 5px;
	margin-bottom: 110px;
    border-collapse: collapse;
    font-family: 'Noto Sans KR', sans-serif;
}

input, textarea, select{
	border: none;
	padding-left: 15px;
	padding-right: 15px;
	background-color: #f1f1f1;
}

textarea{
	padding-top: 15px;
	padding-bottom: 15px;
}

.td1, #choice{
	width: 252px;
	height: 35px;
}

.td2{
	width: 504px;
	height: 35px;
}

.td1, .td2, .td3{
	margin-bottom: 10px;
}

.td4{
	text-align: center;
}

#changeBtn, #mypageBtn{
	margin: 10px;
	width: 160px;
	height: 40px;
	border-color: black;
	border-radius: inherit;
	background-color: black;
}

#changeBtn:hover, #mypageBtn:hover{
	border-color: #5E2C00;
    background-color: #5E2C00;
    color: #ffffff;
}


</style>

</head>

<body>

<%
CustomerDto user = (CustomerDto)session.getAttribute("login");

if(user == null){
	System.out.println("CustomerDto user == null");
	response.sendRedirect("/miniProject/customer_servlet?command=loginpage");
	return;
	//request.getRequestDispatcher("common_servlet?command=loginpage").forward(request, response); // 이렇게 파라메타 붙여주는식으로는 못 쓴다.
}

request.setAttribute("_user", user);

List<PersonQnADto> qnalist = (List<PersonQnADto>)request.getAttribute("qnalist");

int seq = (Integer)request.getAttribute("seq");
String id = (String)request.getAttribute("id");
String choice = (String)request.getAttribute("choice");
String title = (String)request.getAttribute("title");
String content = (String)request.getAttribute("content");
String comments = (String)request.getAttribute("comments");

if(comments.trim() == null || comments.trim().equals("null") || comments.trim().equals("")){
	comments = "답변 준비중입니다.";
}

%>

<jsp:include page="../header.jsp" flush="false"/>

<main>
<div id="totalpage" align="center">

<h2>고객의 소리</h2><br>

<form id="frm">
<table class="tb">
<tr>
	<th><h4>ID</h4></th>
</tr>
<tr>
	<td>
		<input type="text" class="td1" value="<%=user.getId()%>" readonly="readonly">
		<input type="hidden" name="command" value="gochange">
		<input type="hidden" name="seq" value="<%=seq %>">
	</td>
<tr>

<tr>
	<th><h4>CATEGORY</h4></th>
</tr>
<tr>	
	<td>
		<input type="text" class="td1" name="choice" value="<%=choice %>" readonly="readonly">
	</td>
</tr>

<tr>
	<th><h4>TITLE</h4></th>
</tr>
<tr>
	<td><input type="text" id="title" name="title" class="td2" readonly="readonly" value="<%=title %>"></td>
</tr>

<tr>
	<th class="th1"><h4>CONTENT</h4></th>
</tr>

<tr>
	<td><textarea rows="10" cols="65" id="content" name="content" class="td3" readonly="readonly"><%=content %></textarea></td>
</tr>

<tr>
	<th><h4>COMMENTS</h4></th>
</tr>

<tr>
	<td><textarea rows="10" cols="65" id="comments" name="comments" class="td3" readonly="readonly"><%=comments %></textarea></td>
</tr>

<tr>
	<td class="td4">
		<button type="button" id="changeBtn" class="btn btn-success">수정</button>
		<button type="button" id="mypageBtn" class="btn btn-success">마이페이지로</button>
	</td>
</tr>

</table>
</form>

</div>

<script type="text/javascript">
$(document).ready(function() {

	var comm = "답변 준비중입니다.";
 	if(comm == "<%=comments %>"){
		$("#changeBtn").show();
	}
 	else{
 		$("#changeBtn").hide();
 	}
		
	$("#changeBtn").click(function() {
					
		$("#frm").attr("action", "/miniProject/personqna_servlet").submit();
	});
		
	$("#mypageBtn").click(function() {
						
		location.href = "customer_servlet?command=mypage";
		
	});
	
});

</script>


</main>

<jsp:include page="../footer.jsp" flush="false"/>



</body>
</html>