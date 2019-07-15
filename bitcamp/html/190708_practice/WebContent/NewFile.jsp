<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
System.out.println("-------------");
String name = request.getParameter("name");
System.out.println(name);

String r[] = request.getParameterValues("r");
if(r != null && r.length > 0){
	for(int i = 0; i < r.length; i++){
		System.out.println(r[i]);
	}
}

String c[] = request.getParameterValues("c");
if(c != null && c.length > 0){
	for(int j = 0; j < c.length; j++){
		System.out.println(c[j]);
	}
}

String textArea = request.getParameter("textArea");
System.out.println(textArea);

String select = request.getParameter("select");
System.out.println(select);


%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>