<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	int totalRecordCount;	//전체 글수 23 -> 3페이지
	int pageNumber;			//현재 페이지 0~9	[1]~[10]
	int pageCountPerScreen;	// 스크린당 페이지 수 = 10
	int recordCountPerPage;	// 페이지당 글 수 = 10
	
	//
	int _p_seq;
	String p_seq = request.getParameter("p_seq");
	//
	
	String st1 = request.getParameter("totalRecordCount");
	if(st1 == null || "".equals(st1)) totalRecordCount = 1;
	else			totalRecordCount = Integer.parseInt(st1);
	
	String st2 = request.getParameter("pageNumber");
	if(st2 == null || "".equals(st2)) pageNumber = 1;
	else			pageNumber = Integer.parseInt(st2);
	
	String st3 = request.getParameter("pageCountPerScreen");
	if(st3 == null || "".equals(st3)) pageCountPerScreen = 1;
	else			pageCountPerScreen = Integer.parseInt(st3);
	
	String st4 = request.getParameter("recordCountPerPage");
	if(st4 == null || "".equals(st4)) recordCountPerPage = 1;
	else			recordCountPerPage = Integer.parseInt(st4);
	
	// 총페이지 수
	int totalPageCount = totalRecordCount / recordCountPerPage;
	//	2						23		/	10
	if((totalRecordCount % recordCountPerPage)!= 0){
		totalPageCount++;			//  -> 3페이지로 늘어남
	}
	
	// 시작페이지 [1]	[11]	[21]	<<[1][2][3]...[10]>>
	int screenStartPageIndex = ((pageNumber + 1)	/ pageCountPerScreen) * pageCountPerScreen;
	//			0					10						10					*10
	
	// 끝페이지	[10] [20] [30]
	int screenEndPageIndex = (((pageNumber + 1)	/ pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;
	
	// 끝페이지는 다시 계산
	if(screenEndPageIndex > totalPageCount){
		screenEndPageIndex = totalPageCount;
	}
	
	if((pageNumber + 1) % pageCountPerScreen == 0){
		screenStartPageIndex = ((pageNumber + 1 ) / pageCountPerScreen * pageCountPerScreen ) - pageCountPerScreen;
		
		screenEndPageIndex = pageNumber + 1; 	//0 => 1 9 => 10
	}
	
	
	
%>


<div align="center">
	<nav aria-label="Page navigation example" >
	<!-- << -->
	<ul class="pagination justify-content-center">
		<li class="page-item">
	      <a href="#none" class="page-link"  title="처음페이지" onclick="goPage('0')">
	        <span aria-hidden="true">&laquo;</span>
	        <span class="sr-only">Previous</span>
	      </a>
	    </li>
	
	
	<!-- < -->
	<%
	for(int i = screenStartPageIndex; i<screenEndPageIndex; i++){
		
		if(i == pageNumber && i >0){	// 현재페이지
			
	%>
		   
		<li class="page-item">
		<a href="#none" class="page-link" title="이전페이지" onclick="goPage(<%=i-1 %>)">
			<span aria-hidden="true">&lt;</span>
	        <span class="sr-only">Previous</span>
		</a>
	    </li>
	    

	<%
	}else if(i == pageNumber && i < 1){
		%>
		<li class="page-item">
		<a href="#none" class="page-link" title="이전페이지" onclick="goPage(<%=i %>)">
			<span aria-hidden="true">&lt;</span>
	        <span class="sr-only">Previous</span>
		</a>
	    </li>
	<%
	}
	}
	%>
	
	<!--[1] 2 [3] -->
	
	<%
	for(int i = screenStartPageIndex; i<screenEndPageIndex; i++){
		if(i == pageNumber){	// 현재페이지
		%>
		<li class="#none"><a class="page-link" style="color: #000000;"><%=i+1 %></a></li>
		
		<% 
		}else{	// 그외의 페이지들
			%>
			<li class="page-item"><a href="#none" class="page-link" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"><%=i+1 %></a></li>
	<%
		}
	}
	%>
	
<!-- > -->
	<%
	for(int i = screenStartPageIndex; i<screenEndPageIndex; i++){
		if(i == pageNumber && i+1 < screenEndPageIndex){	// 현재페이지
		%>
		
		<li class="page-item">
		<a href="#" class="page-link" title="다음페이지" onclick="goPage(<%=i+1 %>);return false;">
			<span aria-hidden="true">&gt;</span>
	        <span class="sr-only">Next</span>
		</a>
	    </li>
		
		<%
		}else if(i == pageNumber && i+1 ==screenEndPageIndex){
			%>
			<li class="page-item">
		<a href="#" class="page-link" title="다음페이지" onclick="goPage(<%=i %>);return false;">
			<span aria-hidden="true">&gt;</span>
	        <span class="sr-only">Next</span>
		</a>
	    </li>
			<%
		}
	}
	%>
		
	<%
	int end_page = 0;
	if(totalPageCount > 0){
		end_page = totalPageCount - 1;
	}
	%>
	<!-- >> -->
	<li class="page-item">

	      <a href="#" class="page-link" title="마지막페이지" onclick="goPage(<%=end_page %>)" >


	        <span aria-hidden="true">&raquo;</span>
	        <span class="sr-only">Next</span>
	      </a>
	    </li>
	  </ul>
	</nav>
</div>


    