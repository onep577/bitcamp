<%@page import="sample01.UtilClass"%>
<%@page import="sample01.YouClass"%>
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
	Java -- 제어문, 컬렉션, DB접근 -> EL tag, Core tag
	컬렉션 : list, hashMap
	
	Java 영역 -> scriptlet
	
	JSP 목적 -> client code를 만들어 내는 것 결과를 db와 통신으로 작성한다

	scriptlet
	선언부, 코드부, value부

--%>

<%!// 자바영역의 선언부
// 전역변수, class선언(템플릿), function선언
int glvar = 0;%>
<%
	// 코드부
glvar++;
out.println("glvar : " + glvar);
// 글로번 변수는 index1.jsp 즉, 현재 페이지의 전역변수이다
// static 변수는 아니다
// 다른 페이지로 갔다가 오면 초기화된다

int var = 0;
var++;
out.println("var : " + var);
%>
<br><br>

<%-- value부 --%>
glvar : <%=glvar%>
var : <%=var%>
<br><br>



<%!// 클래스 선언을 할 수 있지만 잘 안한다 java Resources에서 한다
// 선언이라는 것은 코드가 아니다 클래스를 선언하는 것은 템플릿 즉, 형태이기 때문이다
class MyClass{
	private int number;
	private String name;
	
	public MyClass(int number, String name){
		this.number = number;
		this.name = name;
	}
	public String toString(){
		return "number : " + number + ", name : " + name;
	}
}

public String func(){
	return "func() 호출";
}%>

<%
	MyClass mcls = new MyClass(1, "hgd");
out.println( mcls.toString() );

YouClass ycls = new YouClass(2, "ijm");
out.println( ycls.toString() );
// 자동 inport된다 그러니까 자바 코드는 Java Resources에 있는 게 좋다

out.println( func() );
// 바로 바로 써야하는 함수는 선언부에 넣는 경우도 있다
// 클래스를 만들면 찾아 들어가야하는 번거로움이 있다
out.println( UtilClass.func() );
%>



</body>
</html>