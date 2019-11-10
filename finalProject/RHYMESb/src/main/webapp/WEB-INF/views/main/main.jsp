 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String ctx = request.getContextPath(); %>


<!DOCTYPE html>
<html lang="en">
<head> 
 <meta charset="UTF-8">
 
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Core Stylesheet -->
    <link href="/css/main/common/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/css/main/responsive/responsive.css" rel="stylesheet">

</head> 

<body>
   
      <div class="mainpick-wrapper"> 
	   <div class="mainpick"> 
		   <div class="centered"> 
		   	<c:if test ="${dto.mainbanner_type eq 'VIDEO'}" >
		    	<video src='/upload/mainresource/${dto.mainbanner_file}' style="width: 90%;height: 10%" loop="loop" autoplay="autoplay"></video>
		    	<%-- <video src="/upload/mainresource/${dto.mainbanner_file }"width="90%" height="10%" loop="loop" autoplay="autoplay"></video> --%>						
		    </c:if>
		
			<c:if test = "${dto.mainbanner_type eq 'PHOTO'}" >
		    	<img src="/upload/mainresource/${dto.mainbanner_file}"></img>     
		    </c:if> 
		   </div> 
	   </div> 	 
     </div>     

 <br>
 


    <br><br><br><br><br><br><br><br>
   
    
    
<h4 style="margin-left: 60px; color: gray">WOMEN BEST7</h4>
<br>
<!-- ****** Welcome Post Area Start ****** -->
    <section class="welcome-post-sliders owl-carousel" >
		<!-- Single Slide -->
		<c:forEach items="${womenbest }" var="women" varStatus="vs">
        <div class="welcome-single-slide" onclick="location.href='/store/productDetail?p_seq=${women.p_seq}&c1_name=${women.c1_name }'" style="cursor:pointer; ">
            <!-- Post Thumb -->
            <img src="/upload/store/${women.photo1_file }" alt="사진없음">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                	<a href="#" style="font-size: 20px">${women.rnum }</a>
                    <a href="#" style="font-size: 20px">${women.c2_name }</a>
                </div>
                    <h6 style="color: white;">${women.c_name }</h6>
                    <h5 style="color:white">${women.p_name }</h5>
            </div>
        </div>
        </c:forEach>
    </section>
    <br><br><br><br>
       
   
   <div class="thumbnail-wrapper"> 
	   <div class="thumbnail"> 
		   <div class="centered"> 
		   	<img src="/upload/mainresource/${dto.photo1_file}"></img> 
		   </div> 
	   </div> 
	   <div id="bannertext" align="center">
	   <h3 style="color: black">${dto.photo1_title}</h3>
     <br>
     <p style="font-size: 15px">${dto.photo1_content}</p>     
     <a href="http://localhost:18080/store/productDetail?p_seq=1071&c1_name=WOMEN&c2_name=WOMEN&c3_name=WOMEN&keyword=" class="mainbuybtn">구매하기</a>
     
    
     </div>
   </div>
   <br><br><br><br><br><br>
   


       
       
    <h4 style="margin-left: 60px; color: gray">MEN BEST7</h4>
	<br>
<!-- ****** Welcome Post Area Start ****** -->
    <section class="welcome-post-sliders owl-carousel">
		<!-- Single Slide -->
		<c:forEach items="${menbest }" var="men" varStatus="vs">
        <div class="welcome-single-slide" onclick="location.href='/store/productDetail?p_seq=${men.p_seq}&c1_name=${men.c1_name }'" style="cursor:pointer;">
            <!-- Post Thumb -->
            <img src="/upload/store/${men.photo1_file }" alt="사진없음">
            <!-- Overlay Text -->
            <div class="project_title">
                <div class="post-date-commnents d-flex">
                    <a href="#" style="font-size: 22px">${men.rnum }</a>
                    <a href="#" style="font-size: 20px">${men.c2_name }</a>
                </div>
                
		               <h6 style="color: white;">${men.c_name }</h6>
		               <h5 style="color:white">${men.p_name }</h5>
            </div>
        </div>
        </c:forEach>
    </section>   
    
    <br><br><br><br>
    <!-- ****** Welcome Area End ****** -->
    
    
     <div class="thumbnail-wrapper"> 
	   <div class="thumbnail"> 
		   <div class="centered"> 
		   	<img src="/upload/mainresource/${dto.photo2_file}"></img> 
		   </div> 
	   </div> 
	   <div id="bannertext" align="center">
	   <h3 style="color: black">${dto.photo2_title}</h3>
     <br>
     <p style="font-size: 15px">${dto.photo2_content}</p>     
     <a href="http://localhost:18080/store/productDetail?p_seq=1072&c1_name=MEN&c2_name=MEN&c3_name=MEN&keyword=" class="mainbuybtn">구매하기</a>
     </div>
   </div>
   <br><br><br><br><br><br>




    <div align="center">
    <video src='/upload/mainresource/${dto.video1_file}' style="width: 90%; height: 10%" loop="loop" autoplay="autoplay"></video>
     <br><br>
     <h3 style="color: black">${dto.video1_title}</h3>
     <br> 
	<p style="font-size: 15px">${dto.video1_content}</p>
     <a href="http://localhost:18080/store/productDetail?p_seq=1107&c1_name=WOMEN&c2_name=WOMEN&c3_name=WOMEN&keyword=" class="mainbuybtn">구매하기</a>
   </div>
   <br><br><br><br><br><br>
   
   
  <div align="center">
    <video src='/upload/mainresource/${dto.video2_file}' style="width: 90%;height: 10%;" loop="loop" autoplay="autoplay"></video>
     <br><br>
     <h3 style="color: black">${dto.video2_title}</h3>
     <br> 
	<p style="font-size: 15px">${dto.video2_content}</p>    
     <a href="http://localhost:18080/store/productDetail?p_seq=1070&c1_name=WOMEN&c2_name=WOMEN&c3_name=WOMEN&keyword=" class="mainbuybtn">구매하기</a>
   </div>
   <br><br><br><br><br><br>
    <!-- 추천 상품 끝 -->



<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-de7e2ef6bfefd24b79a3f68b414b87b8db5b08439cac3f1012092b2290c719cd.js"></script>

<script id="rendered-js">
      $('.header').on('click', '.search-toggle', function (e) {
  var selector = $(this).data('selector');

  $(selector).toggleClass('show').find('.search-input').focus();
  $(this).toggleClass('active');

  e.preventDefault();
});

    </script>
    
    </body>
   
   
    