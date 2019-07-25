<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%--
	<%! function, variable %>
	
	<% %> script + applet = scriptlet(java영역)
		  jsp(html + java)
	
	<%=value %>
	
	EL(값) + Core(제어문)	=>	java
	
	El = front end언어니다. Expression Language. 다른걸 안하고 바로 사용할 수 있다
							표현(식)		언어
							
	Core Tag
	
	Jsp Tag
	
	JSTL(Java server page Standard Tag Language)
	
--%>

<%
	String str = "hello";
	request.setAttribute("_str", str);
%>

<%
	String s = (String)request.getAttribute("_str");
%>

<%
out.println("s = " + s);
%>

<br><br>

s=<%=s %>

<br><br>

<!-- EL -->
s = ${ _str }

<%='값' %>

<br><br>

${ '값' }
<!-- EL태그 %의 블록안에 값을 넣는 것 -->

<br><br>

${ 3>2?100:200 }

<br><br>

<%
// El태그를 사용할 때는 반드시 setAttribute를 써야한다
request.setAttribute("data", "안녕");
String data2 = request.getParameter("data");

%>

${ data }

<br><br>

변수(Object)의 data가 있는지? (null?)

<br><br>

empty가 참이냐고 물어본다
data = ${ empty data }		<!-- data == null -->

<br><br>
data = ${ not empty data }		<!-- data != null -> true -->

<br><br>
1 < 9 : ${ 1 < 9 }			<!-- true/false -->

<br><br>
2 + 3 : ${ 2 + 3 }				<!-- value -->





<%
/* setAttribute에는 int가 들어갈 수 없다 */
Integer a, b;
a = 10;
b = 3;

request.setAttribute("_a", a);
request.setAttribute("_b", b);

Boolean c;
c = false;

request.setAttribute("_c", c);

%>

<pre>

a:${ _a }
b:${ _b }
c:${ _c }

a+b:${ _a + _b }

eq:${ _a eq _b }
eq:${ _a == _b }

ne:${ _a ne _b }
ne:${ _a != _b }

gt:${ _a gt _b }
gt:${ _a > _b }

lt:${ _a lt _b }
lt:${ _a < _b }

le:${ _a le _b }		<!-- <= -->
ge:${ _a ge _b }		<!-- >= -->

div:${ _a div _b }		<!-- _a / _b -->
mod:${ _a mod _b }		<!-- _a % _b -->

c:${ !_c }

${ _a == 10 && !_c }

</pre>

<br><br>
<%
MemberDto mem = new MemberDto();
mem.setMessage("Hello El");

request.setAttribute("_mem", mem);
%>

<%=mem.getMessage() %>

<br><br>

${ _mem.message }
<br><br>
객체를 통해 접근할 때는 setAttribute에 넣은 문자열을 통해서
setter getter

<br><br>

<%
String array[] = { "hello", "world" };

request.setAttribute("_array", array);
%>

<%=array[0] %>

<br><br>

${ _array[1] }

<br><br>

<%
List<String> list = new ArrayList<>();
list.add("world");
list.add("EL");

request.setAttribute("_list", list);
%>

<%=list.get(0) %>
<br>

${ _list[0] }
<br>

${ _list[1] }

<br><br>
<%
List<MemberDto> memlist = new ArrayList<>();

MemberDto dto = new MemberDto();
dto.setMessage("메시지 one");
memlist.add(dto);

dto = new MemberDto();
dto.setMessage("메시지 one");
memlist.add(dto);

request.setAttribute("_memlist", memlist);
%>

<%=memlist.get(0).getMessage() %>

<br>
${ _memlist[0].message }
<br>
${ _memlist[1].message }

<br><br>

El태그 -> setAttribute -> 

</body>
</html>

