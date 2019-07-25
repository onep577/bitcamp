<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	EL : 표현식(값), 비교(true/false)
	
	Core : 제어문(for, if) -> El태그와 함께 사용해야 사용 가능하다
--%>

<%
request.setAttribute("_data", "JSTL입니다");
%>

${ _data }
<br>

<!-- setAttribute의 _data이다 이름은 같으면 충돌나서 바꿨다 -->
<%-- <c:set var="_cdata" value="core JSTL입니다"></c:set> --%>
<!-- 위 아래가 같은 코드다 -->
<c:set var="_cdata" value="core JSTL입니다"/>
${ _cdata }
<br>

<!-- out == 내장객체 -->
<!-- El태그 없이는 Core를 쓰기는 좀 어렵다 아래는 out 내장객체를 사용했고 위는 그냥 썼다 -->
<c:out value="${ _cdata }"></c:out>
<br>
------------------------------------------
<br><br>


<!-- session -->
<%
session.setAttribute("sessionData", "저장된 데이터");
%>

<c:set var="sdata" value="${sessionData}"></c:set>
<br>

<!-- 위에는 set이고 아래 두개는 out이다 아래 두개에서 출력된다 -->

<c:out value="${sdata}"></c:out>
<br>

<c:out value="${sessionData}"></c:out>
<br>
------------------------------------------
<br><br>



<!-- if -->
<%
request.setAttribute("count", "10");
%>

<%
String sCount = (String)request.getAttribute("count");
int count = Integer.parseInt(sCount);

if(count >= 10){
	%>
	count:<%=count %>
	<%
}
%>
<br>

<!-- test안에 들어가는 게 조건이다 -->
<!-- 숫자로 변환 안해도된다 문자열끼리 비교가 아니라 숫자로 비교한다 -->
<c:if test="${count >= 10 }">
	count:<c:out value="${count}"></c:out>
</c:if>
<br>
------------------------------------------
<br><br>

<%
request.setAttribute("name", "홍길동");
%>

<c:if test="${name eq '홍길동123'}">
	이름은 홍길동123 맞습니다
</c:if>

<c:if test="${name eq '홍길동'}">
	-이름은 홍길동 맞습니다
</c:if>
<br>



<%
request.setAttribute("name", "일지매");
%>

<c:if test="${name == '일지매'}" var="flg"></c:if>

<c:if test="${!flg}">
	제 이름은 일지매입니다
</c:if>

<c:if test="${flg}">
	-제 이름은 일지매입니다
</c:if>
<br>
------------------------------------------
<br><br>



<!-- for -->
<!-- 이건 scriptlet이다 -->
<%
for(int i = 0; i < 10; i++){
%>
	<%=i %>
<%
}
%>
<br>
<c:forEach begin="0" end="9" step="1" varStatus="i">
	<%--<c:out value="${i }"></c:out>  주소값이 나온다 --%>
	<c:out value="${i.index }"></c:out>
</c:forEach>
<br>
------------------------------------------
<br><br>



<%
List<MemberDto> list = new ArrayList<>();

MemberDto mem = new MemberDto();
mem.setMessage("하이");
list.add(mem);

mem = new MemberDto();
mem.setMessage("안녕");
list.add(mem);

mem = new MemberDto();
mem.setMessage("잘가");
list.add(mem);

request.setAttribute("_list", list);
%>

<%
for(int i = 0; i < list.size(); i++){
	MemberDto m = list.get(i);
}
for(MemberDto m : list){
	
}
%>

<c:forEach var="m" items="${_list }" varStatus="i">
index:<c:out value="${i.index }"></c:out>
data:<c:out value="${m.message }"/>
<br>
</c:forEach>



</body>
</html>