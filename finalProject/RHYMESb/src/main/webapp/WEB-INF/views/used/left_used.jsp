<%@page import="org.springframework.security.core.userdetails.UserDetails"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<% String ctx = request.getContextPath(); %>
<script type="text/javascript" src="<%=ctx%>/js/used/used_left.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<div class="sidenav">
	<font style="font-size: 15px;"><b>MARKET</b></font>
	<hr width = "85%" color = "#DADCE0">
		<a href="#none" onclick="category(this)" val="">ALL</a>
		<a href="#none" onclick="category(this)" val="�����Ƿ�">���� �Ƿ�</a>
		<a href="#none" onclick="category(this)" val="�����Ƿ�">���� �Ƿ�</a>
		<a href="#none" onclick="category(this)" val="�м���ȭ">�м� ��ȭ</a>
		<a href="#none" onclick="category(this)" val="��Ƽ�̿�">��Ƽ �̿�</a> 
	<c:if test="${login.userid ne null}">
	 	<a href="#none" id="usedwrite">�Ǹ� ���</a>
	</c:if>
	 <c:if test="${login.userid eq null}"/>
</div>

<script>

$(document).ready(function() {
	
	$("#usedwrite").click(function() {	// ���� �ۼ��� ���� ���̺� ����� �Ǿ��ִ��� ���θ� Ȯ���ϰ� ����� �Ǿ����� ������ �Ǹŵ�� �˾�â���� �̵��Ѵ�.
		var id ="${login.userid}";
		
	$.ajax({
		url:"/used/getSeller",
		type:"get",
		data:{
			s_id:id
		},
		success:function(data){
			var count = parseInt(data);
			if(count > 0){
				location.href="usedwrite";
			} else {
				 var con_test = confirm("�Ǹ��� ����� �ʿ��մϴ� �̵��Ͻðڽ��ϱ�?");	
				 
				 if(con_test == true){
			 			popupOpen();
				 }
					 else if(con_test == false){
					
					 }
			}
			
		},
		error:function(e){
			alert(e);
		}	
	})		
	
	})
})
</script>