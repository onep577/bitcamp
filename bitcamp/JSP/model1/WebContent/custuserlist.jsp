<%@page import="dto.CustuserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
CustuserDao dao = CustuserDao.getInstance();
// 싱글톤
List<CustuserDto> list = dao.getCustuserList();
// db로 들어가서 정보를 가져왔다
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>custuserlist.jsp</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js">
</script>


</head>
<body>

<div align="center">
<form action="muldel.jsp" name="frm" onsubmit="return frmsubmit()" method="post">

<table style="width: 700">
<col width="100"><col width="300"><col width="300">

<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
<tr bgcolor="yellow">
	<th>
		<input type="checkbox" name="alldel" onclick='deleteChecks( this.checked )'>
	</th>
	<th>ID</th>
	<th>Name</th>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>

<%
if(list.size() == 0){
	// 데이터가 없을 때
%>
	<tr bgcolor="#FFB2D9">
		<td colspan="3" align="center">고객 리스트가 존재하지 않습니다</td>
	</tr>
	<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
	</tr>
<%
}else{
	// 데이터가 있을 때
//	for(int i = 0; i < list.size(); i++){
//		CustuserDto cust = list.get(i);
	for(CustuserDto cust : list){
		// 위에 for문과 같은 코드이다
		%>
		<tr bgcolor="#FFB2D9">
			<td align="center" bgcolor="yellow">
			<input type="checkbox" name="delck" value="<%=cust.getId() %>">
			</td>
			<td>
				<%=cust.getId() %>
			</td>
			<td>
				<a href="custuserdetail.jsp?id=<%=cust.getId() %>"><%=cust.getName() %></a>  
			</td>
		</tr>
		<tr>
			<td height="2" bgcolor="#0000ff" colspan="3"></td>
		</tr>
		<%
	}
}
%>

<tr>
	<td align="center" height="1" bgcolor="#c0c0c0" colspan="3">
		<input type="submit" value="고객정보 삭제">
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>

<tr bgcolor="#f6f6f6">
	<td colspan="3">
		<a href="custadd.jsp">고객정보 추가</a>
	</td>
</tr>

</table>

</form>
</div>



<script type="text/javascript">
function frmsubmit(){
	// 체크 되어있는 고객이 없을 때 submit을 막아준다
	
	//var count = 0;
	for(var i = 0; i < document.frm.delck.length; i++){
		//alert(count);
		//count++;
		if( document.frm.delck[i].checked == true ){
			return true;
		}
	}
	alert("삭제 할 고객이 없습니다");
	return false;
}

function deleteChecks( e ){
	//alert( e ); // true, false로 온다

	var arr = document.getElementsByName("delck");
	// 현재 체크박스를 다 가져왔다
	
	for(i = 0; i < arr.length; i++){
		arr[i].checked = e;
		// e는 상태이다
	}
}
</script>



</body>
</html>