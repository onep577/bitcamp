	<%@page import="java.text.DecimalFormat"%>
<%@page import="dto.PersonQnADto"%>
<%@page import="dto.BookingDto"%>
<%@page import="java.util.List"%>
<%@page import="dto.CustomerDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>

<%!
/* 숫자에 중간에 콤마 추가 */
 public String toNumFormat(int num) {
  DecimalFormat df = new DecimalFormat("#,###");
  return df.format(num);
 }

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<style type="text/css">

main{
	width: 70%;
	 /* height: 800px;  이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !!  */
	margin: auto;
	margin-bottom: 30px;
	min-height: 400px;
}
table{
	width: 100%;
}
#introtable{
    background-color: #fafafa;
    margin-top: 50px;
}
.tb{
	margin-top: 20px;
	/* margin-left: 145px; */
    border-collapse: collapse;
    font-family: 'Noto Sans KR', sans-serif;
}

.tb th{
	padding: 20px;
	background: #D6B78D;
	text-align: center;
	color: white;
	font-size: large;
}
.tb th, .tb td{
	border-bottom: 1px solid #D6B78D;
	text-align: center;
	
}
.tb td{
	padding: 15px;
}

#infotable{
	width: 100%;
	margin-top: 20px;
	/* margin-left: 145px; */
    border-collapse: collapse;
    font-family: 'Noto Sans KR', sans-serif;
}

#infotable th{
	padding: 20px;
	background: #D6B78D;
	text-align: center;
	color: white;
	font-size: large;
}
#infotable th, #infotable td{
	border-bottom: 1px solid #D6B78D;
}
#infotable td{
	text-align: left;
}

input{
	border: none;
	padding-left: 15px;
	padding-right: 15px;
	background-color: #f1f1f1;
	width: 50%;
	height: 50px;
}
.infofont{
	color: #01A9DB;
}

.maininfo{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 35px;
	font-weight: 700;
}




#mypage_div{
	width: 100%;
	height: 100%;
	background-color: gray;
	opacity: 0.2;
	position: fixed;
	display: none;
}
#layerPopup{
	width: 972px;
	height: 506px;
	position: absolute;
	display: none;

	
}



</style>

</head>

<body>

<%

String message = (String)request.getAttribute("message");
if(message != null){
%>
	<script>
	alert("<%=message%>");
	</script>
<%
}

CustomerDto user = (CustomerDto)session.getAttribute("login");

if(user == null){
	System.out.println("CustomerDto user == null");
	response.sendRedirect("/miniProject/customer_servlet?command=loginpage");
	//request.getRequestDispatcher("common_servlet?command=loginpage").forward(request, response); // 이렇게 파라메타 붙여주는식으로는 못 쓴다.
}

request.setAttribute("_user", user);

List<BookingDto> bookinglist = (List<BookingDto>)request.getAttribute("bookinglist");

List<PersonQnADto> qnalist = (List<PersonQnADto>)request.getAttribute("qnalist");
%>

<div id="mypage_div" onclick="closeLayerPopup('layerPopup', 'mypage_div')"></div>

<jsp:include page="../header.jsp" flush="false"/>

<main>

<div id="layerPopup" align="center">
<!-- 	<h1 class="maininfo">등급별 혜택</h1>
	<table class="tb">
		<tr>
			<th></th><th>일반</th><th>실버</th><th>골드</th><th>VIP</th><th>VVIP</th>
		</tr>
		<tr>
			<th>이용금액</th><td>가입시</td><td>50만원이상</td><td>300만원이상</td><td>1000만원이상</td><td>2000만원이상</td>
		</tr>
		<tr>
			<th>할인율</th><td>없음</td><td>1%할인</td><td>2%할인</td><td>3%할인</td><td>4%할인</td>
		</tr>
		
	</table> -->
	<img src="/miniProject/image/gradeimg.png">
</div>

	<c:if test="${not empty _user}">
	
		<div align="center">
		  <form action="" id="frm">
		  	<input type="hidden" name="command" value="custupdate">
		  	<input type="hidden" name="id" value="<%=user.getId()%>" id="id">
		  	<table class="tb" id="introtable">
		  	
		  		<tr>
		  			<td>
		  				<h1 class="maininfo"><%=user.getName() %>님의 정보</h1>
		  			</td>
		  		</tr>
		  		<tr>
		  			<td>
		  				<button type="button" class="btn btn-default" id="myrecordbtn">나의실적내역</button>
		  				<button type="button" class="btn btn-default" id="myquestionbtn">나의문의사항</button>
		  				<button type="button" class="btn btn-default" id="myinfobtn">나의정보관리</button>
		  				
		  			</td>
		  		</tr>
		  	</table>
	  	
	  	
			<table id="in1" class="tablesorter">
				
				<thead>
					<tr>
						<td colspan="7">
							<h4 class="allfont">머리글을 누르면 정렬됩니다.</h4>
						</td>
					</tr>
					<tr>
						<th>번호</th><th>예약일시</th><th>방문일</th><th>퇴실일</th><th>금액</th><th>방등급</th><th>인원</th>
					</tr>
				</thead>
				<tbody>
					<%
					if(bookinglist == null || bookinglist.size() == 0){
						%>
						<tr>
							<td colspan="7">예약된 내역이 없습니다.</td>
						</tr>
						<%
					}else{
						for(int i=0; i<bookinglist.size(); i++){
							BookingDto booking = bookinglist.get(i);
							
						%>
						<tr>
							<td><%=i+1%></td>
							<td>
								<%=booking.getWdate() %>
							</td>
							<td>
								<%=booking.getVisit_date().substring(0, 4) %>-<%=booking.getVisit_date().substring(4, 6) %>-<%=booking.getVisit_date().substring(6, 8) %>
							</td>
							<td>
								<%=booking.getLeave_date().substring(0, 4) %>-<%=booking.getLeave_date().substring(4, 6) %>-<%=booking.getLeave_date().substring(6, 8) %>
							</td>
							<td>
								<%-- <%=toNumFormat( booking.getTotal_price() )%>원 --%>
								<%=  booking.getTotal_price() %>
							</td>
							<td>
								<%=booking.getRoom_number() %>
							</td>
							<td>
								어른:<%=booking.getAdult_number() %>명
								아이:<%=booking.getChild_number() %>명
							</td>
						</tr>
						<%
						}
					}
					%>
				</tbody>
			</table>
	  				
	  				
			  				
			<table id="in2" class="tb">
						
				<tr>
					<th></th><th>제목</th><th>시간</th><th>답변유무</th>
				</tr>
				
				<%
				if(qnalist == null || qnalist.size() == 0){
					%>
					<tr>
						<td colspan="7">문의내역이 없습니다.</td>
					</tr>
					<%
				}else{
					for(int i=0; i<qnalist.size(); i++){
						PersonQnADto qna = qnalist.get(i);
						
					%>
					<tr>
						<td><%=i+1%></td>
						<td>
							<a href="personqna_servlet?command=godetail&seq=<%=qna.getSeq() %>&id=<%=qna.getId() %>&choice=<%=qna.getQuestion_type() %>
											&title=<%=qna.getTitle()%>&content=<%=qna.getContent()%>&comments=<%=qna.getComments() %>"><%=qna.getTitle() %></a>
							<%-- <input type="hidden" name="seq" value="<%=qna.getSeq() %>">
							<input type="hidden" name="comments" value="<%=qna.getComments() %>">
							<input type="hidden" name="choice" value="<%=qna.getQuestion_type() %>"> --%>
						</td>
						<td>
							<%=qna.getWdate().substring(0, 16) %>
						</td>
						<td>
							<% if(qna.getAnswer_check() == 0){ %>
								답변준비중
							<%
							}
							else { 
							%>
								답변완료
							<%
							} 
							%>
						</td>
						
					</tr>
					<%
					}
				}
				%>
						
			</table>
	  				
	  				
	  				
 			<table id="in3" class="tb">	
 				<tr>
 				<td>
 					<table class="tb">
	  					<tr>
				  			<td>
				  				<h2 class="infofont">나의 등급</h2>
				  				<h1 class="infofont"><%=user.getGrade() %></h1>
				  				<button type="button" class="btn btn-default" id="mygrade" onclick="openLayer('layerPopup', 'mypage_div')">등급별혜택안내</button>
				  			</td>
				  			<td>
				  				<h2 class="infofont">총 예약 횟수</h2>
				  				<h1 class="infofont"><%=user.getBooking_count()%>회</h1>
				  				<br>
				  			</td>
				  			<td>
				  				<h2 class="infofont">총 소비금액</h2>
				  				<h1 class="infofont"><%=toNumFormat( user.getTotal_payment() )%>원</h1>
				  				<br>
				  			</td>
				  		</tr>
		  			</table>
 				</td>
 				</tr>
 				<tr>
	  				<td>
	  					<h4 class="allfont">변경하실 정보의 목록을 변경하고 변경 버튼을 눌러주시면 정보가 변경됩니다.</h4>
	  				</td>
 				</tr>
 				<tr>
		 			<td style="border: 0px">	
				  		<table id="infotable" class="tb">
			  				<tr>
			  					<td>
					  				비밀번호
					  			</td>
					  			<td>
					  				<input type="password" placeholder="비빌번호 입력" id="pwd" name="pwd" value="<%=user.getPwd()%>">
					  				<br><font color="red" size="2px">8~15자리의 특수,영문+숫자로 등록해주십시오( ~!@\#$%><^&* 만 지원합니다. )</font>
					  			</td>
					  		</tr>
					  		<tr>
					  			<td>
					  				이름
					  			</td>
					  			<td>
					  				<input type="text" placeholder="이름 입력" id="name" name="name" value="<%=user.getName()%>">
					  			</td>
					  		</tr>
					  		<tr>
					  			<td>
					  				주소
					  			</td>
					  			<td>
					  				<input type="text" placeholder="주소입력" id="address" name="address" value="<%=user.getAddress()%>" maxlength="20">
					  			</td>
					  		</tr>
					  		<tr>
					  			<td>
					  				생년월일
					  			</td>
					  			<td>
					  				<input type="text" placeholder="생년월일(예 : 19920305)" id="birthday" name="birthday" maxlength="8" 
					  				onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_han(this);" 
					  				style="ime-mode:disabled;" value="<%=user.getBirthday()%>">
					  			</td>
					  		</tr>
					  		<tr>
					  			<td>
					  				전화번호
					  			</td>
					  			<td>
					  				<input type="text" placeholder="전화번호(예 : 01012345678)" id="phone" name="phone" maxlength="11" 
					  				onkeypress="return fn_press(event,'numbers');" onkeydown="fn_press_han(this);" 
					  				style="ime-mode:disabled;" value="<%=user.getPhone()%>">
					  			</td>
					  		</tr>
					  		<tr>
					  			<td>
					  				이메일
					  			</td>
					  			<td>
					  				<input type="text" placeholder="이메일(예 : abc@naver.com)" id="email" name="email" 
					  				onkeydown="fn_press_han(this);" style="ime-mode:disabled;" value="<%=user.getEmail()%>">
					  			</td>
					  		</tr>
					  		<tr>
					  			<td>
					  				
					  			</td>
					  			<td>
					  				<button type="button" class="btn btn-primary" id="updatebtn">변경하기</button>
					  			</td>
					  		</tr>
					  		<tr>
					  			<td colspan="2" style="text-align: right; border: 0px">
					  				<a id="deletebtn" class="allfont">회원탈퇴</a>
					  			</td>
					  		</tr>
				  		</table>
			  		</td>
					</tr>
 				</table>
	  		
	   </form>
	  </div>
	  
	</c:if>  

</main>

<jsp:include page="../footer.jsp" flush="false"/>

<script type="text/javascript">

var pattern1 = /[0-9]/;

var pattern2 = /[a-zA-Z]/;

var pattern3 = /[~!@\#$%<>^&*]/;     // 원하는 특수문자 추가 제거

/*숫자만 입력하게함*/
function fn_press(event, type) {
	if(type == 'numbers'){
		if((event.keyCode < 48) || (event.keyCode > 57)){
			return false;
		}
	}
}

/* 한글입력방지 */
function fn_press_han(obj) {
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 ||
			event.keyCode == 39 || event.keyCode == 46){
		return;
	}
	obj.value = obj.value.replace(/[\ㄱ-ㅎ ㅏ-ㅣ 가-힣]/g, "");
}

//정렬테이블을 위한것
$(function () {
	$("#in1").tablesorter();
});

//팝업창
var count = 0;
function openLayer(IdName, Divname){
	  if(count==0){
		  count++;
		var pop = document.getElementById(IdName);
		var Gdiv = document.getElementById(Divname);
		/* show 랑 같다고 보시면 됩니다. */
		pop.style.display = "block";
		Gdiv.style.display = "block";
		/* 이 2개는 어디서 시작할지 좌표값 top, left 값 px 로 설정한거 입니다. */
		pop.style.position = "fixed";
		pop.style.top = "20%";
		pop.style.left = "26%";
	  }
	}
	//레이어 팝업 닫기
	function closeLayerPopup(IdName, Divname){
		var pop = document.getElementById(IdName);
		var Gdiv = document.getElementById(Divname);
		/* hide랑 같은 원리 */
		pop.style.display = "none";
		Gdiv.style.display = "none";
		count=0;
	}	

$(function () {
	
	$("#in1").show();
	$("#in2").hide();
	$("#in3").hide();
	
	$("#myrecordbtn").click(function() {
		$("#in1").show();
		$("#in2").hide();
		$("#in3").hide();

	});
	$("#myquestionbtn").click(function() {
		$("#in1").hide();
		$("#in2").show();
		$("#in3").hide();

	});
	$("#myinfobtn").click(function() {
		$("#in1").hide();
		$("#in2").hide();
		$("#in3").show();

	});
	
	$("#deletebtn").click(function() {
		if(confirm("정말 회원탈퇴를 진행하시겠습니까?(회원탈퇴시 DB에서 모든 정보가 삭제되며 다시 복구 되지 않습니다.)") == true){
			
			var id = $("#id").val();
			
			location.href = "/miniProject/customer_servlet?command=deletecust&id=" + id;
	    }
	    else{
	        return ;
	    }
		
	});
	
	$("#updatebtn").click(function() {
		
		var pw = $("#pwd").val().trim();
        
		if(!pattern1.test(pw) ||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<8||pw.length>15){

            alert("비밀번호는 영문+숫자+특수기호 8~15자리로 구성하여야 합니다.");
            
        }else if($("#name").val().trim() == ""){
			
			alert("이름을 입력하세요");
			
		}else if($("#address").val().trim() == ""){
			
			alert("주소를 입력하세요");
			
		}else if($("#birthday").val().trim().length != 8){
			
			alert("생일을 입력하세요");
			
		}else if($("#phone").val().trim().length != 11){
			
			alert("전화번호를 입력하세요");
			
		}else if($("#email").val().trim().indexOf("@") == -1){
			
			alert("이메일 형식으로 입력해주세요");
			
		}else{
			
			$("#frm").attr({"action":"/miniProject/customer_servlet", "method":"post"}).submit();
			
		}
	});
	
});

</script>



</body>
</html>