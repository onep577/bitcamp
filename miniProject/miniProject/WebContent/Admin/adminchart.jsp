<%@page import="java.util.ArrayList"%>
<%@page import="dto.AdminChartDto"%>
<%@page import="java.util.Calendar"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String year = (String)request.getAttribute("year");
String month = (String)request.getAttribute("month");

if(month.subSequence(0, 1).equals("0")){
	month = month.substring(1);
}

System.out.println("adminchart.jsp year : " + year + ", month : " +month);

List<AdminChartDto> yearPriceList[] = new ArrayList[3];
for(int i = 0; i < 3; i++) {
// 년도별 데이터를 가져왔다
yearPriceList[i] = (List<AdminChartDto>)request.getAttribute("yearPriceList"+i);
}


// 월별 데이터를 가져왔다
List<AdminChartDto> monthPriceList = (List<AdminChartDto>)request.getAttribute("monthPriceList");


List<AdminChartDto> datePriceList[] = new ArrayList[12];
for(int i = 0; i < 12; i++) {
	// 1월 ~ 12월 데이터를 가져왔다
	datePriceList[i] = (List<AdminChartDto>)request.getAttribute("datePriceList"+i);
}


// 일별 데이터를 가져왔다
//List<AdminChartDto> priceList = (List<AdminChartDto>)request.getAttribute("priceList");
// 연령별 데이터를 가져왔다
List<AdminChartDto> ageList = (List<AdminChartDto>)request.getAttribute("ageList");
// 지역별 데이터를 가져왔다
List<AdminChartDto> addressList = (List<AdminChartDto>)request.getAttribute("addressList");




//list -> json : 년도별 통계
String jsonlikeyear[] = new String[3];

for(int i = 0; i < 3; i++) {
	jsonlikeyear[i] = "";
	
	if(yearPriceList[i].size() != 0){
		jsonlikeyear[i] = "[";
		for(AdminChartDto m : yearPriceList[i]){
			jsonlikeyear[i] += "{ name: '"+ m.getStr() +"월', y:" + m.getNum() + "},";
		}
		
		jsonlikeyear[i] = jsonlikeyear[i].substring(0, jsonlikeyear[i].lastIndexOf(","));
		// 맨 끝에 ,만 빼고 다 가져와라
		jsonlikeyear[i] += "]";
	}else{
		jsonlikeyear[i] = "[{ name:'0', y:0 }]";
	}
}


//list -> json : 월별 통계
String jsonlikeMonth = "";
if(monthPriceList.size() != 0){
	jsonlikeMonth = "[";
	for(AdminChartDto m : monthPriceList){
		jsonlikeMonth += "{ name:'" + m.getStr() + "월', y:" + m.getNum() + ", drilldown:'"+m.getStr()+"월'},";
	}
	
	jsonlikeMonth = jsonlikeMonth.substring(0, jsonlikeMonth.lastIndexOf(","));
	// 맨 끝에 ,만 빼고 다 가져와라
	jsonlikeMonth += "]";
}else{
	jsonlikeMonth = "[{ name:'0', y:0, drilldown:'0' }]";
}


//list -> json : 일별 통계
String jsonlikedate[] = new String[12];

for(int i = 0; i < 12; i++) {
	jsonlikedate[i] = "";
	
	if(datePriceList[i].size() != 0){
		jsonlikedate[i] = "[";
		for(AdminChartDto m : datePriceList[i]){
			jsonlikedate[i] += "{ name: '"+ m.getStr() +"일', y:" + m.getNum() + "},";
		}
		
		jsonlikedate[i] = jsonlikedate[i].substring(0, jsonlikedate[i].lastIndexOf(","));
		// 맨 끝에 ,만 빼고 다 가져와라
		jsonlikedate[i] += "]";
	}else{
		jsonlikedate[i] = "[{ name:'0', y:0 }]";
	}
}










// list -> json : 일별 통계
/* 
String jsonlikeMonth = "";
if(priceList.size() != 0){
	jsonlikeMonth = "[";
	for(AdminChartDto m : priceList){
		jsonlikeMonth += "{ y:" + m.getY() + "},";
	}
	
	jsonlikeMonth = jsonlikeMonth.substring(0, jsonlikeMonth.lastIndexOf(","));
	// 맨 끝에 ,만 빼고 다 가져와라
	jsonlikeMonth += "]";
}else{
	jsonlikeMonth = "[{ y:0},]";
}
 */


//list -> json : 연령별 통계
String jsonlikeAge = "[";
for(AdminChartDto a : ageList){
	jsonlikeAge += "{ name:'" + a.getName() + "대    ', y:" + a.getY() + "},";
}
jsonlikeAge = jsonlikeAge.substring(0, jsonlikeAge.lastIndexOf(","));
//맨 끝에 ,만 빼고 다 가져와라
jsonlikeAge += "]";



//list -> json : 지역별 통계
String jsonlikeAddress = "[";

for(AdminChartDto d : addressList){
	jsonlikeAddress += "{ name:'" + d.getStr() + "', y:" + d.getNum() + "},";
}

jsonlikeAddress = jsonlikeAddress.substring(0, jsonlikeAddress.lastIndexOf(","));

jsonlikeAddress += "]";







for(int i = 0; i < 3; i++) {
	System.out.println((i+2017)+"년도별 통계 : " + jsonlikeyear[i]);
}
System.out.println("월별 통계 : " + jsonlikeMonth);
for(int i = 0; i < 12; i++) {
	System.out.println(i+"월 통계 : " + jsonlikedate[i]);
}
//System.out.println("일별 통계 : " + jsonlikeMonth);
System.out.println("지역별 통계 : " + jsonlikeAddress);
System.out.println("연령별 통계 : " + jsonlikeAge);




for(int i = 0; i < 3; i++) {
	request.setAttribute("jsonlikeyear"+i, jsonlikeyear[i]);
}
request.setAttribute("jsonlikeYear", jsonlikeMonth);
for(int i = 0; i < 12; i++) {
	request.setAttribute("jsonlikeYearMonth"+i, jsonlikedate[i]);
}
//request.setAttribute("jsonlikeMonth", jsonlikeMonth);
request.setAttribute("jsonlikeAddress", jsonlikeAddress);
request.setAttribute("jsonlikeAge", jsonlikeAge);



if(month.length() == 0){
	Calendar cal = Calendar.getInstance();
	month = ""+cal.get(Calendar.MONTH)+1;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔시그니엘</title>

<!-- 
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

JQuery 밑에다 하자

일별 통계
<script src="https://code.highcharts.com/highcharts.js"></script>

<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>

<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>

연령별 통계에 추가로 필요하다
<script src="https://code.highcharts.com/modules/series-label.js"></script>
 -->
 



 
<style type="text/css">
main{
	overflow: inherit;
	width: 80%;
	height: auto; /* 이걸로 메인에어리어 부분 높이 조정해서 알맞게 쓰기 !! */
	margin: auto;
	margin-bottom: 30px;
}

ul{
   list-style:none;
   padding-left:0px;
}

.menu > li{
	list-style:none;
	color: #eee;
}
.menu > li > a{

	color: #eee;
}  
.menu > li > a:hover{
	list-style:none;
	color: black;
}

#adminMenu{
	overflow: inherit;
	padding-top: 60px;
	padding-left: 30px;
	width: 16%;
	height: auto;
	float: left;
	background-color: gray;
}
#adminMain{
	overflow: inherit;
	width: 84%;
	height: auto;
	float: left;
	text-align: center;
	/* background-color: lightgray; */
	padding-bottom: 150px;
}	
.allMenu{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.3em;
  	color: red;
}
.wrapper{
	/* background-color: blue; */
	width: 100%;
	height: 600px;
}

.box1{
	/* background-color: orange; */
	/* width: 100%;
	height: 600px; */
}

.box2{
	/* background-color: pink; */
	width: 100%;
	height: 600px;
}
.addressBox{
	/* background-color: yellow; */
	width: 50%;
	height: 600px;
	float: left;
}
.agdBox{
	/* background-color: green; */
	width: 50%;
	height: 600px;
	float: left;
}	
</style>
</head>



<body>

<jsp:include page="../header.jsp" flush="false"/>
 
<main>

<div>
	<div id="adminMenu">
	<!-- 
		<ul class="menu">
			<li><a href="/miniProject/admin_servlet?command=adminChart" class="fatag">메인으로</a></li><br>
			<li><a href="/miniProject/customer_servlet?command=adminCustomer" class="fatag">회원 관리</a></li><br>
			<li><a href="/miniProject/admin_servlet?command=roomadmin" class="fatag">객실정보 관리</a><br>
				<ul class="menu"><br>
					<li><a href="/miniProject/admin_servlet?command=" class="fatag">&nbsp;&nbsp;&nbsp;객실정보 등록</a></li><br>
					<li><a href="/miniProject/admin_servlet?command=" class="fatag">&nbsp;&nbsp;&nbsp;객실정보 수정</a></li><br>
					<li><a href="/miniProject/admin_servlet?command=" class="fatag">&nbsp;&nbsp;&nbsp;객실정보 삭제</a></li><br>
				</ul>
			</li>
			<li><a href="/miniProject/booking_servlet?command=adminBooking" class="fatag">예약 관리</a></li><br>
			<li><a href="/miniProject/admin_servlet?command=qnalist&choice=&str=&pageNum=1" class="fatag">고객의소리 관리</a></li><br>
		</ul>
 -->
 	<jsp:include page="../adminMenu.jsp" flush="false"/>
	</div>
	
	<div id="adminMain">
	
	<div class="wrapper">
	
	<!-- 년도별 통계 -->
	<div id="containerYear" style="min-width: 310px; max-width: 1300px; min-height: 600px; margin: 0 auto"></div>
	
	<!-- 월별 통계와 일별통계 나오기 -->
	<div id="containerMonth" style="min-width: 310px; max-width: 1300px; min-height: 600px; margin: 0 auto"></div>
	
	<select id="year">
		<%for(int i = 2017; i < 2022; i++){ %>
		<option <%=year.equals(""+i)?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
		<%} %>
	</select>년
	<input type="button" class="payShow" value="매출 보기">

	<br><br><br><br><br>
	
	<!-- box1에 일별 통계가 나온다 -->
	<!-- <div class="box1" id="containerday" style="min-width: 310px; max-width: 1300px; margin: 0 auto"></div> -->
	<%-- <form id="frm">
	
	<select id="year">
		<%for(int i = 2018; i < 2026; i++){ %>
		<option <%=year.equals(""+i)?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
		<%} %>
	</select>년
	
	<select id="month">
		<%for(int i = 1; i <= 12; i++){ %>
		<option <%=month.equals(""+i)?"selected='selected'":"" %> value="<%=i %>"><%=i %></option>
		<%} %>
	</select>월
	<input type="button" class="payShow" value="매출 보기">
	</form> --%>
	
	<br><br><br><br><br>
	
	<div class="box2">
	<!-- 연령별 통계 -->
	<div class="addressBox" id="containerAge" style="min-width: 310px; max-width: 700px; margin: 0 auto"></div>
	<!-- 지역별 통계 -->
	<div class="agdBox" id="containerAddress" style="min-width: 310px; max-width: 700px; margin: 0 auto"></div>
	</div>	
	</div>
		
	</div>




</div>

</main>








<jsp:include page="../footer.jsp" flush="false"/>



<script type="text/javascript">
$(".payShow").click(function () {
	var year = $("#year").val();
	//var month = $("#month").val();
	
	//if(month.length < 2 ){
	//	month = "0"+month;
	//}
	//alert(year);
	
	location.href="admin_servlet?command=adminChart&year="+year;
});




// 년도별 통계
Highcharts.chart('containerYear', {
    chart: {
        type: 'line'
    },
    title: {
        text: '시그니엘 총 매출 년도별 통계'
    },
    subtitle: {
        text: '2017 ~ 2019'
    },
    xAxis: {
        categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
    },
    yAxis: {
        title: {
            text: '매출액 (백만 단위)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: false
        }
    },
    series: [{
        name: '2017',
        data: <%=request.getAttribute("jsonlikeyear"+0)%>
    }, {
        name: '2018',
        data: <%=request.getAttribute("jsonlikeyear"+1)%>
    }, {
        name: '2019',
        data: <%=request.getAttribute("jsonlikeyear"+2)%>
    }]
});




// 월별 통계와 일별통계 나오기
Highcharts.chart('containerMonth', {
    chart: {
        type: 'column'
    },
    title: {
        text: <%=year%>+'년도 월별 통계'
    },
    xAxis: {
        type: 'category'
    },
    yAxis: {
        title: {
            text: '매출액 (백만 단위)'
        }
    },
    legend: {
        enabled: false
    },
    plotOptions: {
        series: {
            borderWidth: 1,
            dataLabels: {
                enabled: true,
                format: '{point.y}원'
            }
        }
    },

    tooltip: {
        headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
        pointFormat: '<span style="color:{point.color}">{point.name}</span> : <b>{point.y}</b>원<br/>'
    },

    series: [
        {
            name: <%=year%>+'년 ',
            colorByPoint: true,
            data: <%=request.getAttribute("jsonlikeYear")%>
        }
    ],
    drilldown: {
        series: [
            {
                name: "1월",
                id: "1월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+0) %>
            },
            {
                name: "2월",
                id: "2월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+1) %>
            },
            {
                name: "3월",
                id: "3월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+2) %>
            },
            {
                name: "4월",
                id: "4월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+3) %>
            },
            {
                name: "5월",
                id: "5월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+4) %>
            },
            {
                name: "6월",
                id: "6월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+5) %>
            },{
                name: "7월",
                id: "7월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+6) %>
            },
            {
                name: "8월",
                id: "8월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+7) %>
            },
            {
                name: "9월",
                id: "9월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+8) %>
            },{
                name: "10월",
                id: "10월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+9) %>
            },
            {
                name: "11월",
                id: "11월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+10) %>
            },
            {
                name: "12월",
                id: "12월",
                data: <%=request.getAttribute("jsonlikeYearMonth"+11) %>
            }
            
            
            
        ]
    }
});
/**/


// 일별 통계
<%-- 
Highcharts.chart('containerday', {

    title: {
        text: <%=year %>+'년 '+<%=month %>+'월달 매출 통계'
    },

    subtitle: {
        text: <%=year %>+'년 '+<%=month %>+'월달 매출 통계'
    },
    
    xAxis:{
    	title: {
    		text: '일'
    	},
        tickInterval: 1,
        startpoint: 1
    },

    yAxis: {
    	allowDecimals: true,
        title: {
            text: '매출 액수 (단위 백만)'
        },
        tickInterval: 1500000
    },
    legend: {
        layout: 'vertical',
        align: 'right',
        verticalAlign: 'middle'
    },

    plotOptions: {
        series: {
            label: {
                connectorAllowed: false
            },
            pointStart: 1
        }
    },

    series: [{
        name: <%=month %>+'월',
        data: <%=request.getAttribute("jsonlikeMonth") %>
    }],

    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom'
                }
            }
        }]
    }

});

 --%>

// 연령별 통계와 지역별 통계에서 사용하는 pie 차트를 사용하기 위해 필요하다
Highcharts.setOptions({
  colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
    return {
      radialGradient: {
        cx: 0.5,
        cy: 0.3,
        r: 0.7
      },
      stops: [
        [0, color],
        [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
      ]
    };
  })
});



//연령별 통계
Highcharts.chart('containerAge', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: '연령대별 방문 횟수 통계'
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
        },
        connectorColor: 'silver'
      }
    }
  },
  series: [{
    name: 'Share',
    data: <%=request.getAttribute("jsonlikeAge") %>
  }]
});



//지역별 통계
Highcharts.chart('containerAddress', {
  chart: {
    plotBackgroundColor: null,
    plotBorderWidth: null,
    plotShadow: false,
    type: 'pie'
  },
  title: {
    text: '지역별 통계'
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
        },
        connectorColor: 'silver'
      }
    }
  },
  series: [{
    name: 'Share',
    data: <%=request.getAttribute("jsonlikeAddress") %>
  }]
});
</script>

</body>
</html>