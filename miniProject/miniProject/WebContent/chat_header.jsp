<%-- <%@page import="dto.CustomerDto"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="/miniProject/js/jquery.min.js"></script>
 
<link rel="stylesheet" href="/miniProject/css/bootstrap.css">

<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,300,400,500,700,900&display=swap&subset=korean" rel="stylesheet">
<script type="text/javascript" src="/miniProject/js/jquery.cookie.js"></script>

<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" rel="stylesheet" />
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script> -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>

<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" />


<style type="text/css">



#hbox2{
	width: 100%;
	height: auto;
	float: left;
	margin-bottom: 10px;
}
.allfont{
  	font-family: 'Noto Sans KR', sans-serif;
  	color: gray;
}

body {
  margin: 0px;
  padding: 0px;
}
.jbMenu {
  text-align: center;
  background-color: #f1f1f1;  
  padding: 10px 0px;
  width: 100%;
  z-index: 5;  
}
.jbContent {
  height: 2000px;
}
.jbFixed {
  position: fixed;
  top: 0px;
  margin-top: 0px;
  box-shadow: 10px 0px 10px 5px #e1e1e1;
}

a:hover{
	text-decoration: none;
}    
#btn{
	background-color: #111111;
	color: #ffffff;
}
#btn:hover{
   background-color: #2A7BD6;
   color: #ffffff;
}
</style>

</head>

<body>

<%--
CustomerDto user = (CustomerDto)session.getAttribute("login");
request.setAttribute("_user", user);
--%>


	
	<div id="hbox2">
		
	    <div class="jbMenu" align="center">
	    	<a class="allfont" style="font-size: 2em; margin: 0;">라이브채팅</a>
	    	<a class="allfont" style="margin-left: 30px;" href="javascript:window.close()">
	    		<img alt="" src="./image/exit_icon.png" 
	    			style="width: 5%; height: 5%;">
	    	</a>	    	
	    </div>
	    
	</div>






<script type="text/javascript">


$( document ).ready( function() {
    var jbOffset = $( '.jbMenu' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '.jbMenu' ).addClass( 'jbFixed' );
      }
      else {
        $( '.jbMenu' ).removeClass( 'jbFixed' );
      }
    });
});
  
  
</script>

<!-- <script type="text/javascript" src="js/bootstrap.js"></script> -->
</body>
</html>