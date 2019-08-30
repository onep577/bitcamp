package bit.com.a.util;

import java.util.List;

import bit.com.a.model.CalendarDto;

public class Util {
	
	// nvl함수
	public boolean nvl(String msg){
		// 값이 null이거나 공백이 아닐 때 즉, 값이 있을 때 false를 반환한다
		return msg == null || msg.trim().equals("")?true:false;
	}
	// 날짜를 클릭하면, 그날의 일정이 모두 보이게 하는 callist.jsp로 이동하는 함수
	public String callist(int year, int month, int day){
		String str = "";
		
		// %s는 string으로 들어간다
		str += String.format("<a href='%s?year=%d&month=%d&day=%d'>" ,
								"callist.do", year, month, day );
		str += String.format("%2d", day);
		// %2d : 4일이면 한글자니까 숫자 표현할 때 두칸으로 잡아라
		str += "</a>";
		return str;
	}
	/*
	<a href='callist.jsp?year=2019&month=07&day=31'>31</a>
	<a href='callist.jsp?year=2019&month=07&day=31'> 4</a>
	*/
	// 일정을 기입하기 위해서 pen이미지를 클릭하면, calwrite.jsp 이동시키는 함수
	public String showPen(int year, int month, int day){
		String str = "";
		
		String image = "<img src='image/pen.gif'>";
		
		str = String.format("<a href='%s?year=%d&month=%d&day=%d'>%s</a>",
								"calwrite.do", year, month, day, image);
		/*
			<a href='calwrite.jsp?year=2019&month=07&day=31'>
				<img str'image/pen.gif'>
			</a>
		*/
		return str;
	}
	// 1 -> 01		2019731 -> 20190731
	public String two(String msg){
		return msg.trim().length()<2?"0"+msg.trim():msg.trim();
	}
	// 각 날짜별로 테이블을 생성하는 함수
	public String makeTable(int year, int month, int day, List<CalendarDto> list) {
		// 몇년도 몇월 며칠에 대해서 일정이 어떻게 되는지?
		String str = "";
		// 20190731
		String dates = (year + "") + two(month + "") + two(day + "");
		
		str += "<table frame=void>";
		str += "<col width='98'>";
		
		for(CalendarDto dto : list){
			if(dto.getRdate().substring(0, 8).equals(dates)){
				// 0번부터 8전까지 즉, 0 ~ 7 데이터베이스와 자바의 substr 코드가 다르다
				str += "<tr bgcolor='white'>";
				str += "<td style='border: hidden;'>";
				
				str += "<a href='caldetail.do?seq=" + dto.getSeq() + "'>";
				// <a href='caldetail.jsp?seq=5'>
				str += "<font style='font-size:8;color:red'>";
				str += dot3(dto.getTitle());
				
				str += "</font>";
				str += "</a>";
				str += "</td>";
				str += "</tr>";
			}
		}	
		str += "</table>";
		
		return str;
	}
	// 제목이 너무 길면 제목+...으로 처리하는 함수
	// 예) 최이사님과 점심 약속 있음 -> 최이사님과 점심...
	public String dot3(String msg){
		String str = "";
		
		if(msg.length() >= 10){
			str = msg.substring(0, 10);
			// 0 ~ 9까지
			str += "...";
		}else{
			str = msg.trim();
		}
		return str;
	}

}
