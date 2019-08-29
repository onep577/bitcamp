<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!-- 아래 코드와 같다 -->
<jsp:useBean id="nows" class="java.util.Date"/>
<%--
Date nows = new Date();
--%>


<div style="width: 100%; height: 53px; border-bottom: 1px solid #5e5e5e;">
	<div style="width: 100%; height: 100%; clear: both; display: inline-block;">

	<div id="_title_image" style="width: 20%; float: left; display: inline;">
		<img alt="이미지없음" src="image/bbslogo1.jpg" style="height: 53px">
	</div>

	<div id="_title_today" style="width: 70%; float: left; text-align: right;">
		<div style="position: relative; top: 27px;">
		
			<c:if test="${login.id ne '' }">
				<a href="logout.do" title="로그아웃">[로그아웃]</a>&nbsp;&nbsp;&nbsp;
			</c:if>
			
			<c:if test="${login.name ne '' }">
				[${userId }]님 환영합니다
			</c:if>

			<fmt:formatDate value="${nows }" var="now" pattern="yyyy/mm/dd" />
			${now }			
		</div>
	</div>


	</div>
</div>

