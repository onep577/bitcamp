<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% String ctx = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<%=ctx %>/js/used/notesdetail.js"></script>
<link rel="stylesheet" type="text/css" href="<%=ctx%>/css/member/mypage/content/sub/notesdetail.css">
</head>
<body>
	<c:if test="${userloginid eq dto.send_id }">	<!-- 보낸 쪽지 디테일 -->
	<div>
	<table>
	<col width="150"><col width="150">
	<tr>
	<th>받는사람</th><td id="sid">${dto.recv_id }</td>
	</tr>
	<tr>
	<th>보낸날짜</th>
	<td>${dto.data_send }</td>
	</tr>
	<tr>
	<th>받은날짜</th>
	<c:if test="${not empty dto.data_read  }">
	<td>${dto.data_read }</td>
	</c:if>
	<c:if test="${empty dto.data_read  }">
	<td>읽지않음</td>
	</c:if>
	</tr>
	<tr>
	<td colspan="2"><textarea readonly="readonly" cols="65" rows="15" style="resize: none;">${dto.content }</textarea></td>
	</tr>
	<tr>
	<td colspan="2"><button type="button" id="sdelete" value="${dto.seq }" class="rhybtn">삭제</button>
		<button type="button" id="close" class="rhybtn">닫기</button>
	</td>
	</tr>
	</table>
	</div>
	</c:if>
	<c:if test="${userloginid ne dto.send_id }">	<!--받은 쪽지 디테일  -->
	<div>
	<table>
	<col width="150"><col width="150">
	<tr>
	<th>보낸사람</th><td>${dto.send_id }</td>
	</tr>
	<tr>
	<th>보낸날짜</th><td>${dto.data_send}</td>
	</tr>
	<tr>
	<td colspan="2"><textarea readonly="readonly" cols="65" rows="15" style="resize: none;">${dto.content }</textarea></td>
	</tr>
	<tr>
	<td colspan="2">
	<button type="button" id="ranswer" class="rhybtn">답장</button>
	<button type="button" id="rdelete" value="${dto.seq }" class="rhybtn">삭제</button>
	<button type="button" id="close" class="rhybtn">닫기</button>
	</td>
	</tr>
	</table>	
	</div>
	</c:if>
	<script type="text/javascript">
	
$("#sdelete").click(function() {	// 보낸 쪽지함 삭제
	
		var seq = $(this).val();
		var recv_id = "${dto.recv_id}";
		var send_id = "${userloginid}"
		
		location.href="notesdelete?recv_id="+recv_id+"&send_id="+send_id+"&seq="+seq;
		window.opener.location.reload();
		window.close();
	});

$("#rdelete").click(function() {	// 받은 쪽지함 삭제
	var seq = $(this).val();
	alert(seq);
	var recv_id = "${userloginid}";
	var send_id = "${dto.send_id}";
	
	location.href="notesdelete2?recv_id="+recv_id+"&send_id="+send_id+"&seq="+seq;;
	window.opener.location.reload();
	window.close();
});

$("#ranswer").click(function() {
	var send_id = "${dto.send_id}";
	
	var url= "notesanswer?send_id="+send_id;    //팝업창 페이지 URL
	var winWidth = 500;
    var winHeight = 400;
    
    var popupX = (window.screen.width / 2) - (580 / 2);
 	// 만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

 	var popupY= (window.screen.height / 2) - (500 / 2);
 	// 만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음
    
    
    var popupOption= "width="+winWidth+", height="+winHeight + ", left="+ popupX + ", top="+ popupY;    //팝업창 옵션(optoin)
	window.open(url,"",popupOption);
//	window.close();

});


	
$("#close").click(function() {
	window.close();
})
	</script>

</body>
</html>