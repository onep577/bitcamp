<%@page import="bit.com.a.model.PollSubDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

<%
List<PollSubDto> list = (List<PollSubDto>)request.getAttribute("pollsublist");

//json 생성
String jsonData = "[";

for(PollSubDto p : list){
	jsonData += "{name:'" + p.getAnswer() + "', y:" + p.getAcount() + "},";
}

jsonData = jsonData.substring(0, jsonData.lastIndexOf(","));
jsonData += "]";

System.out.println(jsonData);

request.setAttribute("jsonData", jsonData);
%>

<table class="list_table" style="width: 95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>
<tr>
	<th>투표번호</th>
	<td style="text-align: left;">
		<input type="text" name="pollid" value="${poll.pollid }">
	</td>
</tr>

<tr>
	<th>아이디</th>
	<td style="text-align: left;">
		<input type="text" value="${login.id }" size="50" readonly="readonly">
	</td>
</tr>

<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		${poll.sdate } ~ ${poll.edate }
	</td>
</tr>

<tr>
	<th>투표내용</th>
	<td style="text-align: left;">
		<textarea rows="10" cols="50">${poll.question }</textarea>
	</td>
</tr>

<tr>
	<th>투표결과</th>
	<td>
		<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto">
		</div>
	</td>
</tr>

</table>


<script>
Highcharts.chart('container', {
	  chart: {
	    plotBackgroundColor: null,
	    plotBorderWidth: null,
	    plotShadow: false,
	    type: 'pie'
	  },
	  title: {
	    text: ${poll.pollid }+'의 투표 통계 결과'
	  },
	  tooltip: {
	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
	  },
	  plotOptions: {
	    pie: {
	      allowPointSelect: true,
	      cursor: 'pointer',
	      dataLabels: {
	        enabled: true,
	        format: '<b>{point.name}</b>: {point.percentage:.1f} %'
	      }
	    }
	  },
	  series: [{
	    name: '투표율',
	    colorByPoint: true,
	    data: <%=request.getAttribute("jsonData") %>
	  }]
	});
</script>








