<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head> 
 <meta charset="UTF-8">

    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!--   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
   
   
   <!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>


    <!-- Core Stylesheet -->
    <link href="/css/main/common/style.css" rel="stylesheet">

    <!-- Responsive CSS -->
    <link href="/css/main/responsive/responsive.css" rel="stylesheet">
</head>

<body>

	<!-- ****** Footer Menu Area Start ****** -->
	<div id="footer_wrap" style="background-color: #eaeaea">
		<footer id="footer_wrap" style="align-content: center;">
			<div class="container" style="align-content: center;">
				<div class="row " style="align-content: center;">
					<div class="col-12" style="align-content: center;">
						<br>
						<br>
						<div style="align-content: center;">
							<div style="float: left; padding-left: 50px">
								<h4>COMPANY</h4>
								<div>
									<h6>ABOUT US</h6>
									<p>
										<br>© 2019 <a style="color: #B7DC57">RHYMES</a> - ALL
										RIGHTS RESERVED. <br>ALL IMAGES HAVE BEEN TAKEN BY
										RHYMES. <br>RHYMESb | TEL. +82-2-3486-9600 <br>459,
										GANGNAM-DAERO, SEOCHO-GU, SEOUL, KOREA. <br>MAIL-ORDER
										LICENCE 2019-SEOULGANGNAM-0920 <br>BUSINESS LICENCE
										520-88-190920
									</p>
								</div>
							</div>

							<div style="float: left; padding-left: 200px">
								<h4>STORES</h4>
								<div>
									<h6 style="color: #B7DC57">RHYMES</h6>
									<p>
										TEL. +82-2-3486-9600<br /> 459, GANGNAM-DAERO, SEOCHO-GU,
										SEOUL, KOREA.<br />
									</p>

									<h6 style="color: #B7DC57">RHYMES OUTLET</h6>
									<p>
										TEL. +82-2-3486-9600<br /> 459, GANGNAM-DAERO, SEOCHO-GU,
										BAEKAM BLD 5F,<br /> SEOUL, KOREA.<br />
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
			<div class="container">
				<div class="row">
					<div class="col-12">
						<!-- Copywrite Text -->
						<div class="copy_right_text text-center">
							<p>
								Copyright @2019 All rights reserved | This template is made with
								<i class="fa fa-heart-o" aria-hidden="true"></i> by <a
									href="https://colorlib.com" target="_blank">Colorlib</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</footer>
	</div>
<!-- ****** Footer Menu Area End ****** -->


<%String ctx = request.getContextPath(); %>
<!-- Jquery-2.2.4 js -->
<script src="<%=ctx %>/js/jquery/jquery-2.2.4.min.js"></script>
<!-- Popper js -->
<script src="<%=ctx %>/js/bootstrap/popper.min.js"></script>
<!-- Bootstrap-4 js -->
<script src="<%=ctx %>/js/bootstrap/bootstrap.min.js"></script>
<!-- All Plugins JS -->
<script src="<%=ctx %>/js/others/plugins.js"></script>
<!-- Active JS -->
<script src="<%=ctx %>/js/active.js"></script>

</body>
</html>

