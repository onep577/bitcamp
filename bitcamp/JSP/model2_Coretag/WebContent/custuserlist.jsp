<%@page import="dto.CustuserDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.CustuserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jar 파일 두개 추가, 링크 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
/*
List<CustuserDto> list = (List<CustuserDto>)request.getAttribute("custlist");
/**/
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
<form action="custusercontrol" name="frm" onsubmit="return frmsubmit()" method="post">
	<input type="hidden" name="command" value="muldel">
	<!-- 파라미터로 넘어가는 것 -->

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






<c:if test="${fn:length(custlist) == 0 }">
	list:<c:out value="${custlist}"></c:out>
	
	<tr bgcolor="#FFB2D9">
		<td colspan="3" align="center">고객 리스트가 존재하지 않습니다</td>
	</tr>
	<tr>
		<td height="2" bgcolor="#0000ff" colspan="3"></td>
	</tr>

</c:if>


<c:if test="${fn:length(custlist) != 0 }" >
	<%-- list:<c:out value="${custlist}"></c:out> --%>
	
	<c:forEach begin="0" end="${fn:length(custlist)-1 }" step="1" varStatus="i">
	<%-- <c:out value="${i.index }"></c:out> --%>

		<tr bgcolor="#FFB2D9">
			<td align="center" bgcolor="yellow">
			<input type="checkbox" name="id" value="${custlist[i.index].id }">
			</td>
			<td>
				${custlist[i.index].id }
			</td>
			<td>
				<a href="custusercontrol?command=detail&id=${custlist[i.index].id }" >
				${custlist[i.index].name }</a>
			</td>
		</tr>
		<tr>
			<td height="2" bgcolor="#0000ff" colspan="3"></td>
		</tr>
	
	</c:forEach>
</c:if>









<tr>
	<td bgcolor="yellow">
	</td>
	<td align="center" bgcolor="#c0c0c0">
		<a href="custusercontrol?command=insert">고객정보 추가</a>
	</td>
	<td align="center" height="1" bgcolor="#c0c0c0">
		<input type="hidden" name="command" value="">
		<input type="submit" id="delBtn" value="고객정보 삭제">
	</td>
</tr>
<tr>
	<td height="2" bgcolor="#0000ff" colspan="3"></td>
</tr>
</table>
</form>



<form action="custusercontrol" method="post">
<table>
<tr bgcolor="#aabb44">
	<td colspan="2">
		<select name="sel">
			<option value="id" selected>id 검색</option>
			<option value="name">name 검색</option>
		</select>
		<input type="text" name="selText">
	</td>
	<td>
		<input type="hidden" name="command" value="select">
		<input type="submit" value="검색">
	</td>
</tr>
</table>
</form>
</div>






<script type="text/javascript">
function frmsubmit(){
	// 체크 되어있는 고객이 없을 때 submit을 막아준다
	
	//var count = 0;
	for(var i = 0; i < document.frm.id.length; i++){
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