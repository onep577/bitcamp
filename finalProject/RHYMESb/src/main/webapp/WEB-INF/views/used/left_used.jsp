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
		<a href="#none" onclick="category(this)" val="남성의류">남성 의류</a>
		<a href="#none" onclick="category(this)" val="여성의류">여성 의류</a>
		<a href="#none" onclick="category(this)" val="패션잡화">패션 잡화</a>
		<a href="#none" onclick="category(this)" val="뷰티미용">뷰티 미용</a> 
	<c:if test="${login.userid ne null}">
	 	<a href="#none" id="usedwrite">판매 등록</a>
	</c:if>
	 <c:if test="${login.userid eq null}"/>
</div>

<script>

$(document).ready(function() {
	
	$("#usedwrite").click(function() {	// 글을 작성시 셀러 테이블에 등록이 되어있는지 여부를 확인하고 등록이 되어있지 않으면 판매등록 팝업창으로 이동한다.
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
				 var con_test = confirm("판매자 등록이 필요합니다 이동하시겠습니까?");	
				 
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