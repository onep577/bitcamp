<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_update</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/admin/member/memupdate_styles.css">
</head>

<!-- Begin Page Content -->
<div class="container-fluid" align="center">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">회원관리</h1>
	<p class="mb-4">회원리스트</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">회원 상세정보</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">

				<!-- @@@@ 여기서부터 작성 @@@@@ -->


				<form action="mem_updateAf">
					<input type="hidden" value="${admem.userid }" name="userid">
					<table>
						<tr>
							<th>아이디</th>
							<td><span class="td_margin">${admem.userid }</span></td>
						</tr>
						<tr>
							<th>이름</th>
							<td><input type="text" name="username" value="${admem.username }" class="inputtext_s"></td>
						</tr>
						<tr>
							<th><span class="th_title">주소</span></th>
							<td>
								<div class="wrap-input100 bg1 rs1-wrap-input100">
									<input type="text" id="_postcode" name="postcode" class="inputtext_s" placeholder="우편번호" value="${admem.postcode }">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" class="regibutton"><br> 
									<input type="text" id="_address" name="address" class="inputtext_s" placeholder="주소" value="${admem.address }"><br> 
									<input type="text" id="_detailAddress" name="detailAddress" class="inputtext_s" placeholder="상세주소" value="${admem.detailAddress }"> 
									<input type="hidden" id="_extraAddress" name="c_extraAddress" placeholder="참고항목">
								</div>
							</td>
						</tr>
						<tr>
							<th>이메일</th>
							<td><input type="text" name="useremail" value="${admem.useremail }" class="inputtext_s"></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" value="${admem.phone }" class="inputtext_s"></td>
						</tr>
						<tr>
							<th>성별</th>
							<td>
								<c:if test="${admem.usergender eq 'female' }">
									<input type="radio" name="usergender" value="female" class="addinfo radiobtn td_margin" checked>여자
									<input type="radio" name="usergender" value="male" class="addinfo radiobtn td_margin">남자
								</c:if> <c:if test="${admem.usergender eq 'male' }">
									<input type="radio" name="usergender" value="female" class="addinfo radiobtn td_margin">여자
									<input type="radio" name="usergender" value="male" class="addinfo radiobtn td_margin" checked>남자
								</c:if> <c:if test="${empty admem.usergender }">
									<input type="radio" name="usergender" value="female" class="addinfo radiobtn td_margin">여자
									<input type="radio" name="usergender" value="male" class="addinfo radiobtn td_margin">남자
								</c:if>
							</td>
						</tr>
						<tr>
							<th>생일</th>
							<td>
								<input type="text" name="userbirth" value="${admem.userbirth }" class="inputtext_s">
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<input type="submit" class="regibutton_s memBtn" value="수정"><br>
								<button type="button" class="regibutton_s memBtn" id="golist">취소</button>
							</td>
						</tr>
					</table>
				</form>

				<!-- @@@@@ 여기까지 @@@@@ -->

			</div>
		</div>
	</div>

</div>

<!-- /.container-fluid -->


<!-- End of Main Content -->



<script type="text/javascript">
	$("#golist").click(function() {
		location.href = "/admin/memlist";
	});
</script>

<!-- 주소 -->
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수
				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}
				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					document.getElementById("_extraAddress").value = extraAddr;

				} else {
					document.getElementById("_extraAddress").value = '';
				}
				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('_postcode').value = data.zonecode;
				document.getElementById("_address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("_detailAddress").focus();
			}
		}).open();
	}
</script>


</html>