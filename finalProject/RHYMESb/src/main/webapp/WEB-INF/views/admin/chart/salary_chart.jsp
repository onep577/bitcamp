<%@page import="com.rhymes.app.admin.chart.model.AdminChartSearchDTO"%>
<%@page import="com.rhymes.app.admin.chart.util.AdminChartJSON"%>
<%@page import="com.rhymes.app.admin.chart.model.AdminChartDTO"%>
<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
List<AdminChartDTO> monthPriceJson = (List<AdminChartDTO>)request.getAttribute("monthPriceJson");
List<AdminChartDTO> monthNumJson = (List<AdminChartDTO>)request.getAttribute("monthNumJson");
List<AdminChartDTO> dayJson = (List<AdminChartDTO>)request.getAttribute("dayJson");
AdminChartSearchDTO search = (AdminChartSearchDTO)request.getAttribute("search");



AdminChartJSON json = new AdminChartJSON();
String monthPriceStr = json.jsonchangmonthPrice(monthPriceJson);
String monthNumStr = json.jsonchangmonthNum(monthNumJson);
String dayStr = json.jsonchangday(dayJson);
String monthStr = json.jsonchangmonthStr(search);



/* System.out.println("monthPriceStr : " + monthPriceStr);
System.out.println("monthNumStr : " + monthNumStr);
System.out.println("dayStr : " + dayStr);
System.out.println("monthStr : " + monthStr); */



request.setAttribute("monthPriceStr", monthPriceStr);
request.setAttribute("monthNumStr", monthNumStr);
request.setAttribute("dayStr", dayStr);
request.setAttribute("monthStr", monthStr);
request.setAttribute("search_year", search.getYear());
request.setAttribute("search_month", search.getMonth());
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- java script -->
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>
<script src="https://code.highcharts.com/modules/cylinder.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/chart/salary_chart.js"></script>
</head>

<div class="container-fluid">

	<!-- Page Heading -->
	<h1 class="h3 mb-2 text-gray-800">매출 통계</h1>
	<p class="mb-4">월별 매출, 일별 매출</p>

	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">매출 통계</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div class="row" style="width: 95%;">
						
						<!-- 검색 -->
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="searchPosition dataTables_filter">
								<select class="custome-select border-0 pr-3 searchSelect" id="_select_year" name="year">
									<option value="">년</option>
									<option value="2017" <c:out value="${search.year == '2017'? 'selected':'' }"/>>2017년</option>
									<option value="2018" <c:out value="${search.year == '2018'? 'selected':'' }"/>>2018년</option>
									<option value="2019" <c:out value="${search.year == '2019'? 'selected':'' }"/>>2019년</option>
								</select>
								<select class="custome-select border-0 pr-3 searchSelect" id="_select_month" name="month">
									<option selected value="">월</option>
									<c:forEach begin="1" end="12" varStatus="i">
									<c:if test="${i.index lt 10 }">
									<option value="0${i.index }" <c:out value="${search.month == i.index? 'selected':'' }"/>>${i.index }월</option>
									</c:if>
									<c:if test="${i.index ge 10 }">
									<option value="${i.index }" <c:out value="${search.month == i.index? 'selected':'' }"/>>${i.index }월</option>
									</c:if>
									</c:forEach>
								</select>
								<button class="btn btn-primary" type="button">
									<i class="fas fa-search fa-sm" id="_btnSearch"></i>
								</button>
							</div>
						</div>
						<!-- /검색 -->

				</div>

			</div>
		</div>
	</div>

</div>

<body>

	<!-- <div id="containerYear" style="min-width: 310px; max-width: 1300px; height: 400px; margin: 0 auto"></div> -->

	<div id="containerMonth" style="min-width: 310px; max-width: 1300px; height: 400px; margin: 0 auto"></div>

	<div id="containerDay" style="min-width: 310px; max-width: 1300px; height: 400px; margin-top: 30px; margin: 0 auto;"></div>
	
<script type="text/javascript">
//Create the chart
Highcharts.chart('containerMonth', {
    chart: {
        zoomType: 'xy'
    },
    title: {
        text: 'RHYMESb 매출'
    },
    subtitle: {
        text: '<%=request.getAttribute("search_year")%>'+'년도 월별 매출'
    },
    xAxis: [{
        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
        crosshair: true
    }],
    yAxis: [{ // Primary yAxis
        labels: {
            format: '{value}개',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        title: {
            text: '총 상품 판매 개수',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        }
    }, { // Secondary yAxis
        title: {
            text: '총 매출',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        labels: {
            format: '{value}원',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        opposite: true
    }],
    tooltip: {
        shared: true
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        x: 120,
        verticalAlign: 'top',
        y: 100,
        floating: true,
        backgroundColor:
            Highcharts.defaultOptions.legend.backgroundColor || // theme
            'rgba(255,255,255,0.25)'
    },
    series: [{
        name: '총 매출',
        type: 'column',
        yAxis: 1,
        data: [ <%=request.getAttribute("monthPriceStr") %> ],
        tooltip: {
            valueSuffix: '원'
        }

    }, {
        name: '총 상품 판매 개수',
        type: 'spline',
        data: [ <%=request.getAttribute("monthNumStr")%> ],
        tooltip: {
            valueSuffix: '개'
        }
    }]
});



var chart = Highcharts.chart('containerDay', {

    title: {
        text: 'RHYMESb 매출'
    },

    subtitle: {
        text: '<%=request.getAttribute("search_month")%>'+'월 일별 매출'
    },

    xAxis: {
        categories: <%=request.getAttribute("monthStr") %>
    },
    yAxis: { // Primary yAxis
        labels: {
            format: '{value}원',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        title: {
            text: '총 매출',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        }
    },
    series: [{
        type: 'column',
        colorByPoint: true,
        data: [ <%=request.getAttribute("dayStr") %>],
        showInLegend: false
    }]

});
</script>

</body>
</html>


