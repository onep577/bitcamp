<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>      

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>

<style type="text/css">
#login_wrap {
	margin:10px;
}
#login_wrap th {
	font-weight:bold;
}
#main_wrap { 
	width:800px; 
	margin-left:auto; 
	margin-right:auto; padding:0px;
}			
#content_wrap { 
	width: 100%; 
	height: 500px; 
	background-image:url("image/backa.jpg");
	background-repeat:no-repeat; 
	background-position:top center;  
}

.login_title_warp {
	width:500px; 
	color:#FFFFFF; 
	text-align:center; 
	background-color:#3e5fba; 
	border:solid 1px #EFEFEF; 
	font-weight:bold; 
	height:60px;
}

/* table셋팅 */
.content_table { width:98%; border-bottom:1px solid #EFEFEF; border-right:1px solid #EFEFEF; border-collapse:collapse; margin-left:auto; margin-right:auto;  clear:both; }
.content_table td, .content_table th { text-align:center; border-top:1px solid #EFEFEF; border-left:1px solid #EFEFEF; padding:0.3em; }
.content_table th { background-color:#4D6BB3; color:#FFFFFF; line-height: 1.7em; font-weight:normal;}
.content_table td { padding-left:5px; text-align:left; line-height: 1.7em; }
.content_table td.contents { width:100%; height:400px; overflow:auto; }
.content_table th, .content_table td { vertical-align:middle; }

.content_table select { height:19px; border:#CCCCCC solid 1px; vertical-align:middle; line-height: 1.8em; padding-left:0px; }
.content_table select option { margin-right:10px; }

</style>

</head>
<body>

<div id="main_wrap">
	<div id="middle_wrap">
		<div id="content_wrap">
			
			<div style="width: 502px; height: 166px; margin-left: auto; margin-right: auto;
						position: relative; top: 100px;">
								
				
				test
				<div class="login_title_warp">
					<div style="margin-top: 12px">
						<h2>My Home Page</h2>
					</div>
				</div>
				
				<div id="login_wrap">
					<form action="loginAf.do" name="frmForm" id="_frmForm" method="post">
						<table class="content_table" style="width: 75%">
						<colgroup>
							<col style="width:30%">
							<col style="width:70%">
						</colgroup>
						
						<tbody>
						<tr>
	                        <!-- title은 마우스 오버한 후 나오는 텍스트 -->
							<th style="background-color: #eeeeee; color: #3e5fba">아이디</th>
							<td>&nbsp;<input type="text" id="_userid" name="id" data-msg="ID를"
								size="20px" title="아이디" style="border: 1px solid #dddddd">
								<input type="checkbox" id="chk_save_id">ID 저장
							</td>
						</tr>
						<tr>
							<th style="background-color: #eeeeee; color: #3e5fba">비밀번호</th>
							<td>&nbsp;<input type="password" id="_pwd" name="pwd" data-msg="패스워드를"
								size="20px" title="패스워드" style="border: 1px solid #dddddd">
							</td>
						</tr>
						<tr>
	                        <td colspan="2" style="height:50px; text-align:center;">
	                           <span>
	                              <a href="#none" id="_btnLogin" title="로그인">
	                                 <img alt="이미지없음" src="./image/login_btn.jpg">
	                              </a>
	                              <a href="#none" id="_btnReg" title="회웡가입">
	                                 <img alt="이미지없음" src="./image/regi.jpg">
	                              </a>
	                           </span>
	                        </td>
	                     </tr>
						</tbody>


						
						</table>
					</form>
				</div>
				
				
				
			</div>		
		</div>	
	</div>
</div>



<script type="text/javascript">
$(document).ready(function () {	
	// 로그인 버튼 클릭
	$("#_btnLogin").click(function () {
		//alert("dd");
		var id = $("#_userid").val().trim();
		var pwd = $("#_pwd").val().trim();
		//alert(id + ", " + pwd);
		
		if( id == "" ){
			alert("id를 입력해주세요");
			$("#id").focus();
			// id로 포커스가 맞춰진다
		}
		else if( pwd == "" ){
			alert("password를 입력해주세요");
			$("#pwd").focus();
			// password로 포커스가 맞춰진다
		}else{
			//alert("dd");
			$("#_frmForm").attr("action","loginAf.do").submit();
		}
	});

	
	
	// 아이디 저장 체크박스 클릭
	$("#chk_save_id").change(function () {
		var id = $("#id").val().trim();
		alert(id);
		if( $("#chk_save_id").is(":checked") ){
			//alert("체크박스 체크");
			if( $("#id").val().trim() == "" ){
				alert("id를 입력해주세요");
				$("#id").focus();
				$("#chk_save_id").prop("checked", false);
				// 강사님 왈 attr로 하니까 동작하지 않는다
			}else{
				// 정상 기입한 경우
				$.cookie("user_id", $("#id").val().trim(), {expires: 7, path: '/'})
				// 여기서 쿠키가 저장된다. 7은 일주일 '/'아무거나 모든것을 포함한다
			}
		}else{
			//alert("체크박스 해제");
			$.removeCookie("user_id", {path:'/'});
		}
	});

	
	
	// 회원가입 버튼 클릭
	$("#_btnReg").click(function () {
		location.href="account.do";
	});

	
	
});
</script>



</body>
</html>


