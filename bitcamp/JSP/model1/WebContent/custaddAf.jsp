<%@page import="dao.CustuserDao"%>
<%@page import="dto.CustuserDto"%>
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
// 고객정보 추가할 때 인코딩을 해야 한글이 안 깨진다

String id = request.getParameter("id");
String name = request.getParameter("name");
String addr = request.getParameter("addr");

//System.out.println("id : " + id);
//System.out.println("name : " + name);
//System.out.println("addr : " + addr);

CustuserDao dao = CustuserDao.getInstance();

int count = dao.addCustuser(id, name, addr);
//System.out.println("count : " + count);

//pageContext.forward("custuserlist.jsp");
if(count > 0){
%>
	<script type="text/javascript">
	alert("정상 추가되었습니다");
	location.href = "custuserlist.jsp";
	</script>
<%
}else{
%>
	<script type="text/javascript">
	alert("정상 추가되지 않았습니다");
	location.href = "custuserlist.jsp";
	</script>
<%
}
%>

</body>
</html>