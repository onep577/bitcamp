<%@page import="dao.PersonQnADao"%>
<%@page import="dao.iPersonQnADao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.PersonQnADto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- page 부트스트랩 -->
<title>호텔시그니엘</title>

<style type="text/css">

main{
	overflow: inherit;
	width: 80%;
	min-height: 400px;
	height: auto;
	margin: auto;
	margin-bottom: 30px;
}

ul{
   list-style:none;
   padding-left:0px;
}

#totalpage{
	overflow: inherit;
	width: 100%;
	height: auto;
	background-color: yellow;
	font-family: 'Noto Sans KR', sans-serif;
}

#adminMain{
	width: 84%;
	height: auto;
	float: left;
	text-align: right;
	/* background-color: lightgray; */
}

.tb{
	margin-top: 20px;
	margin-left: 145px;
    border-collapse: collapse;
    font-family: 'Noto Sans KR', sans-serif;
}

.tb th{
	padding: 20px;
	background: #D6B78D;
	text-align: center;
	color: white;
}

.tb th, .tb td{
	border-bottom: 1px solid #D6B78D;
}

textarea{
	border-color: #D6B78D;
} 

#comm{
	margin-top: 7px;
	margin-bottom: 7px;
	padding-left: 5px;
	text-align: left;
	padding-top: 7px;
	border-color: #D6B78D;
}

#comments{
	margin-top: 7px;
}

#titles{
	padding-left: 8px;
	padding-right: 8px;
}

#contents{
	background: #F2EBD7;
}

#str, #choice2 {
	margin-top: 7px;
	margin-bottom: 7px;
	width: 188px;
	height: 26px;
}

.trfoot{
	padding-top: 20px;
}

.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;
}

.page-link{
	margin: 0;
}

.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
	background: #D6B78D;
	border-color: #D6B78D;
}

	
</style>

</head>

<body>

<jsp:include page="../header.jsp" flush="false"/>


<main>
<div id="totalpage">
	<div id="adminMenu">
		<jsp:include page="../adminMenu.jsp" flush="false"/>
	</div>
	
	<div id="adminMain">
		<h2 align="center" style="font-family: 'Noto Sans KR', sans-serif">고객의소리 List</h2>
	
		<c:if test="${empty choice }">
			<c:set var="choice" value=""/>
			<c:set var="str" value=""/>
		</c:if>

		<form id="frm">
		<table class="tb">
			<col width="80"><col width="110"><col width="120"><col width="400"><col width="120"><col width="150">
			<tr>
				<th>NO</th><th>CATEGORY</th><th>ID</th><th>TITLE</th><th>DATE</th><th>COMMENT</th>
			</tr>
		
			<c:if test="${empty list }">
			<tr>
				<td colspan="6" align="center">작성된 글이 없습니다.</td>
			</tr>
			</c:if>
		
			<c:if test="${not empty list }">
			<c:forEach var="m" items="${list }" varStatus="i">
				<tr>
					<td align="center">${i.index + 1}</td>
					<td align="center">${m.question_type }</td>
					<td align="center">${m.id }</td>
					<td align="left" id="titles" class="title${i.index + 1}" 
									 onmouseover="bgchange(${i.index + 1})" onmouseout="bgout(${i.index + 1})" onclick="showForm(${i.index + 1})">
						<input type="hidden" name="seq" class="seq${i.index + 1}" value="${m.seq }">
							${m.title }
					</td>
					<td align="center">${fn:substring(m.wdate, 0, 19)}</td>
					<td align="center">
						<c:if test="${m.answer_check eq 0 }">
							답변대기중
						</c:if>
					
						<c:if test="${m.answer_check ne 0 }">
							답변완료
						</c:if>
					</td>
				</tr>
			
				<tr id="contents" class="cls${i.index + 1}" style="display: none">
					<td colspan="6" align="center" width="200px" height="100px" style="padding-left: 30px; padding-right: 30px;">
						${m.content }
					</td>
				</tr>
					
				<tr class="cls${i.index + 1}" style="display: none">
					<td></td><td></td>
					<td style="text-align: right; padding-bottom: 62px">COMMENTS</td>
					<td id="comm" colspan="3">
						<textarea rows="4" cols="65" id="comments" name="comments" class="getcls${i.index + 1}" style="text-align: left;">${m.comments }</textarea>
						<input type="button" value="등록" id="commentsBtn${i.index + 1}" style="margin-bottom: 24px;" onclick="writeComments(${i.index + 1})">
					</td>
				</tr>
				
			</c:forEach>
			</c:if>
		
			<tr align="center" class="trfoot">
				<td colspan="6">
				<c:if test="${paging.prev }">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a class="page-link" href="admin_servlet?command=qnalist&choice=${choice}&str=${str}&pageNum=${paging.startPage-1}">prev</a></li>
					</ul>
				</c:if>
				
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" step="1" var="index">
					<c:if test="${paging.pageNum eq index }">
						<ul class="pagination pagination-sm justify-content-center pagination my">
							<li class="page-item active"><a class="page-link">${index }</a></li>
						</ul>
					</c:if>
					
					<c:if test="${paging.pageNum ne index }">
						<ul class="pagination pagination-sm justify-content-center">
							<li class="page-item"><a class="page-link" href="admin_servlet?command=qnalist&choice=${choice}&str=${str}&pageNum=${index}">${index}</a></li>
						</ul>
					</c:if>
				</c:forEach>
				
				<c:if test="${paging.next }">
					<ul class="pagination pagination-sm justify-content-center">
						<li class="page-item"><a class="page-link" href="admin_servlet?command=qnalist&choice=${choice}&str=${str}&pageNum=${paging.endPage+1}">next</a></li>
					</ul>
				</c:if>
				</td>
			</tr>
			
			<tr align="center" class="trfoot">
				<td colspan="6">
					<select id="choice" name="choice" onchange="func1()">
						<option value="ID" selected="selected">ID</option>
						<option value="문의 유형">문의 유형</option>
					</select>

					<input type="text" id="str" name="str" placeholder="검색">
					<select id="choice2" name="choice2" style="display: none">
						<option value="질문" selected="selected">질문</option>
						<option value="제안">제안</option>
						<option value="칭찬">칭찬</option>
						<option value="불만">불만</option>
						<option value="기타">기타</option>
					</select>
					
					<input type="button" value="검색" id="searchBtn" onclick="searchList()">
				</td>
			</tr>
		
		</table>
		
		</form>
		<br><br>
		
		<script type="text/javascript">
		// 선택한 title에 답변을 달아주는 폼 보여주기
		function showForm( i ) {
			if($(".cls" + i).is(":visible") == false){
				$(".cls" + i).css("display", "");
			}
			else{
				$(".cls" + i).css("display", "none");
			}
			 
		}
		
		// 답변을 단 게시글의 seq와 작성한 comments를 넘겨주기
		function writeComments( i ) {
			var seq = $(".seq" + i).val();
			var comments = $(".getcls" + i).val();
		
			if(comments.trim() == ""){
				alert("답변을 작성해주십시오.");
				$(".getcls"+i).focus();
				return;
			}
			else{
				location.href = "admin_servlet?command=qnaupdate&comments=" + encodeURI(comments) + "&seq=" + seq + "&pageNum=${paging.pageNum}";
			}
		}
		
		function searchList() {
			var choice = $("#choice").val();
			
			
			if(choice == "ID"){
				var search = $("#str").val();
				
			}
			else if(choice == "문의 유형"){
				var search = $("#choice2").val();
				
			}
			
			/* var search = $("#str").val(); */
			
			if(search.trim() == ""){
				choice = "";
				search = "";
			}
			
		//	alert("choice:" + choice + " str:" + search);
			
			location.href = "admin_servlet?command=qnalist&choice=" + choice + "&str=" + search + "&pageNum=1";
			
		}
		
		function func1() {
			var choice = $("#choice").val();
			
			if(choice == "ID"){
				$("#str").css("display", "");
				$("#choice2").css("display", "none");
				
			}
			else if(choice == "문의 유형"){
				$("#str").css("display", "none");
				$("#choice2").css("display", "");
				
			}
			
		}
		
		
		function bgchange(i) {
			$(".title" + i).css("background-color", "#EFE1BA");
		}
		
		function bgout(i) {
			$(".title" + i).css("background-color", "");
		}
		
		</script>	
		
	
	</div>

</div>

</main>


<jsp:include page="../footer.jsp" flush="false"/>





</body>
</html>