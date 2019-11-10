<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% String ctx = request.getContextPath(); %>
<%int count = (Integer)request.getAttribute("tapcount"); %>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<%=ctx %>/js/used/notes.js"></script>
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/content_layout.css">
<link rel="stylesheet" href="<%=ctx%>/css/member/mypage/content/notes.css">
</head>
<div class="mypage_main_content_title" align="left">
<h3 id="review_title">쪽지함</h3>
</div>
<body>
<div>
<button type="button" id="_send" name="send" class="rhybtn">쪽지 보내기</button>

<c:if test="${dto.subscribe eq 0 }">	<!-- 수신 설정 -->
	<a href='javascript: subscribe_func()'><img id="bellimg" alt="" src="/img/used-img/bell.png" style="width: 50px" height="50px" id="like_img"></a>
</c:if>

<c:if test="${dto.subscribe eq 1 }"> 	<!-- 수신거부 설정 -->
		<a href='javascript: subscribe_func()'><img id="bellimg" alt="" src="/img/used-img/bellAf.png" style="width: 50px" height="50px" id="like_img"></a>
</c:if>
</div>
<div class="review_main_wrap">
	<ul class="nav nav-tabs" id="review_main_nav_tab" role="tablist">
		<li class="nav-item review_main_nav_tab_item">
			
					<%
		if(count == 0){
			%>
			<a class="nav-link active" id="waiting_items-tab" data-toggle="tab" href="#_waiting_items" role="tab" 
			aria-controls="_waiting_items" aria-selected="true">받은 쪽지함</a>
		<%
		} else{
			%>
			<a class="nav-link" id="waiting_items-tab" data-toggle="tab" href="#_waiting_items" role="tab" 
			aria-controls="_waiting_items" aria-selected="true">받은 쪽지함</a>
			<%
		}
		%>
		</li>
		
		<li class="nav-item review_main_nav_tab_item">
			
								<%
		if(count == 1){
			%>
			<a class="nav-link active" id="written_reviews-tab" data-toggle="tab" href="#_written_reviews" role="tab" 
			aria-controls="_written_reviews" aria-selected="false">보낸 쪽지함</a>
		<%
		} else{
			%>
			<a class="nav-link" id="written_reviews-tab" data-toggle="tab" href="#_written_reviews" role="tab" 
			aria-controls="_written_reviews" aria-selected="false">보낸 쪽지함</a>
			<%
		}
		%>
			
			

		
		
		</li>		
	</ul>

	<!-- Tab panes -->
	<div class="tab-content">	
		<!-- 받은 쪽지함 탭 시작 -->
		
		<%
		if(count == 0){
			%>
			<div class="tab-pane active" id="_waiting_items" role="tabpanel" aria-labelledby="waiting_items-tab">	
		<%
		} else{
			%>
			<div class="tab-pane" id="_waiting_items" role="tabpanel" aria-labelledby="waiting_items-tab">
			<%
		}
		%>
		<br><br>
		
	<form id="_rform">
		<button type="button" id="rdeletebtn"  class="rhybtn">쪽지 삭제</button>
		<select id="r_select" name="r_select">
			<option value="r_content" <c:out value="${r_select == 'r_content'? 'selected':'' }"/>>내용</option>
			<option value="r_id" <c:out value="${r_select == 'r_id'? 'selected':'' }"/>>보낸사람</option>
		</select>
		<input type="text" name="r_keyword" class="r_keyword" value="${r_keyword }">					
		<input type="button" value="검색" id="_rformbtn" name="formbtn" class="rhybtn">	
		<input type="hidden" value="0" name="tapcount">
		<input type="hidden" name="r_pageNumber" id="_rpageNumber" value="${(empty pageNumber)?0:r_pageNumber }">
		<input type="hidden" name="r_recordCountPerPage" id="_recordCountPerPage" value="${(empty r_recordCountPerPage ? 0 : r_recordCountPerPage)}">	
		<input type="hidden" id="_loginid" name="loginid" value="${userloginid }">
	</form>
		<br>
		<form id="rdeleteform">
		<table id="_ntable" class="list_table">
		<tr>
			<th><input type="checkbox" id="allCheck"></th><th>보낸사람</th><th>내용</th><th>날짜</th>					
		</tr>
		<c:forEach items="${rlist }" var="notes" varStatus="i">
			<c:if test="${notes.recv_del eq 'N' }">
		<tr>
			<td><input type="checkbox" id="rchbox" name="rchbox" value="${notes.seq }" send_id=${notes.send_id } recv_id="${userloginid }"></td>
			<td align="center"><a href="#none" seq="${notes.seq }" onclick="notesdetail(this)">${notes.send_id }</a></td>
			<td><div id="_content"><a href="#none"  seq="${notes.seq }" onclick="notesdetail(this)">${notes.content }</a></div></td>
			<td>${notes.data_send }</td>
			<%-- <td><button type="button" id="rbtn" value="${notes.seq }" send_id="${notes.send_id }">삭제</button></td> --%>	
		</tr>	
			</c:if>
		</c:forEach>
		</table>
		</form>
		<c:if test="${empty rlist }">
		<table>
		<tr><td colspan="5" align="center">받은 쪽지가 없습니다</td>
		</tr>					
		</table>
		</c:if>
				
		<!-- 페이징 -->
 		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/member/mypage/content/sub/recvpaging.jsp" flush="false"> 	
				<jsp:param name="rpageNumber" value="${r_pageNumber }" />
				<jsp:param name="rtotalRecordCount" value="${r_totalRecordCount }" />
				<jsp:param name="rpageCountPerScreen" value="${r_pageCountPerScreen }" /> 
				<jsp:param name="rrecordCountPerPage" value="${r_recordCountPerPage }" />
			</jsp:include>
		</div>
		</div>
		<!-- 받은 쪽지함 탭 끝 -->
		
		<!-- 보낸 쪽지함 탭 시작 -->
		<%
		if(count == 1){
		%>
			<div class="tab-pane active" id="_written_reviews" role="tabpanel" aria-labelledby="written_reviews-tab">
		<%	
		} else{
			%>
			<div class="tab-pane" id="_written_reviews" role="tabpanel" aria-labelledby="written_reviews-tab">			
			<%
		}
		%>
				<br><br>
				
			<form id="_sform">
		<button type="button" id="sdeletebtn"  class="rhybtn">쪽지 삭제</button>
		<select id="s_select" name="s_select">
			<option value="s_content" <c:out value="${s_select == 's_content'? 'selected':'' }"/>>내용</option>
			<option value="s_id" <c:out value="${s_select == 's_id'? 'selected':'' }"/>>받는사람</option>
		</select>
		<input type="text" name="s_keyword" id="s_keyword" value="${s_keyword }">					
		<input type="button" value="검색" id="_sformbtn" name="formbtn"  class="rhybtn">	
		<input type="hidden" value="1" name="tapcount">
		<input type="hidden" name="s_pageNumber" id="_spageNumber" value="${(empty pageNumber)?0:s_pageNumber }">
		<input type="hidden" name="s_recordCountPerPage" id="_recordCountPerPage" value="${(empty s_recordCountPerPage ? 0 : s_recordCountPerPage)}">	
	</form>
		<br>		
		<form id="sdeleteform">		
		<table id="_ntable" class="list_table">
		
		<tr>
			<th><input type="checkbox" id="allCheck2"></th><th>받는사람</th><th>내용</th><th>날짜</th>					
		</tr>
		<c:forEach items="${slist }" var="notes" varStatus="i">
			<c:if test="${notes.send_del eq 'N' }">
		<tr>
			<td><input type="checkbox" id="schbox" name="schbox" value="${notes.seq }"></td>
			<td align="center"><a href="#none" seq="${notes.seq }" onclick="notesdetail(this)">${notes.recv_id }</a></td>
			<td><div id="_content"><a href="#none"  seq="${notes.seq }" onclick="notesdetail(this)">${notes.content }</a></div></td>
			<td>${notes.data_send }</td>
		</tr>	
			</c:if>
		</c:forEach>
		</table>
		</form>
		<c:if test="${empty slist }">
		<table>
		<tr><td colspan="4" align="center">
		보낸 쪽지가 없습니다</td>
		</tr>
		</table>					
		</c:if>					
						<!-- 페이징 -->
 		<div id="paging_wrap">
			<jsp:include page="/WEB-INF/views/member/mypage/content/sub/sendpaging.jsp" flush="false"> 	
				<jsp:param name="spageNumber" value="${s_pageNumber }" />
				<jsp:param name="stotalRecordCount" value="${s_totalRecordCount }" />
				<jsp:param name="spageCountPerScreen" value="${s_pageCountPerScreen }" /> 
				<jsp:param name="srecordCountPerPage" value="${s_recordCountPerPage }" />
			</jsp:include> 
		
		</div>		

		</div><!-- 보낸 쪽지함 탭 끝 -->
	</div>
</div>



<script type="text/javascript">

function subscribe_func(){
	
	var subscribe = "${dto.subscribe}";
	var id = "${dto.userid}";
	
	$.ajax({
		url:"/mypage/subscribe",
		type:"get",
		data : {
			subscribe : subscribe,
			id : id
		},
		success:function(num){
			if(num == 1){
				$("#bellimg").attr("src","/img/used-img/bellAf.png");
			} else if (num == 0){
				$("#bellimg").attr("src","/img/used-img/bell.png");
			}
		},
		error:function(e){
			alert(e);
		}
	})
}

</script>
</body>
</html>