<%@page import="dao.MemberDao"%>
<%@page import="dao.iMemberDao"%>
<%@page import="dao.BbsDao"%>
<%@page import="dto.BbsDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.iBbsDao"%>
<%@page import="dto.MemberDto"%>
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
<style type="text/css">
#del{
	font-size: 5px;
	color: red;
}
</style>
</head>
<body>

<%
Object ologin = session.getAttribute("login");
MemberDto mem = null;
if(ologin == null){
	%>
	<script type="text/javascript">
	alert("로그인해 주십시오");
	location.href = "login.jsp";
	</script>
	<%
}
mem = (MemberDto)ologin;
%>

<%
iBbsDao dao = BbsDao.getInstance();
List<BbsDto> list = dao.getBbsList();

session.setAttribute("id", mem.getId());
%>

<h4 align="right" style="background-color: #f0f0f0"><%=mem.getId() %>님 환영합니다
</h4>

<div align="right">
<a href="bbswrite.jsp">새로 글쓰기</a>
<br><br>
</div>



<div align="center">

<table border="1">
<col width="70"><col width="600"><col width="150">
<tr>
	<th>번호</th><th>제목</th><th>작성자</th>
</tr>

<%-- 
<c:if test="${empty list }"></c:if>
// setAttribute에 list를 넣어져있어야 한다
--%>

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
		<!-- 그냥 번호다 시퀀스가 아니다 -->
		<!-- class로 넣으면 기본글 or 답글 or 답글의 답글 중 하나를 클릭했을 때 this로 접근할 수 있다
		id로 넣으면 안된다 한번에 접근할 수 없다 -->
		<%-- 
		<%=arrow(bbs.getDepth()) %>
		<%=bbs.getTitle() %>
		--%>
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


<br><br> 
<form id="frm">
<input type="hidden">
<select name="search">
	<option selected="selected">검색 할 것</option>
	<option value="제목">제목</option>
	<option value="작성자">작성자</option>
</select>
<input type="text" name="searchText">
<input type="button" id="search" value="검색">
</form>

</div>

<script type="text/javascript">
$("#search").click(function () {
	$("#frm").attr({"action" : "bbssearch.jsp"}).submit();
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