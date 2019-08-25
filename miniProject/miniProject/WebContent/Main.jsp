<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<style type="text/css">

main{
	width: 100%;
	margin: auto;
}

</style>

</head>

<body>

<jsp:include page="header.jsp" flush="false"/>

<main>

<div id="myCarousel" class="carousel slide" data-ride="carousel"> 
	

	<!--페이지-->

	<div class="carousel-inner">
		<!--슬라이드1-->
		<div class="item active"> 
			<img src="./image/Mainimg1.jpg" style="width:100%; height: 819px" alt="First slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드1-->

		<!--슬라이드2-->
		<div class="item"> 
			<img src="./image/Mainimg2.jpg" style="width:100%; height: 819px;" data-src="" alt="Second slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드2-->
		
		<!--슬라이드3-->
		<div class="item"> 
			<img src="./image/Mainimg3.jpg" style="width:100%; height: 819px;" data-src="" alt="Third slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드3-->
		
		<!--슬라이드4-->
		<div class="item"> 
			<img src="./image/Mainimg4.jpg" style="width:100%; height: 819px;" data-src="" alt="fourth slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드4-->
		
		<!--슬라이드5-->
		<div class="item"> 
			<img src="./image/Mainimg5.jpg" style="width:100%; height: 819px;" data-src="" alt="Fifth slide">
			<div class="container">
				<div class="carousel-caption">
				</div>
			</div>
		</div>
		<!--슬라이드5-->
	</div>
	
	<!--이전, 다음 버튼-->
	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a> 
	<a class="right carousel-control" href="#myCarousel" data-slide="next" style="margin: 0px;"><span class="glyphicon glyphicon-chevron-right"></span></a> 
</div>
</main>

<jsp:include page="footer.jsp" flush="false"/>



</body>
</html>