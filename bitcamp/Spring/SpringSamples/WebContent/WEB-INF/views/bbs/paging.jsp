<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
/*

	<< [1][2][3][4][5] >>
	<< ... [6][7] 8 [9][10]... >>

*/

// 몇 페이지 들어가고 현재 페이지가 어디고 마지막 페이지가 어떤지를 구하는 것
// 시작 페이지를 구한다. 총 페이지를 구한다. 마지막 페이지를 구한다

int totalRecordCount;		// 전체 글 수		23 -> 3페이지
int pageNumber;				// 현재 페이지	0 ~ 9	[1] ~ [10]
int pageCountPerScreen;		// 스크린당 페이지 수 = 10
int recordCountPerPage;		// 페이지당 글 수 = 10

String st1 = request.getParameter("totalRecordCount");
if(st1 == null) totalRecordCount = 0;
else			totalRecordCount = Integer.parseInt(st1);

String st2 = request.getParameter("pageNumber");
if(st2 == null) pageNumber = 0;
else			pageNumber = Integer.parseInt(st2);

String st3 = request.getParameter("pageCountPerScreen");
if(st3 == null) pageCountPerScreen = 0;
else			pageCountPerScreen = Integer.parseInt(st3);

String st4 = request.getParameter("recordCountPerPage");
if(st4 == null) recordCountPerPage = 0;
else			recordCountPerPage = Integer.parseInt(st4);

// 총 페이지 수
int totalPageCount = totalRecordCount / recordCountPerPage;
// 	= 2						23		/		10
if((totalRecordCount % recordCountPerPage) != 0){
	totalPageCount++;			// -> 3
}

// 시작페이지 [1]		[11]	[21]	<< [1][2][3]...[10]>>	<< [11][12][13]...[20]>>	<< [21][22][23]
// pageNumber + 1을 하는 이유는 pageNumber은 index번호로 들어가서 0부터 시작하기 때문이다
// pageNumber + 1 												: 1번 페이지를 클릭하면 pageNumber는 index 번호인 0이라서  클릭한 번호로 맞추기 위해 +1한다
// ((pageNumber + 1) / pageCountPerScreen)						: 결과값은 0, 1, 2, 3, 4, ... 스크린 번호가 index로 나온다
// ((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen : 결과값은 0, 10, 20, 30, 40, ... 시작 페이지보다 1 적게 나온다 왜? index 번호라서
int screenStartPageIndex = ((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen;
//			0						1					10					10
//			10						12					10					10
// 딱 떨어	10						10					10					10
//			20						21					10					10
//			30						35					10					10

// 끝페이지
int screenEndPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) + pageCountPerScreen;

// 끝페이지는 다시 계산
if(screenEndPageIndex > totalPageCount){
	// 맨 마지막 페이지
	screenEndPageIndex = totalPageCount;
}

// 딱 떨어졌을 때
if((pageNumber + 1) % pageCountPerScreen == 0){
	screenStartPageIndex = (((pageNumber + 1) / pageCountPerScreen) * pageCountPerScreen) - pageCountPerScreen;
	//				0 = 10 - 10;
	//				0 = 20 - 20;
	//				0 = 30 - 30;
	
	screenEndPageIndex = pageNumber + 1;	// 0 -> 1, 9 -> 10
}
%>

<div style="float: left; width: 96%; text-align: center;">
	<!-- << -->
	<a href="#none" title="처음페이지" onclick="gePage('0')">
		<img alt="" src="image/arrow_first.gif" style="width: 9px; height: 9px;">
	</a>
	
	<!-- < -->
	<%
	if(screenStartPageIndex > 1){
		// 맨 끝번 페이지로 갔을 떄
	%>
	<a href="#none" title="이전페이지" onclick="goPage('<%=screenStartPageIndex-1 %>')">
		<img alt="이미지없음" src="image/arrow_back.gif" style="width: 9px; height: 9px;">
	</a>
	<%
	}
	%>
	
	<!-- [1] 2 [3] -->	
	<%
	// 첫 페이지가 1이 될지 11이 될지 모르니까
	for(int i = screenStartPageIndex; i < screenEndPageIndex; i++){
		if(i == pageNumber){
			// 현재 페이지 클릭할 수 없다
			%>
			<span style="font-size: 9px; color: #000000; font-weight: bold;">
				<%=i+1 %>
			</span>
			<%
		}else{
			// 그 외의 페이지
			%>
			<a href="#none" title="<%=i+1 %>페이지" onclick="goPage(<%=i %>)"
				style="font-size: 7.5px; color: #000000; font-weight: normal;">
			[<%=i+1 %>]
			</a>
			<%
		}
	}
	%>
	
	<!-- > -->
	<%
	if(screenEndPageIndex < totalPageCount){	// [11][12][13]
		%>
		<a href="#none" title="다음페이지" onclick="goPage(<%=screenEndPageIndex %>)">
			<img alt="이미지없음" src="image/arrow_next.gif" style="width: 9px; height: 9px;">
		</a>
		<%
	}	
	int end_page = 0;
	if(totalPageCount > 0){
		end_page = totalPageCount - 1;
	}

	//		[1][2][3]
	%>
	

	<!-- >> -->
	<a href="#none" title="마지막페이지" onclick="goPage(<%=end_page %>)">
		<img alt="이미지없음" src="image/arrow_next.gif" style="width: 9px; height: 9px;">
	</a>
	
</div>










