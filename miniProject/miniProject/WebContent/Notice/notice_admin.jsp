<%@page import="dto.CustomerDto"%>
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
<title>공지게시판 관리</title>
<style type="text/css">
main{
	overflow : inherit;
	width: 80%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
	min-height: 400px;
}
ul{
   list-style:none;
   padding-left:0px;
}

.menu > li{
	list-style:none;
	color: #eee;
}
.menu > li > a{

	color: #eee;
}  
.menu > li > a:hover{
	list-style:none;
	color: black;
}
#totalpage{
	overflow: inherit;
	width: 100%;
	height: auto;
}

#adminMenu{
/* 	padding-top: 60px;
	padding-left: 30px;
	width: 16%;
	height: auto;
	float: left;
	background-color: gray; */
	padding-top: 60px;
	padding-left: 30px;
	width: 16%;
	height: 100%;
	float: left;
	background-color: gray;
}

#adminMain {
	width: 84%;
	height: auto;
	float: left;
	text-align: right;
	/* background-color: lightgray; */
}

.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;

}
.hide1 { 
	display: none;
}
#add_div .tb input {
	 margin-left: 10px;
}
#add_div .tb textarea{
	
}
.tb {
  /*  border-collapse: separate;
   border-spacing: 0;
   text-align: left;
   line-height: 1.0;
   border-top: 1px solid #ccc;
   border-left: 1px solid #ccc;
   margin : 20px 50px; */
   margin-top: 20px;
   margin-bottom: 30px;
   margin-left: 145px;
   border-collapse: collapse;
   font-family: 'Noto Sans KR', sans-serif;   
   min-width: 90%;
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
.tb td{
	padding: 8px 8px;
}
.title_td{
	text-align: left; margin-left: 30px;
}

table.tb th {
   /*
   padding: 10px;
   font-weight: bold;
   vertical-align: center;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
   border-top: 1px solid #fff;
   border-left: 1px solid #fff;
   background: #eee;
   text-align: center;
    */
}	
table.tb td {
/* 
  
   padding: 10px;
   vertical-align: center;
   border-right: 1px solid #ccc;
   border-bottom: 1px solid #ccc;
   background : #ffffff;
    */
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

<div id="totalpage">
	<div id="adminMenu">
		<jsp:include page="../adminMenu.jsp" flush="false"/>
	</div>

	</div>
	
	<div id="adminMain">
		
		
		<form id="frm" action="/miniProject/notice_servlet" onsubmit="return delsubmit()">
		<input type="hidden" name="command" value="delNotice">

		<table class="tb">		
		<col width="80" class="hide1"><col width="120"> <col width="300"> <col width="200">  <col width="80">
		<tr>
			<td colspan="5" style="border-color: #ffffff;">
				<h2 align="center" style="font-family: 'Noto Sans KR', sans-serif;">공지내역</h2>		
			</td>
		</tr>
		<tr>
			<td align="left" colspan="5" style="background : #ffffff; border-color: #ffffff;">
				<button type="button" id="delBtn">공지삭제</button>
				<input class="hide1" type="submit" value="선택한 공지 삭제">
			</td>
		</tr>
		
		<tr>
			<th class="hide1">
				<div class="allCheck">	
					<label for="allCheck">모두선택</label>						
					<input type="checkbox" name="allCheck" id="allCheck">
					<script> 	// 전체선택-전체해제
					$("#allCheck").click(function(){
						 var chk = $("#allCheck").prop("checked");
						 
						 if(chk) {
						  $(".chBox").prop("checked", true);
						 } else {
						  $(".chBox").prop("checked", false);
						 }
					});
					</script>					
				</div>		
			</th>
			
			<th>NO</th> <th>TITLE</th> <th>FILE</th> <th>DATE</th>
		</tr>
			
		<%
		
		List<NoticeDto> list = (List<NoticeDto>)request.getAttribute("list");
		int listpage = (Integer)request.getAttribute("listpage");
		int pageNumber = (Integer)request.getAttribute("pageNumber");
		
		if(list == null || list.size() == 0){	// 공지글 0개인 경우
			%>
			<tr>
				<td colspan="4">등록된 공지가 없습니다.</td>	
			</tr>
			<%
		}
		else { // 공지글 1개 이상		
			for(int i = 0 ; i < list.size() ; i++ ){
				System.out.println("jsp list.size()" + list.size());
				NoticeDto dto = list.get(i);
			%>
			<tr>
				<th class="hide1">
					<input type="checkbox" name="chBox" class="chBox" value="<%=dto.getSeq() %>">
				</th>
				<td align="center"><%=i+1 %></td>
				
				<td class="title_td" onclick="showContent(<%=i %>)">
						<input type="hidden" name="seq" class="seq<%=i %>" value="<%=dto.getSeq() %>">
						<%=dto.getTitle() %>
				</td>
				<%		
				if(!dto.getFilename().equals("-")){	// 첨부파일이 있으면,
					%>	
					<td align="center">
						<image alt="" src="/miniProject/image/file_icon.png" width="20px" height="20px">
					</td>
					<%
				}else {	//첨부파일이 없을 시
					%>
					<td align="center">-</td>
					<%
				}
				%>				
				<td align="center"><%=dto.getWdate().substring(0, 16) %></td>
			</tr>		
		
			<!-- 타이틀 클릭시 나타나는 내용창 -->
			<tr class="cls<%=i %>" style="display: none;">
				<td colspan="5" align="center">
					<%-- <%=dto.getContent() %> --%>
					
					<%-- <textarea style="height: 200px; border:0; overflow:auto; width: 100%; resize: none; outline: none; margin-bottom: 5px;"
						 name="content" class="getcls<%=i %>" readonly="readonly"><%=dto.getContent() %></textarea> --%>
					<textarea style="height: 200px; border:0; overflow:auto; width: 100%; resize: none; outline: none; margin-bottom: 5px;"
						  class="getcls<%=i %>" readonly="readonly"><%=dto.getContent() %></textarea>
					<p>
					<a href="/miniProject/notice_servlet?seq=<%=dto.getSeq() %>&command=noticeDetail_amd">공지수정</a>
					</p>
				</td>
			</tr>

			<%
			} //for문 끝
			%>
			<tr align="center">
			<td colspan="5">					
			<%
			for(int i = 0; i < listpage ; i++) {
				if(pageNumber == i) {
			%>	
				<ul class="pagination pagination-sm justify-content-center pagination my" >
					<li class="page-item active"><a class="page-link"><%=i+1 %></a></li>
				</ul>
					<%-- <a style="color: #333; margin: 0; margin-left: 10px; margin-right: 10px;"><%=i+1 %></a> --%>
				
				
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
			</td>
			</tr>
							
			<%
		}		
		%>
		
		<tr align="center" style="padding: 10px;">
			<td colspan="5">
				<select id="choice" style="width: 100px; height: 30px">
					<option value="sel">선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
				<input type="text" size="50" id="search" value="">
				<button type="button" onclick="serchNotice()">검색</button>
				<button type="button" onclick="changeDisplay()">공지추가</button>			
			</td>
		</tr>

		</table>
		</form>
		
		
		<div id="add_div" align="center" style="display: none; margin-bottom: 30px">			
			
			<h2 align="center" style="font-family: 'Noto Sans KR', sans-serif">공지 추가</h2>	
			
			<form name="frm" action="/miniProject/notice_servlet" method="post" enctype="multipart/form-data"
					onsubmit="return submitcheck()">
				
				<table class="tb" style="margin-left: 0;">
				<col width="100"><col width="400">
					
				<tr>
					<th>작성자</th>
					<td><%CustomerDto user = (CustomerDto)session.getAttribute("login");%>
						<input type="text" name="id" value="<%=user.getId() %>" readonly="readonly" size="50" >
						 <!-- <input type="hidden" name="id" value="demoID"> user.getId() -->
					</td>
				</tr>
				
				<tr>
					<th>TITLE</th>
					<td>
						<input type="text" name="title" placeholder="Title" size="50" value="" maxlength="40">
					</td>
				</tr>
				
				<tr>
					<th>파일등록</th>
					<td>
						<input type="file" name="fileload" style="width: 400px">	<!-- 주의! type을 text로 잡는건 무조건 String 으로 받고 file type은 Byte로 받아간다. (request.get..) -->
					</td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td style="height: 300px;">
						<textarea rows="20" cols="70" name="content" id="content" value="" 
							style="border:0; resize: none;overflow: auto;margin: 10px; background:clear; width: 100%;"></textarea>
					</td>
				</tr>
						
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="작성완료" id="btn">
					</td>
				</tr>		
				</table>
			
			</form>	
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
	location.href = "/miniProject/notice_servlet?command=notice_adm&searchWord=" + word + "&choice=" + choice;
}

function goPage( pageNum ) {
	
	var choice = "<%=choice%>";
	var word = "<%=searchWord%>";
	
	if(word == ""){
		document.getElementById("choice").value = 'sel';
	}
	
	location.href = "/miniProject/notice_servlet?command=notice_adm&pageNumber=" + pageNum+"&searchWord=" + word + "&choice=" + choice;
}

function changeDisplay() {
	if($("#add_div").is(":visible") == false){
		$("#add_div").css("display","");
	}else{
		$("#add_div").css("display","none");
	}
}

function showContent(i) {
	if($(".cls" + i).is(":visible") == false){
		$(".cls" + i).css("display","");
	}
	else {
		$(".cls" + i).css("display","none");
	}
}
$(".chBox").click(function (){	
  	$("#allCheck").prop("checked", false);  		
});

  
$(function () {		
	
	
	$(".title_td").mouseover(function() {		
		$(this).css("background", "#EFE1BA");
	});
	$(".title_td").mouseout(function() {
		$(this).css("background", "");
	});
	
	
	$("#delBtn").on("click",function(){		
		if( $(".hide1").is(":visible") == false ){
	    	$(".hide1").show();
			
	    }else {
	    	$(".hide1").hide();
	    }
	});
});

// 공지추가 submit 조건
function submitcheck() {
	if(document.frm.title.value != '' || document.frm.title.value != null
			|| document.frm.content.value != '' || document.frm.content.value != null){
		alert("공란이 존재합니다.");
		return false;
	}
	document.frm.submit();
}

// 공지삭제 submit 조건
function delsubmit() {
	var values = document.getElementsByName("chBox");
	var len = values.length;
	//alert("values(총체크박스 수 )" + len );
	
	var count = 0;
	for(var i=0; i < len ; i++){
		if(values[i].checked){
			count++;
		}
	}
	//alert("count(체크된 박스수)" + count);
	
	if(count<1) {
		alert("삭제할 데이터를 선택하세요");
		return false;
	}
	else {
		if(confirm("선택한 공지를 삭제하시겠습니까?")){
			document.frm.submit();
		}else {
			return false;
		}
	}
	
}

$(document).ready(function(){
    $("input[name=title]").keyup(function(){
        if ($(this).val().length > $(this).attr('maxlength')) {
            alert('제목은 40자 이내로 작성하세요.');
            $(this).val($(this).val().substr(0, $(this).attr('maxlength')));
        }
    });
});


</script>	

</body>
</html>