<%@page import="dao.CustuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("utf-8");
//고객정보 삭제할 때 인코딩을 해야 한글이 안 깨진다

String[] delArr = request.getParameterValues("delck");

for(int i = 0; i < delArr.length; i++){
	//System.out.println("delArr : " + delArr[i]);
}

CustuserDao dao = CustuserDao.getInstance();

/*
// DB에 여러번 들어가서 삭제한다
boolean b = false;
for(int i = 0; i < delArr.length; i++){
	b = dao.delcustuser(delArr[i]);
	//System.out.println("b : " + b);
	
	if(b == true){
		System.out.println("ID : " + delArr[i] + " 삭제 됨");
	}else{
		System.out.println("삭제 안됨");
	}
}

pageContext.forward("custuserlist.jsp");
/**/



// DB에 한번만 들어가서 삭제한다
boolean isSucess = dao.delcustusers(delArr);
if(isSucess){
%>
	<script type="text/javascript">
	alert("정상 삭제 되었습니다");
	location.href = "custuserlist.jsp";
	</script>
<%	
}else{
%>
	<script type="text/javascript">
	alert("정상 삭제 되지 않았습니다");
	location.href = "custuserlist.jsp";
	</script>
<%
}




%>

</body>
</html>