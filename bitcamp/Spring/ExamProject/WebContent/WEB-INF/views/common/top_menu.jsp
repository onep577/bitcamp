<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="top_menu_wrap">
	<div id="_top_menu">
		<ul class="navi">
			<li><a href="polllist.do" title="HOME">HOME</a></li>
			<li><a href="polllist.do" title="투표">투표</a></li>
			
			<c:if test="${login.auth eq '2' }">
			<li class="menu_item">
				<a href="pollmake.do" title="투표만들기">투표만들기</a>
			</li>
			</c:if>

		</ul>
	</div>
</div>



