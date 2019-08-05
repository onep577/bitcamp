<%@page import="main.MovieManager"%>
<%@page import="dto.MovieVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<MovieVo> list = MovieManager.getCGVdata();
/*
for(int i = 0; i < list.size(); i++){
	System.out.println(list.get(i).toString());
}
*/

// list -> json
String jsonlike = "[";

for(MovieVo m : list){
	jsonlike += "{ name:'" + m.getTitle() + "', y:" + m.getLike() + "},";
}

jsonlike = jsonlike.substring(0, jsonlike.lastIndexOf(","));
// 맨 끝에 ,만 빼고 다 가져와라

jsonlike += "]";

System.out.println(jsonlike);

request.setAttribute("jsonlike", jsonlike);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- JQuery 밑에다 하자 -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

</head>
<body>

<div id="container" style="min-width: 310px; height: 400px; max-width: 600px; margin: 0 auto"></div>

<script type="text/javascript">
Highcharts.chart('container', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: 'Browser market shares in January, 2018'
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
        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
        style: {
          color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
        }
      }
    }
  },
  series: [{
    name: 'Brands',
    colorByPoint: true,
    data: <%=request.getAttribute("jsonlike") %>
  }]
});
</script>

</body>
</html>