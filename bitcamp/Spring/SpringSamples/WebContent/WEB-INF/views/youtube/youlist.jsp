<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<div class="box_border" style="margin-top: 5px; margin-bottom: 10px;">
<form action="" name="frmForm1" id="_frmForm" method="post">
<table style="margin-left: auto; margin-right: auto; margin-top: 3px; margin-bottom: 3px; border: 0; padding: 0;">
<tr>
	<td>검색 : </td>
	<td style="padding-left: 5px;">
		<input type="text" id="_s_keyword" name="s_keyword" value="${empty s_keyword?'':s_keyword }">
	</td>
	<td style="padding-left: 5px;">
		<span class="button blue">
			<button type="button" id="_btnSearch">검색</button>
		</span>
	</td>
</tr>
</table>
</form>
</div>



<!-- 경로가 http://www.youtube.com/embed/ 로 되어있으면 그냥 youtube가 나온다-->
<div id="_youtube_">
 	<iframe id="_youtube" width="640" height="360"
		src="http://www.youtube.com/embed/" frameborder="0"
		allowfullscreen ></iframe>
</div>



<table class="list_table" style="width: 85%">
<colgroup>
	<col style="width: 70px">
	<col style="width: auto">
	<col style="width: 100px">
	<col style="width: 30px">
</colgroup>

<thead>
	<tr>
		<th>순서</th><th>제목</th><th>유튜브고유번호</th><th>저장</th>
	</tr>
</thead>



<!-- 검색 단어가 없으면 그냥 넘어오고 검색 단어가 있으면 list가 넘어온다 -->
<tbody>
<c:if test="${empty youlist }">
<tr>
	<td colspan="4">작성된 목록이 없습니다</td>
</tr>
</c:if>



<c:forEach items="${youlist }" var="bbs" varStatus="vs">
<c:if test="${fn:substring(bbs.vname, 0, 1) ne '/' }">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td style="text-align: left;" id="_v${bbs.vname }ed2"
	onclick="getyoutube2('${bbs.vname}')">
		<div class="c_vname" vname="${bbs.vname }">${bbs.title }</div>
	</td>
	<td>
		${bbs.vname }
	</td>
	<td onclick="getyoutube('${login.id}', '${bbs.vname }')">
		<img alt="이미지없음" src="image/save.png" class="ck_seq"
		vname="${bbs.vname }" id="_v${bbs.vname }ed" loginId="${login.id }"
		title="${bbs.title }" keyword="${empty s_keyword?"":s_keyword }">
	</td>
</tr>
</c:if>
</c:forEach>
</tbody>



</table>



<script type="text/javascript">
$(document).ready(function () {
	$("#_youtube_").hide();
	
	$("#_hover_tr").mouseover(function () {
		$(this).children().css("background-color", "#f0f5ff");
	}).mouseout(function () {
		$(this).children().css("background-color", "#fff");
	});

	$("#_btnSearch").click(function () {
		//alert("검색");
		//_blank 새로운 창
		$("#_frmForm").attr({ "target":"_self", "action":"youtube.do" }).submit();
	});
	
	$(".c_vname").click(function () {
		$("#_youtube_").show();
		// this는 클릭한 것
		$("#_youtube").attr("src","http://www.youtube.com/embed/" + $(this).attr("vname"));
	});

	$(".ck_seq").click(function () {
		//alert("click");
		
		var id = $(this).attr("loginId");
		var vname = $(this).attr("vname");
		var title = $(this).attr("title");
		var category = $(this).attr("keyword");
		
		// url을 더 정확하게 상대경로로 지정했다
		// 데이터를 갖고 올 때도 다른 작업을 할 때도 작업을 갖고온다
		// 갖고 오기전에 처리하는 것 비동기
		// 갖고 와서 다 끝나고 처리한다 동기
		// async:true는 default값이다 안해도 된다
		$.ajax({
			type:"post",
			url:"<%=application.getContextPath() %>/youtubesave.do",
			async:true,
			data:"id="+id+"&vname="+vname+"&title="+title+"&category="+category,
			
			success:function(msg){
				//alert("success");
				alert("성공적으로 " + msg.vname + "가 저장되었습니다");
			},
			error:function(){
				alert("error");
			}
		});
		
	});
	
});

function getyoutube2(vname) {
	$("#_v" + vname + "ed2").css("background-color", "#ff0000");
}

</script>

