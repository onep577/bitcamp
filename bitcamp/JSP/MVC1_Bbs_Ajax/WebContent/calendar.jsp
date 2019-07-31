<%@page import="dao.CalendarDao"%>
<%@page import="dao.iCalendar"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.Calendar"%>
<%@page import="dto.CalendarDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// nvl함수
public boolean nvl(String msg){
	// 값이 null이거나 공백이 아닐 때 즉, 값이 있을 때 false를 반환한다
	return msg == null || msg.trim().equals("")?true:false;
}

// 날짜를 클릭하면, 그날의 일정이 모두 보이게 하는 callist.jsp로 이동하는 함수
public String callist(int year, int month, int day){
	String str = "";
	
	// %s는 string으로 들어간다
	str += String.format("<a href='%s?year=%d&month=%d&day=%d'>" ,
							"callist.jsp", year, month, day );
	str += String.format("%2d", day);
	// %2d : 4일이면 한글자니까 숫자 표현할 때 두칸으로 잡아라
	str += "</a>";
	return str;
}

/*
<a href='callist.jsp?year=2019&month=07&day=31'>31</a>
<a href='callist.jsp?year=2019&month=07&day=31'> 4</a>
*/

// 일정을 기입하기 위해서 pen이미지를 클릭하면, calwrite.jsp 이동시키는 함수
public String showPen(int year, int month, int day){
	String str = "";
	
	String image = "<img src='images/pen.gif'>";
	
	str = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>",
							"calwrite.jsp", year, month, day, image);
	/*
		<a href='calwrite.jsp?year=2019&month=07&day=31'>
			<img str'image/pen.gif'>
		</a>
	*/
	return str;
}

// 1 -> 01		2019731 -> 20190731
public String two(String msg){
	return msg.trim().length()<2?"0"+msg.trim():msg.trim();
}

// 각 날짜별로 테이블을 생성하는 함수
public String makeTable(int year, int month, int day, List<CalendarDto> list) {
	// 몇년도 몇월 며칠에 대해서 일정이 어떻게 되는지?
	String str = "";
	// 20190731
	String dates = (year + "") + two(month + "") + two(day + "");
	
	str += "<table frame=void>";
	str += "<col width='98'>";
	
	for(CalendarDto dto : list){
		if(dto.getRdate().substring(0, 8).equals(dates)){
			// 0번부터 8전까지 즉, 0 ~ 7 데이터베이스와 자바의 substr 코드가 다르다
			str += "<tr bgcolor='white'>";
			str += "<td style='border: hidden;'>";
			
			str += "<a href='caldetail.jsp?seq=" + dto.getSeq() + "'>";
			// <a href='caldetail.jsp?seq=5'>
			str += "<font style='font-size:8;color:red'>";
			str += dot3(dto.getTitle());
			
			str += "</font>";
			str += "</a>";
			str += "</td>";
			str += "</tr>";
		}
	}	
	str += "</table>";
	
	return str;
}

// 제목이 너무 길면 제목+...으로 처리하는 함수
// 예) 최이사님과 점심 약속 있음 -> 최이사님과 점심...
public String dot3(String msg){
	String str = "";
	
	if(msg.length() >= 10){
		str = msg.substring(0, 10);
		// 0 ~ 9까지
		str += "...";
	}else{
		str = msg.trim();
	}
	return str;
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

<h2>달력</h2>


<%
Calendar cal = Calendar.getInstance();
cal.set(Calendar.DATE, 1);
// 오늘의 달, 1일

String syear = request.getParameter("year");
String smonth = request.getParameter("month");

int year = cal.get(Calendar.YEAR);
if(nvl(syear) == false){		// 파라미터가 넘어 왔을 때
	// 첫번째 들어온 게 아니라 두번째부터 체크한다
	year = Integer.parseInt(syear);
}

int month = cal.get(Calendar.MONTH) + 1; // 0부터 시작한다 원하는 값을 얻기 위해서는 +1 해야한다
if(nvl(smonth) == false){
	month = Integer.parseInt(smonth);
}

if(month < 1){
	month = 12;
	year--;
}
if(month > 12){
	month = 1;
	year++;
}

cal.set(year, month-1, 1);		// 년월일 셋팅 완료

// 요일
int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);

// <<		year--
String pp = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/left.gif'></a>",
						"calendar.jsp", year-1, month);

// <		month--
String p = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/prec.gif'></a>",
						"calendar.jsp", year, month-1);

// >		month++
String n = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/next.gif'></a>",
						"calendar.jsp", year, month+1);

// >>		year++
String nn = String.format("<a href='%s?year=%d&month=%d'>"
					+ "<img src='images/last.gif'></a>",
						"calendar.jsp", year+1, month);

MemberDto user = (MemberDto)session.getAttribute("login");

iCalendar dao = CalendarDao.getInstance();
List<CalendarDto> list = dao.getCalendarList(user.getId(), syear + two(month + ""));
%>

<form>
<table border="1">
<col width="100"><col width="100"><col width="100"><col width="100">
<col width="100"><col width="100"><col width="100">

<tr height="100">
	<td colspan="7" align="center">
		<%=pp %>&nbsp;<%=p %>
		<font color="black" style="font-size: 50px">
			<%=String.format("%d년&nbsp;&nbsp;%d월", year, month) %>
		</font>
		<%=n %>&nbsp;<%=nn %>
	</td>
</tr>

<tr height="100">
	<td align="center">일</td>
	<td align="center">월</td>
	<td align="center">화</td>
	<td align="center">수</td>
	<td align="center">목</td>
	<td align="center">금</td>
	<td align="center">토</td>
</tr>

<tr height="100" align="left" valign="top">
<%
// 위쪽 빈칸
for(int i = 1; i < dayOfWeek; i++){
	%>
	<td>&nbsp;</td>
	<%
}
%>

<%-- 날짜 --%>
<%
int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
for(int i = 1; i <= lastDay; i++){
	%>
	<td class="mydate">
	<%=callist(year, month, i) %>&nbsp;&nbsp;<%=showPen(year, month, i) %>
	<%=makeTable(year, month, i, list) %>
	</td>
	<%
	if((i + dayOfWeek - 1)%7 == 0 && i != lastDay){
		%>
		</tr><tr height="100" align="left" valign="top">
		<%
	}
}
%>


<%-- 밑칸 --%>
<%
for(int i = 0; i < (7 - (dayOfWeek + lastDay - 1)%7 )%7; i++){
	%>
	<td>&nbsp;</td>
	<%
}
%>


</tr>

</table>
</form>




<script type="text/javascript">
$(".mydate").mouseover(function () {
	$(this).css("background-color", "yellow");
});
$(".mydate").mouseout(function (){
	$(this).css("background-color", "#fff");
});
$(".mydate").click(function (){
	alert("33");
});
</script>





</body>
</html>