<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!-- 최소한의 코드이다 -->
<!-- 현재 페이지는 어떤 페이지이며 charset은 UTF-8 쓰겠다 -->

<%
String str = "Hello JSP";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!--
	HTML 주석문 jsp도 써도 되지만 완전히 동작하지 않는다
-->

<%--
	JSP 주석문
	
	JSP : java server pages
	
	server( web )를 통해서 client form을 만들어내는 코드
	서버에서 전송해줄 수 있는 문서를 만든다
	항상 서버를 거쳐가야한다
	
	실행하면 서버를 통해 동작된 다음 web browser로 간다
	
	html, jsp는 Container에 있다 jsp로 DB까지 갈 수 있다
	
	리퀘스트로 웹서버를 통해 페이지 던져달라고 할 떄
	컨테이너에서 이미지 파일 동영상 등 다 다운로드 받는다
	이미지를 불러 오는 시간이 걸린다
	그래서 한번 실행시킨 후 두번째부터 시간이 적게 걸린다
	
	127.0.0.1:8090/프로젝트명 으로 요청한다 request
	실제 서버인 Web Server에서 찾은 문서를 client에 응답한다 response
	
	TCP에서는 패킷을 던져준다
	JSP : 문서를 받는다 response를 만나는 순간 웹페이지로 간다
	
	http://192.168.0.26:8090/sample01/
	http://192.168.0.26:8090/sample01/index.jsp
	http://192.168.0.26:8090/sample01/default.jsp
	
	url로 요청하는 것 -> 클라이언트가 서버로 요청하는 것
	우리가 jsp 작업을 했다 -> 웹 컨테이너에서 작업했다
	웹 브라우저와 만나는 순간 클라이언트 코드가 된다
	
	클라이언트 작업을 하는 것이 아니다
	여태까지는 servlet빼고 client 작업이었다
	servlet도 html은 client이긴 하지만
	
	코드를 읽고 문서를 response로 던져준다
	던져주는 코드를 가지고 클라이언트의 Web Browser랑 만나는 순간 클라이언트 코드가 된다
	
	우리는 웹 컨테이너안에서 작업중이다
	
	자바는 거의 서버코드이다
--%>

<h1>hello JSP</h1>

<img alt="" src="d:\\tmp\\img.png">
<!-- 안된다 왜? jsp는 서버 코드
되는 방법 2가지 : 이미지가 웹에 있거나 리소스로 있다. 즉, 프로젝트 안에 있다
알ftp
-->

<%
// java 영역
// scriptlet = script + applet

/*
	Servlet = java(html) 속도가 더 빠르다
	
	JSP = html(java) 훨씬 편하다
	
	내장(암시) 객체 : new(생성)를 하지않고 바로 사용할 수 있는 object
		out, request, response
*/
System.out.println("System.out.println 내장객체가 아니다 console에 출력");
// 콘솔에 찍힌다
out.println("out.println 내장객체이다 out을 통해서 출력");
// 웹에 내보낸다
// html 코드에 '내장객체 out을 통해서 출력' 이라고 적는 것과 같다 아래 아래 코드와 같다

out.println("<h2>내장객체 out을 통해서 출력</h2>");
%>
여기는 html코드 내장객체 out을 통해서 출력<br>
-------------------------------------------------------- System과 out
<!-- out.println("out.println 내장객체이다 out을 통해서 출력"); 와 동일한 결과 출력 -->



<%
out.println("<h3>str = " + str + " </h3>");
%>
<h3>str = <%=str %></h3>
<!-- = 뒤에는 결과값으로 나와야 한다 -->
<!-- 자바 영역이기 때문에 value값만 썼다 -->
<!-- 위의 코드와 위위의 코드는 같은 결과를 다르게 표현했다 -->

<input type="text" size="20" value="<%=str%>"><br>
-------------------------------------------------------- out, 일반태그, input태그
<!-- 위는 일반태그, 아래는 input태그에 값 넣는 방법이다 -->



<%
for(int i = 0; i < 5; i++){
%>
<p>hello p tag <%=i %></p>
<%
}
%>
<!-- java코드와 일반p 태그가 섞여있다 이것이 JSP의 대표적인 장점이다 코드가 지저분해지는 단점이 있다-->


<!-- 위에 코드와 아래 코드는 동일한 코드이다 out 내장객체는 잘 쓰지 않는다 -->
<%
for(int i = 0; i < 5; i++){
	out.println("<p>hello p tag" + i + "</p>");
}
%>
-------------------------------------------------------- for문



<p id="demo">p demo</p>
<script type="text/javascript">
document.getElementById("demo").innerHTML = "change p tag";
</script>
-------------------------------------------------------- java script



</body>
</html>