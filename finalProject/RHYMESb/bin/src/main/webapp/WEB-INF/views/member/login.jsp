<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Login page
<br>

<div class="login_wrap" style="width: 50%; margin:auto; margin-top: 200px;">
	<form action="/login" method="post">
		<!-- csrf 예방을 위한 코드추가 -->
 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		<table>
			<tr>
				<td>
					아이디
					<input type="text" class="form-control" name="username" id="txtId" placeholder="ID" size="40">
				</td>
			</tr>
			<tr>
				<td>
					비밀번호<input type="password" class="form-control" name="password" id="txtPw" placeholder="PW">
				</td>
			</tr>
			<tr>
				<td>
					<div class="form-check">
				        <input class="form-check-input" type="checkbox" id="chk_save_id">
				        <label class="form-check-label" for="gridCheck1">
				          Remember Me
				        </label>
				    </div>
			    </td>
			</tr>
			<tr>
				<td align="right">
					<input type="submit" value="로그인(submit)">
					<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
				</td>
			</tr>			
		</table>	  
	</form>
	<table>
		<tr>
			<td>
				<button type="button" class="btn btn-light" onclick="location.href='/regi?memberType=2'">교수자 회원가입</button>
			</td>
			<td>
				<button type="button" class="btn btn-light" onclick="location.href='/regi?memberType=3'">학생 회원가입</button>
			</td>
		</tr>	
	</table>
	<div class="text-center">
      <a class="d-block small mt-3" href="login.html">Login Page</a>
      <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
    </div>
</div>

</body>
</html>