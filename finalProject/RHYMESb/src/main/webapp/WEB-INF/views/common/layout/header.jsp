<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal" var="prc"/>
<% String ctx = request.getContextPath(); %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<head> 
<meta charset="UTF-8">

<!-- Core Stylesheet -->
<link href="/css/main/common/style.css" rel="stylesheet">
<link href="/css/main/common/header.css" rel="stylesheet">

<!-- Responsive CSS -->
<link href="/css/main/responsive/responsive.css" rel="stylesheet">

<!-- 아이콘 활용을 위한 font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css">

<!-- 부트스트랩 -->
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

</head>

<body translate="no">


    <!-- ****** Top Header Area Strt ****** -->
<!--     <div class="top_header_event_area">                   
    	
    </div> -->
   
    <div class="top_header_area" >
        <div class="container">
            <div class="row">
                <div class="col-5 col-xs-6"> 
                    <div class="top_social_bar">
                        			
                    
                    <!--  맨위에 sns 아이콘들 -->
                    <div class="top_social_bar">
                        <a href="#"><i class="fa fa-facebook" aria-hidden="true"style="color: #C5E917;" ></i></a>
                        <a href="#"><i class="fa fa-twitter" aria-hidden="true"style="color: #C5E917"></i></a>
                        <a href="https://www.instagram.com/rhymesstore/?igshid=16e3i1e5qn8aq"><i class="fa fa-instagram" aria-hidden="true" style="color: #C5E917"></i></a>

                    </div>


                    </div>
                </div>
                
                <!--  Login Register Area  -->
                <div class="col-7 col-xs-6">
                    <div class="signup-search-area d-flex align-items-center justify-content-end">
                        <div class="login_register_area d-flex">

							<c:if test="${prc eq 'anonymousUser' }">
	                            <div class="login">
	                                <a href="/member/login">Login</a>
	                            </div>
	                            <div class="join">
	                                <a href="/member/regiMain">Join</a>
	                            </div>
	                        </c:if>

	                        <c:if test="${prc ne 'anonymousUser' }">
		                        	<div class="">
		                        		<span style="font-size: 14px">안녕하세요 ${userloginid } 님  &nbsp;</span>
		                        	</div>
		                        	&nbsp;&nbsp;
		                        	<div class="logout">
			                        	<form action="/logout" method='post' id="_logfrm">
										<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
										</form>
			                        	<span class="_logout" style="margin-right: 13px; border-right: 2px solid #c2c2c2;padding-right: 13px;font-size: 13px; color: #222; font-weight: 500;">
			                        	Logout
		                        		</span>
		                        	</div>
	                        </c:if>
	                        <div class="admin">
	                        <c:if test="${prc ne 'anonymousUser' }">
								<c:forEach items="${prc.authorities  }" var="auth">
									<c:if test="${auth eq 'ROLE_ADMIN' || auth eq 'ROLE_SELLER' }">
			                       		<a href="/admin/main">Admin</a>
			                       	</c:if>
								</c:forEach>
							</c:if>
							</div>
	  
	  						<c:if test="${prc ne 'anonymousUser' }">
	                            <div class="mypage">
	                                <a href="/mypage/orderlog">Mypage</a>
	                            </div>
                            </c:if>
                            <c:if test="${prc eq 'anonymousUser' }">
	                            <div class="mypage">
	                                <a href="/member/login">Mypage</a>
	                            </div>
                            </c:if>
                            
                            <c:if test="${prc eq 'anonymousUser' }">
	                            <div class="order">
	                                <a href="/ordercheck_nomembership_confirm_move">Order</a>
	                            </div>	                            
                             </c:if>
                             
	                            <div class="cart">
	                                <a href="/store/basket">Cart</a>
	                            </div>
	                            
	                            <div class="search">
	                                <a href="#" class="search_btn">Search</a>
	                            </div>
	                            
                        </div>
                    </div>
                    
                </div>
                
            </div>
            
        </div>
    </div>
    <!-- ****** Top Header Area End ****** -->    
    
<br><br>

    <!-- ****** Header Area Start ****** -->
    <header class="header_area">
        <div class="container">
            <div class="row">
            
                <!-- Logo Area Start -->
                <div class="col-12" >
                    <div class="logo_area text-center">

				<a href="<%=ctx%>/main" id="logo"><img src="/img/main-img/core-img/banner.png" style="width: 150px" ></img></a>

                    </div>
                </div>
            </div>
            
             
<div class="menuWrap">
<div class="blogmenu">
            <div class="row" >
                <div class="col-12">
                    <nav class="navbar navbar-expand-lg">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#rhymesshop-nav" aria-controls="rhymesshop-nav" aria-expanded="false" aria-label="Toggle navigation"><i class="fa fa-bars" aria-hidden="true"></i> Menu</button>
                        
                        <!-- Menu Area Start -->
                        <div class="collapse navbar-collapse justify-content-center" id="rhymesshop-nav">
                            <ul class="navbar-nav" id="rhymes-nav">
                            
                                <li class="nav-item">
                                    <a class="nav-link" href="/store/productList?c1_name=WOMEN">WOMEN</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/store/productList?c1_name=MEN">MEN</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/used/usedlist">MARKET</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/event/eventmain?code=all">EVENT</a>
                                </li>
                                <li class="nav-item">
                           			<a class="nav-link" href="/customercenter/noticelist">CUSTOMER CENTER</a>
                           		</li>
                           		
                            </ul>
                        </div>
                    </nav>
                </div>
            </div>
            </div>
            </div>
        </div>
    </header>

<!-- 검색 modal -->
<div class='modal' id="search_modal">
	<div class="modal-content2">
		
		<div id="modal_s">

			<input type="radio" name='mwChk' id="mChk" class="_mwChk" style="display:none; padding: 10px" value="MEN">
			<label for="mChk" class="mwRadioL" style="cursor: pointer; background-color: white; padding: 10px">MEN</label>
			
			<input type="radio" name='mwChk' id="wChk" class="_mwChk" style="display:none; padding: 10px" value="WOMEN">
			<label for="wChk" class="mwRadioL" style="cursor: pointer; background-color: white; padding: 10px">WOMEN</label>

			<input type="text" id="searchWord" style="widht:500px;" placeholder="SEARCH" onkeypress="if( event.keyCode==13 ){search();}" autocomplete="searchWord">

			<img src="/img/store-img/search.png" style="width:40px; height:40px; cursor:pointer;" onclick="search()">  <!-- id="m_search_btn" -->&nbsp;
		</div>
	
	</div>
</div>
<!-- 검색 -->
<form action="/store/productList" method="get" id='searchFrm'>
	<input type='hidden' name="criterion" value="all_search">	
	<input type="hidden" name="keyword" class="keyword" value="">
	<input type="hidden" name="c1_name" class="c1_name" value="">
</form>


    
<a id="backToTop" class="scrolltop" href="#">
      <i class="fas fa-chevron-circle-up"></i>
    </a>
    
    <!-- ****** Header Area End ****** -->
       
    <!-- nav바 밑으로 내리면 상단에 고정시켜주는 코드-->
     <script type=text/javascript>
	$(document).ready(function(){
		
	    var nav = $('.menuWrap');
	    $(window).scroll(function () {
	        if ($(this).scrollTop() > 312) {
	            nav.addClass("float-menu");
	        }else {
	            nav.removeClass("float-menu");
	        }
	    });
	});
	
	jQuery(document).ready(function () {
        $(window).scroll(function () {
          if ($(this).scrollTop() > 100) {
            $('#backToTop').fadeIn(500);
          } else {
            $('#backToTop').fadeOut('slow');
          }
        });
        $('#backToTop').click(function (e) {
          e.preventDefault();
          $('html, body').animate({scrollTop: 0}, 200);
        });
      });
	
	
	</script>
	
	<!-- logout -->
	<script type="text/javascript">
		
			$("._logout").click(function(){
				$("#_logfrm").attr("action", "/logout").submit();
			});
			
			$("._logout").mouseover(function(){
				$(this).css("cursor", "pointer");
			});
			
		
	</script>
	
	
	<!-- 검색 search -->
	<script type="text/javascript">
	
	function search(){
		var c1_name = $("input[name='mwChk']:checked").val();
		var keyword = $("#searchWord").val();
		
		if(keyword != ""){
			if(keyword.length < 12){
				$(".c1_name").val(c1_name);
				$(".keyword").val(keyword);
				$("#searchFrm").submit();
			}else{
				alert("검색어가 너무 길어요");
			}
		}
	}

	// 검색모달 성별 선택
	$(document).on('click', '.mwRadioL', function(){
		$(".mwRadioL").attr('style', 'background-color:white');
		$(this).attr('style', 'background-color:#d7fd75');
			
	});

	/* 검색모달 영역 외 클릭시 close */
	$('body').click(function(e){
		 if($(".modal").css("display") == "block") {
	        if(!$('.modal, .modal').has(e.target).length) { 
	        	//$(".modal").css("display", "none");
	        	$(".modal").fadeOut();
	        	/* 검색창 초기화 */
	        	$("#searchWord").val('');
	        	$("input:radio[name='mwChk']").prop("checked", false);
	        	$(".mwRadioL").attr('style', 'background-color:white');
	         } 
	 	 }
	});

	/* 검색(모달)버튼 클릭 */
	$(document).on('click', '.search_btn', function(){
		/* $("#search_modal").css("display", "block"); */
		$("#search_modal").fadeIn();
	});

	$(document).on('click', '.brandClick', function(){
		var c_name = $(this).html();
		$(".keyword").val(c_name);
		$("#brandClickFrm").submit();
	});	
	
	</script>
	
	</body>

</html>