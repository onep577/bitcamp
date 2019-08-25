<%@page import="dto.NoticeDto"%>
<%@page import="dao.NoticeDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"> <!-- page 부트스트랩 -->
<title>공지게시판</title>

<style type="text/css">
main{
	width: 80%;
	/*height: 800px;  이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
	min-height: 400px;
	
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
	/* width: 150px; 
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
	font-size: large;
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
	text-align: center;
	border-bottom: 1px solid #D6B78D;
}

#frm h2{
	padding : 20px;
	font-family: sans-serif;
}

.intro{
	height: 150px;
	margin-top: 50px;
	background-color: #fafafa;
	margin-bottom: 60px;
}
.intro_bar{
	background-color: #fafafa;
	width: 50%;
	height: 40px;
}
.page-link{
	margin: 0;
}
.my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:focus,
.my.pagination > .active > span:hover, 
.my.pagination > .active > span:focus {
	background: #D6B78D;
	border-color: #D6B78D;
}
 
.my.pagination > .active > a:hover  {
	background: #EFE1BA;
	border-color: #D6B78D;
}

</style>
</head>
<body>

<jsp:include page="../header.jsp" flush="false"/>

<main>
<div align="center">
	<div class="intro">
		<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 50px;" align="center">공지사항</p>
		
		<div class="intro_bar">
			<p style="font-family: 'Noto Sans KR', sans-serif; font-size: 20px;" align="center">
				호텔 시그니엘의 새로운 소식을 전해드립니다.
			</p>
		</div>
	</div>

	<form name="frm" id="frm">
		<table class="type02">
		<col width="200"> <col width="700"> <col width="200">  <col width="200">
		
		<tr>
			<th>NO</th> <th>title</th> <th>FILE</th> <th>작성일</th>
		</tr>
		
		<%
		List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("list");
		System.out.println("1/ 검색조건맞는 list 개수 "+list.size());
		
		// 공지글이 0개인 경우
		if(list == null || list.size() == 0){	
			%>
			<tr>
				<td colspan="4" align="center">등록된 공지가 없습니다.</td>				
			</tr>
			<%
		}
		
		// 공지글이 하나라도 있을 경우
		else {
			
			for(int i = 0 ; i < list.size() ; i++ ){
				NoticeDto dto = list.get(i);				
				
			%>
			<tr>
				<td><%=i+1 %></td>	<!-- 페이지에 보이는 글번호-->							
				<td style="text-align: left; margin-left: 10px;" class="title_td" 
					onclick="location.href='/miniProject/notice_servlet?seq=<%=dto.getSeq() %>&command=noticeDetail'">
				<%=dto.getTitle() %>		
				</td>			
				
				<%
				if(!dto.getFilename().equals("-")){	// 첨부파일이 있으면,
					%>
					<td align="center">
						<image src="/miniProject/image/file_icon.png" width="20px" height="20px">
					</td>
					<%
				}else {		//첨부파일이 없을 시
					%>
					<td align="center">-</td>
					<%
				}
				%>				
				<td align="center"><%=(dto.getWdate()).substring(0, 11) %></td>
			</tr>
			

			<%
			} // for문 끝
		}		
		%>
		</table>		
	</form>
</div>


<div align="center" style="margin: 20px">
 

<%
int listpage = (Integer)request.getAttribute("listpage");
int pageNumber = (Integer)request.getAttribute("pageNumber");

System.out.println("총페이지수(jsp): "+listpage);
System.out.println("pageNumber(jsp): "+pageNumber);

for(int i = 0; i < listpage ; i++) {
	if(pageNumber == i) {
%>	<ul class="pagination pagination-sm justify-content-center pagination my">
		<li class="page-item active">
			<a class="page-link" style="color: #333; font-weight: bold;"><%=i+1 %></a>
		</li>
	</ul>
<%}else{%>
	<ul class="pagination pagination-sm justify-content-center pagination my">
		<li class="page-item active">
			<a class="page-link" href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)">
			<%=i+1 %></a>
		</li>
	</ul>
<%
	}
}
%>
</div>

<div align="center" >
	<div style="height: 40px">
		<select id="choice" style="width: 100px; height: 30px">
			<option value="sel">선택</option>
			<option value="title">제목</option>
			<option value="content">내용</option>
		</select>
		<input type="text" size="50" id="search" value="">
		<button type="button" onclick="serchNotice()">검색</button>
	</div>
</div>
</main>	

<jsp:include page="../footer.jsp" flush="false"/>

<%
String choice = request.getParameter("choice");
String searchWord = request.getParameter("searchWord");
%>

<script type="text/javascript">
function serchNotice(){
	var choice = document.getElementById("choice").value;
	var word = $("#search").val();
	
	if(word == ""){
		document.getElementById("choice").value = 'sel';
	}
	
	
	location.href = "/miniProject/notice_servlet?command=notice&searchWord=" + word + "&choice=" + choice;
}

function goPage( pageNum ) {
	
	var choice = "<%=choice%>";
	var word = "<%=searchWord%>";
	
	if(word == ""){
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "/miniProject/notice_servlet?command=notice&pageNumber=" + pageNum+"&searchWord=" + word + "&choice=" + choice;
}

$(function () {	
	$(".title_td").mouseover(function() {		
		$(this).css("background", "#EFE1BA");
	});
	$(".title_td").mouseout(function() {
		$(this).css("background", "");
	});	
});



</script>
</body>
</html>