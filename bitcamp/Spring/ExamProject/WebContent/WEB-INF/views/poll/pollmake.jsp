<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Calendar cal = Calendar.getInstance();
int tyear = cal.get(Calendar.YEAR);
int tmonth = cal.get(Calendar.MONTH) +1;
int tday = cal.get(Calendar.DATE);
%>

<form id="polForm" method="post" enctype="multipart/form-data">
<table class="list_table" style="width: 65%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>



<tr>
	<th>투표기한</th>
	<td style="text-align: left;">
		<select name="syear">
			<%
			for(int i = tyear; i < tyear+6; i++){
				%>
				<option <%=(tyear+"").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>년
		
		<select name="smonth">
			<%
			for(int i = 1; i <= 12; i++){
				%>
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>월
		
		<select name="sday">
			<%
			for(int i = 1; i < cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>
				<option <%=(tday+"").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>일
			~
		<select name="eyear">
			<%
			for(int i = tyear; i < tyear+6; i++){
				%>
				<option <%=(tyear+"").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>년
		
		<select name="emonth">
			<%
			for(int i = 1; i <= 12; i++){
				%>
				<option <%=(tmonth+"").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>월
		
		<select name="eday">
			<%
			for(int i = 1; i < cal.getActualMaximum(Calendar.DAY_OF_MONTH); i++){
				%>
				<option <%=(tday+"").equals(i+"")?"selected='selected'":"" %>
					value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>일
		
	</td>
</tr>

<tr>
	<th>투표 제목</th>
	<td style="text-align: left;">
		<input type="text" size="50" name="title">
	</td>
</tr>

<tr>
	<th>투표 질문수</th>
	<td style="text-align: left;">
		<select name="itemcount" onchange="pollchange(this)">
			<%
			for(int i = 1; i <= 20; i++){
				%>
				<option <%=(20+"").equals(i+"")?"selected='selected'":"" %>
				value="<%=i %>"><%=i %></option>
				<%
			}
			%>
		</select>개
	</td>
</tr>
</table>

<br><br><br><br><br><br><br><br>

<%
for(int i = 1; i <= 20; i++){
%>
<div id="poll<%=i %>" name="poll<%=i %>">
<table class="list_table" style="width: 95%">
<colgroup>
	<col width="200px"><col width="500px">
</colgroup>
<tr>
	<th><%=(i+"") %>번 질문</th>
	<td style="text-align: left;">
		<table>
			<colgroup>
				<col width="100px"><col width="500px">
			</colgroup>
			<tr>
				<td>질문</td>
				<td><input type="text" name="question" size="80"></td>
			</tr>
			<tr>
				<td>상세질문</td>
				<td><input type="file" name="question_sub" value="파일 선택"></td>
			</tr>
			<tr>
				<td>보기</td>
				<td>
				1번 : <input type="text" name="pollsub1" class="pollsub1<%=i%>" onchange="changeVal1(<%=i%>)"><br>
				2번 : <input type="text" name="pollsub2" class="pollsub2<%=i%>" onchange="changeVal2(<%=i%>)"><br>
				3번 : <input type="text" name="pollsub3" class="pollsub3<%=i%>" onchange="changeVal3(<%=i%>)"><br>
				4번 : <input type="text" name="pollsub4" class="pollsub4<%=i%>" onchange="changeVal4(<%=i%>)">
				</td>
			</tr>
			<tr>
				<td>답</td>
				<td>
				1번 : <b class="b_sub1<%=i%>"></b>&nbsp;<input type="radio" name="answer<%=i %>" class="answer_sub1<%=i%>"><br>
				2번 : <b class="b_sub2<%=i%>"></b>&nbsp;<input type="radio" name="answer<%=i %>" class="answer_sub2<%=i%>"><br>
				3번 : <b class="b_sub3<%=i%>"></b>&nbsp;<input type="radio" name="answer<%=i %>" class="answer_sub3<%=i%>"><br>
				4번 : <b class="b_sub4<%=i%>"></b>&nbsp;<input type="radio" name="answer<%=i %>" class="answer_sub4<%=i%>">
				</td>
			</tr>
		</table>
	</td>
</tr>
</table>
</div>
<%
}
%>
<input type="hidden" name="answer" id="_answer">
<input type="hidden" name="teacher" value="${login.id }">
</form>

<input type="button" id="pollsubmit" value="투표만들기">



<script type="text/javascript">
$(document).ready(function () {	
	for(i = 1; i <= 20; i++){
		$("#poll" + i).hide();
	}

	
	// 해당 년,월에 맞는 일을 리턴해준다
	$("select[name='smonth']").change( setDay1 );
	$("select[name='emonth']").change( setDay2 );
	

	$("#pollsubmit").click(function () {
		//alert("333");
		
		var itemcount = $("select[name=itemcount]").val();
		//alert(itemcount);
		
		var str = "";
		for(i=1; i<=itemcount; i++){
			var answer = $("input[name=answer"+i+"]:checked").val();
					
			str += answer + ",";
		}		
		var answer = str.substring(0, str.length -1);
		$("#_answer").val( str );
		//alert(answer);
		
		$("#polForm").attr("action","pollmakeAf.do").submit();
	});
});



// 입력값이 바뀌면 자동으로 바뀌게 한다
function changeVal1(num) {
	//alert(num);
	var pollsub = $(".pollsub1"+num).val();
	//alert(pollsub);
	$(".answer_sub1"+num).val( pollsub );
	$(".b_sub1"+num).text( pollsub );
}
function changeVal2(num) {
	//alert(num);
	var pollsub = $(".pollsub2"+num).val();
	//alert(pollsub);
	$(".answer_sub2"+num).val( pollsub );
	$(".b_sub2"+num).text( pollsub );
}
function changeVal3(num) {
	//alert(num);
	var pollsub = $(".pollsub3"+num).val();
	//alert(pollsub);
	$(".answer_sub3"+num).val( pollsub );
	$(".b_sub3"+num).text( pollsub );
}
function changeVal4(num) {
	//alert(num);
	var pollsub = $(".pollsub4"+num).val();
	//alert(pollsub);
	$(".answer_sub4"+num).val( pollsub );
	$(".b_sub4"+num).text( pollsub );
}



// 
function pollchange( me ){
	// 보기의 갯수를 갱신한다
	var num = me.options[me.selectedIndex].value;
	//alert("num : " + num);
	
	// 전부 초기화
	for(i = 1; i <= 20; i++){
		$("#poll" + i).val("");
		$("#poll" + i).hide();
	}
	
	for(i = 1; i <= num; i++){
		$("#poll" + i).show();
	}
}

// 해당 년,월에 맞는 일을 리턴해준다
function setDay1(){
	// 년도와 달을 통해서 마지막 날짜를 구한다
	var year = $("select[name='syear']").val() + "";
	var month = $("select[name='smonth']").val() + "";
	
	var lastday = ( new Date(year, month, 0) ).getDate();
	// 년도, 월, 일
	//alert(lastday);
	
	var str = "";
	for(i = 1; i <= lastday; i++){
		str += "<option value='" + i + "'>" + i + "</option>";
	}
	
	$("select[name='sday']").html( str );
}

// 해당 년,월에 맞는 일을 리턴해준다
function setDay2(){
	// 년도와 달을 통해서 마지막 날짜를 구한다
	var year = $("select[name='eyear']").val() + "";
	var month = $("select[name='emonth']").val() + "";
	
	var lastday = ( new Date(year, month, 0) ).getDate();
	// 년도, 월, 일
	//alert(lastday);
	
	var str = "";
	for(i = 1; i <= lastday; i++){
		str += "<option value='" + i + "'>" + i + "</option>";
	}
	
	$("select[name='eday']").html( str );
}

</script>


