<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
//String job = request.getParameter("job");
//System.out.println("job : " + job);

String jobs[] = request.getParameterValues("job");
// jobs가 생성되지 않았을 수 있어서 null값이 아닌 후 두번째로 조건문 걸어줘야한다
if(jobs != null && jobs.length > 0){
	for(int i = 0; i < jobs.length; i++){
		System.out.println(jobs[i]);
	}
}
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