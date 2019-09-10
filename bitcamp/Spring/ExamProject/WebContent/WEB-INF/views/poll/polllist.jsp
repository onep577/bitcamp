<%@page import="bit.com.a.util.DateUtil"%>
<%@page import="bit.com.a.model.PollDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
List<PollDto> plists = (List<PollDto>)request.getAttribute("plists");
%>

<!-- 관리자 -->
<c:if test="${login.auth eq '1' }">
<table class="list_table" style="width: 95%">
<col width="50"><col width="50"><col width="300">
<col width="100"><col width="100"><col width="50">
<col width="50"><col width="100">

<tr>
	<th>번호</th><th>아이디</th><th>질문</th>
	<th>시작일</th><th>종료일</th>
	<th>보기수</th><th>투표수</th><th>등록일</th>
</tr>

<%
	for(int i = 0; i < plists.size(); i++){
		PollDto poll = plists.get(i);
		%>
		<tr bgcolor="#aabbcc">
			<td><%=i+1 %></td>
			<td><%=poll.getSubject_seq() %></td>
			<td><%=poll.getExam_seq() %></td>
			<td><%=poll.getQuestion() %></td>
			<td><%=poll.getQuestion_sub() %></td>
			<td><%=poll.getAnswer() %></td>
			<td><%=poll.getPolltotal() %></td>
			<td><%=poll.getTeacher() %></td>
		</tr>
		<%
	}
%>
</table>
</c:if>






<!-- 사용자 -->
<c:if test="${login.auth eq '3' }">
<table class="list_table" style="width: 95%">
<col width="50"><col width="50"><col width="300">
<col width="100"><col width="100"><col width="50">
<col width="50"><col width="100">

<tr>
	<th>번호</th><th>아이디</th><th>질문</th>
	<th>결과</th><th>시작일</th><th>종료일</th>
	<th>보기수</th><th>투표수</th><th>등록일</th>
</tr>

<%
	// plists는 전체 투표 리스트이다
	for(int i = 0; i < plists.size(); i++){
		PollDto poll = plists.get(i);
		%>
		<tr bgcolor="#aabbcc">
			<td><%=i+1 %></td>
			<td><%=poll.getTeacher() %></td>
			<!-- 투표를 했으면 링크없다, 안했으면 링크건다 -->
			<%
			// true면 투표했고, false면 투표 안했다
			boolean isSuccess = poll.isVote();
			
			// 투표 못하게 하는 조건
			// 투표를 했거나 투표가 종료되었을 때
			if(isSuccess || DateUtil.isEnd(poll.getEdate())){
				// 투표 했음 || 투표 기한이 끝났음
				%>
				<td>[마감]<%=poll.getQuestion() %></td>
				<%
			}else{
				%>
				<td>
					<a href="polldetail.do?subject_seq=<%=poll.getSubject_seq() %>">
						<%=poll.getQuestion() %>
					</a>
				</td>
				<%
			}
			%>
			
			<td>
	         <%
	         // 결과를 볼 수 있다
	         if(isSuccess || DateUtil.isEnd(poll.getEdate())){
	            %>
	            <a href="pollresult.do?subject_seq=<%=poll.getSubject_seq() %>">결과</a>
	            <%
	         }else{
	            %>
	            <img alt="" src="image/pen.gif">
	            <%
	         }
	         %>
	         </td>

			
			<td><%=poll.getSdate() %></td>
			<td><%=poll.getEdate() %></td>
			<td><%=poll.getPolltotal() %></td>
		</tr>
		<%
	}
%>

</table>
</c:if>



<c:if test="${login.auth eq '1' }">
	<a href="pollmake.do">투표 만들기</a>
</c:if>


