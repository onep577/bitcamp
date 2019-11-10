<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <sec:authentication property="principal" var="prc" />
<% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<!-- Topbar -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

  <!-- Sidebar Toggle (Topbar) -->
  <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
    <i class="fa fa-bars"></i>
  </button>

  <!-- Topbar Search -->
<!--   <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
    <div class="input-group">
      <input type="text" class="form-control bg-light border-0 small" placeholder="header Search..." aria-label="Search" aria-describedby="basic-addon2">
      <div class="input-group-append">
        <button class="btn btn-primary" type="button">
          <i class="fas fa-search fa-sm"></i>
        </button>
      </div>
    </div>
  </form> -->

  <!-- Topbar Navbar -->
  <ul class="navbar-nav ml-auto">

    <!-- Nav Item - Search Dropdown (Visible Only XS) -->
    <li class="nav-item dropdown no-arrow d-sm-none">
      <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-search fa-fw"></i>
      </a>
      <!-- Dropdown - Messages -->
      <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
        <form class="form-inline mr-auto w-100 navbar-search">
          <div class="input-group">
            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
            <div class="input-group-append">
              <button class="btn btn-primary" type="button">
                <i class="fas fa-search fa-sm"></i>
              </button>
            </div>
          </div>
        </form>
      </div>
    </li>

    <!-- Nav Item - Alerts -->
    <c:if test="${prc ne 'anonymousUser' }">
    <c:forEach items="${prc.authorities  }" var="auth">
			<c:if test="${auth eq 'ROLE_ADMIN' }">
			    <li class="nav-item dropdown no-arrow mx-1">
			      <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			        <i class="fas fa-bell fa-fw"></i>
			        <!-- Counter - Alerts -->
			        <c:if test="${newmemcount >0}">
			        	<span class="badge badge-danger badge-counter">new</span>
			        </c:if>
			      </a>
			      <!-- Dropdown - Alerts -->
			      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
			        <h6 class="dropdown-header">
			          Alerts Center
			        </h6>
			        <a class="dropdown-item d-flex align-items-center" id="alarm">
			          <div class="mr-3">
			            <div class="icon-circle bg-primary">
			              <i class="fas fa-file-alt text-white"></i>
			            </div>
			          </div>
			          <div>
			            <div class="small text-gray-500">
			            	<span id="_today"></span>
			            	<input type="hidden" id="hidden_today">
			            </div>
			            	<font style="font-size: small;">오늘의 신규회원[${newmemcount }]</font>
			          </div>
			        </a>
			      </div>
			    </li>
	    	</c:if>
	    </c:forEach>
	</c:if>
    <!-- Nav Item - Messages -->
<!--     <li class="nav-item dropdown no-arrow mx-1">
      <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <i class="fas fa-envelope fa-fw"></i>
        Counter - Messages
        <span class="badge badge-danger badge-counter">7</span>
      </a>
      Dropdown - Messages
      <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
        <h6 class="dropdown-header">
          Message Center
        </h6>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
            <div class="status-indicator bg-success"></div>
          </div>
          <div class="font-weight-bold">
            <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
            <div class="small text-gray-500">Emily Fowler Â· 58m</div>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
            <div class="status-indicator"></div>
          </div>
          <div>
            <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
            <div class="small text-gray-500">Jae Chun Â· 1d</div>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
            <div class="status-indicator bg-warning"></div>
          </div>
          <div>
            <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
            <div class="small text-gray-500">Morgan Alvarez Â· 2d</div>
          </div>
        </a>
        <a class="dropdown-item d-flex align-items-center" href="#">
          <div class="dropdown-list-image mr-3">
            <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
            <div class="status-indicator bg-success"></div>
          </div>
          <div>
            <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
            <div class="small text-gray-500">Chicken the Dog Â· 2w</div>
          </div>
        </a>
        <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
      </div>
    </li>
 -->
    <div class="topbar-divider d-none d-sm-block"></div>

    <!-- Nav Item - User Information -->
    <li class="nav-item dropdown no-arrow">
      <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <c:if test="${prc ne 'anonymousUser' }">
	        <span class="mr-2 d-none d-lg-inline text-gray-600 small">
				안녕하세요 ${userloginid } 님
	        </span>
        </c:if>
<!--         <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60"> -->
      </a>
      <!-- Dropdown - User Information -->
      <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
        <!-- 
        <a class="dropdown-item" href="#">
          <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
          Profile
        </a>
        <a class="dropdown-item" href="#">
          <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
          Settings
        </a>
         -->
        <a class="dropdown-item" href="/main">
          <i class="fas fa-home fa-sm fa-fw mr-2 text-gray-400"></i>
          Home
        </a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
          <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
          Logout
        </a>
      </div>
    </li>

  </ul>

</nav>

<!-- 모달창 등 추가 태그들 -->
<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
  <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
      <div class="modal-footer">
        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
        
        <form action="/logout" method='post' id="_logfrm">
		<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
		</form>
       	<span class="_logout btn btn-primary">
       	Logout
      	</span>
      	
      </div>
    </div>
  </div>
</div>
<!-- 모달창 등 추가 태그들 끝 -->


<!-- logout -->
<script type="text/javascript">
	
		$("._logout").click(function(){
			$("#_logfrm").attr("action", "/logout").submit();
		});
		
		$("._logout").mouseover(function(){
			$(this).css("cursor", "pointer");
		});
		
	
</script>

<!-- alarm 현재날짜 -->
<script type="text/javascript">
$(document).ready(function(){
	
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1;
	var yyyy = today.getFullYear();
	
	if(dd<10) {
	    dd='0'+dd
	} 
	
	if(mm<10) {
	    mm='0'+mm
	}
	
	var Emm;
	if(mm==01) {
	    Emm="January";
	}
	if(mm==02) {
	   Emm="February";
	}
	if(mm==03) {
	    Emm="March";
	}
	if(mm==04) {
	    Emm="April";
	}
	if(mm==05) {
	    Emm="May";
	}
	if(mm==06) {
	    Emm="June";
	}
	if(mm==07) {
	    Emm="July";
	}
	if(mm==08) {
	    Emm="August";
	}
	if(mm==09) {
	    Emm="September";
	}
	if(mm==10) {
	    Emm="October";
	}
	if(mm==11) {
	    Emm="November";
	}
	if(mm==12) {
	    Emm="December";
	}
	
	today = Emm+' '+dd+', '+yyyy;		// October 17, 2019
	$("#_today").text(today);		
	
	
	hiddentoday = yyyy+'-'+mm+"-"+dd;	//	2019-10-17 db에 넘길 용도
	$("#hidden_today").text(hiddentoday);

});

$("#alarm").mouseover(function(){
	$(this).css("cursor", "pointer");
});

$("#alarm").click(function(){
	var rdate = $("#hidden_today").text();	// ex) October 17, 2019
	
	location.href="/admin/memlist?rdate="+rdate;	
});


</script>


</html>