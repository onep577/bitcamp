<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="pollgin.do" method="post">

<table class="list_table" style="width: 95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>

<tr>
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" name="pollid" value="${poll.pollid }" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" name="id" value="${login.id }" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		${poll.sdate } ~ ${poll.edate }
	</td>
</tr>

</table>

</form>

<script type="text/javascript">
</script>


