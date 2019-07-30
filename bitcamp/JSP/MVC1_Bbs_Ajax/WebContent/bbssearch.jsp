<%@page import="dto.MemberDto"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.BbsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// 댓글용 함수
public String arrow(int depth){
	String rs = "<img src='./images/arrow.png' width='20px' height='20px' />";
	String nbsp = "&nbsp;&nbsp;&nbsp;&nbsp;";	// 여백
	
	String ts = "";
	for(int i = 0; i < depth; i++){
		// depth가 1 일때는 답글
		// depth가 2 일때는 답글의 답글이다
		ts = ts + nbsp;
	}
	// depth==0 일때는 기본글이다
	return depth==0?"":ts+rs;	// 여백 + 이미지
}
%>


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

String searchText = request.getParameter("searchText");
String search = request.getParameter("search");
//System.out.println("search : " + search + ", searchText : " + searchText);

BbsDao dao = BbsDao.getInstance();
List<BbsDto> list = dao.search(search, searchText);

session.setAttribute("id", id);

System.out.println("search : " + search + ", searchText : " + searchText);
%>
<h4 align="right" style="background-color: #f0f0f0"><%=id %>님 환영합니다
</h4>

<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>

<%
if(list == null || list.size() == 0){
	// 리스트가 없거나 리스트의 글이 하나도 없을 때
	%>
	<tr>
		<td colspan="3">작성된 글이 없습니다</td>
	</tr>
	<%	
}else{
	for(int i = 0; i < list.size(); i++){
		BbsDto bbs = list.get(i);
	%>
	<tr>
		<th><%=i + 1 %></th>
		<%
		if(list.get(i).getDel() == 0){
			%>
			<td><b id="del">&nbsp;&nbsp;-- 이 글은 작성자에 의해서 삭제되었습니다</b></td>
			<%
			
		}else{
		%>
		<td class="seqclick" seq="<%=bbs.getSeq() %>">
		<%-- <a href="bbsdtail.jsp?seq=<%=bbs.getSeq() %>"> --%>
		<%=arrow(bbs.getDepth()) %><%=bbs.getTitle() %>
		<%
		}
		%>
		</td>
		
		<td align="center"><%=bbs.getId() %></td>
	</tr>
	<%
	}
}
%>

</table>
<a href="bbswrite.jsp">글쓰기</a>

<form id="gofrm">
<input type="button" id="goback" value="전체보기">
</form>
</div>



<script type="text/javascript">
$("#goback").click(function () {
	alert("goback");
	$("#gofrm").attr( "action", "bbslist.jsp" ).submit();
});

$(function () {	
	$(".seqclick").mousedown(function() {
		alert("seq : " + $(this).attr("seq"));
		location.href = "bbsdtail.jsp?seq=" + $(this).attr("seq");
	});
	
	$(".seqclick").mouseover(function() {		
		$(this).css("background", "#e0e0e0");
	});
	$(".seqclick").mouseout(function() {
		$(this).css("background", "#ffffff");
	});
	
});
</script>



</body>
</html>