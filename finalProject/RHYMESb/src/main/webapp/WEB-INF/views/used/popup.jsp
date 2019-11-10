<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/css/used/popup.css">
<meta charset="UTF-8">
<title>login</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<input type="hidden" id="_ctx" value="<%=request.getContextPath()%>">
<div id="contents" align="center">
   
<h2 id="_h1">판매자 회원등록</h2>
   
<form action="popupAf" method="post" id="_form">
     <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
     <input type="hidden" id="_s_id" name="s_id" value="${userloginid }">
      <input type="text" id="to" name="to" placeholder="휴대폰 번호"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
      <input type="button" id="send" value="전송" class="btn"><br> <!-- 문자보내는 전송버튼 -->
      <input type="text" id="userNum" placeholder="인증번호를 입력해주세요">   <!-- 인증번호 입력창 -->
  <input type="button" id="enterBtn" value="확인" class="btn"><br>   <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
  
  
  <input type="hidden" name="text" id="text">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
     
     <c:if test="${empty login.address }">
   <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호" readonly="readonly"  style="background: #e5e5e5" size="15">
       <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 검색" class="btn"><br>
       <input type="text" name="address" id="sample6_address" placeholder="주소" readonly="readonly" style="background: #e5e5e5" size="40"><br>
       <input type="text" name="detailaddress" id="sample6_detailAddress" placeholder="상세주소" size="40">
       
       <input type="hidden" id="emptycount" value="1">   <!-- 기존에 주소를 입력했는지 여부를 확인 할 수 있는 변수 -->
     </c:if>
     
</form>  


   <button type="button" id="_cancel" class="btn">취소</button>
   <button type="button" id="_submit" class="btn">회원가입</button>
    </div>
  <script>
var ctx = $("#_ctx").val();
var count = 0;
 $(document).ready(function() {

       
    $("#send").click(function() {
       
       var number = Math.floor(Math.random() * 100000) + 100000;
          if(number>100000){
             number = number - 10000;
          }

          $("#text").val(number);      /* 난수로 생성된 인증번호를 hidden name : text 에 숨긴다 */
       
       var to = $("#to").val();
       
       if(to == "" || to == null){
          alert("빈칸이나 공백을 채워주세요");
       }
       
       else {
       var con_test = confirm("해당번호로 인증문자를 발송하시겠습니까?");   /* 문자를 보낼껀지 물어본다 */
          
          if(con_test == true){

                   /*  데이터베이스의 회원정보 테이블 컬럼 값을 확인하여 count 비교한다 */
               $.ajax({
                   url: ctx +"/used/SendSms",
                   type:"get",
                   data:{to: $("#to").val(),
                        text: $("#text").val(),
                        id: $("#_s_id").val()
                        },
                 success:function(data){
                      alert(data);
                   },
                   error(xhr, ajaxOptioins,thrownError){
                   alert(xhr + ajaxOptioins + thrownError);
                   
                   }
                   
                });
              
          
          }
             else if(con_test == false){
                alert("취소하였습니다");
             }
          

      
       }

       
    })
    $("#enterBtn").click(function() {   /* 내가 작성한 번호와 인증번호를 비교한다 */
      
       if($("#to").val() == "" || $("#to").val() == null){
          alert("휴대폰 번호를 입력해주세요");
          return;
       }
       
       var userNum = $("#userNum").val(); 
       var sysNum = $("#text").val();         
       
       if(userNum == null || userNum == ""){
          alert("휴대폰으로 발송된 인증번호를 입력해주세요");
       }
       
       else{
           
           if(userNum.trim() == sysNum.trim()){
              alert("인증에 성공하였습니다");
              $('#to').css("background-color","#e5e5e5");
              $('#to').prop('readonly', true);
              $('#userNum').css("background-color","#e5e5e5");
              $('#userNum').prop('readonly', true);
              count++;
           }
           else {
              alert("인증번호를 확인하세요");
           }          
       }

    });
    $("#_cancel").click(function() {
       window.close();
    });
    $("#_submit").click(function() {
       var emptycount = $("#emptycount").val();
       var postcode = $("#sample6_postcode").val();
       var address = $("#sample6_address").val();
       var detailaddress =  $("#sample6_detailAddress").val();
       if(count > 0){
         if(emptycount == 1){ /* emptycount가 1이라면 기존에 주소를 입력하지 않았다  */
            
             if(postcode == "" || postcode == null || address == "" || address == null || detailaddress == ""
                || detailaddress == null) {
                      alert("빈칸을 채워주세요");
          
             } else {   
                $("#_form").submit();
                 window.close();      
             }                
            
            
         } else {   /* 기존에 주소를 입력하였기 때문에 회원가입을 검증이 필요없다 */
             $("#_form").submit();
              window.close();      
         }

         
       } else {
          alert("휴대폰 인증을 먼저 해주세요");
       }
    });
 });
  </script>
  

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                        
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>  
  
</body>
</html>