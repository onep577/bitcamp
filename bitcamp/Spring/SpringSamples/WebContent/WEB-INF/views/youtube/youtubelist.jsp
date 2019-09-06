<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 경로가 http://www.youtube.com/embed/ 로 되어있으면 그냥 youtube가 나온다-->
<div id="_youtube_">
 	<iframe id="_youtube" width="640" height="360"
		src="http://www.youtube.com/embed/" frameborder="0"
		allowfullscreen ></iframe>
</div>

<table class="list_table" style="width: 85%">
<col width="70px"><col style="width: auto;"><col width="100px">

<!-- thead는 꼭 안써도 되지만 꼭 써야하는 곳도 있다 -->
<thead>
<tr>
	<th>순서</th><th>제목</th><th>유튜브 고유번호</th>
</tr>
</thead>

<tbody>
<c:if test="${empty youlist }">
<tr>
	<td colspan="3">저장된 동영상이 없습니다</td>
</tr>
</c:if>

<c:forEach items="${youlist }" var="bbs" varStatus="vs">
<tr class="_hover_tr">
	<td>${vs.count }</td>
	<td style="text-align: left;">
		<div class="c_vname" vname="${bbs.vname }">${bbs.title }</div>
	</td>
	<td>${bbs.vname }</td>
</tr>
</c:forEach>
</tbody>

</table>



<script type="text/javascript">
$(".c_vname").click(function () {
	$("#_youtube_").show();
	// this는 클릭한 것
	$("#_youtube").attr("src","http://www.youtube.com/embed/" + $(this).attr("vname"));
});
</script>


