package bit.com.a.util;

import java.sql.Date;
import java.util.Calendar;

//<%=%>일때만 사용하고  JSTL과 함께 사용할 때는 static을 제거하고 get을 붙여
//useBean을 사용하자.
public class DateUtil {
	public static String toOne(String msg){
		return msg.charAt(0)=='0'?msg.charAt(1)+"":msg.trim();
	}
	//2012-08-07 문자열을 java.sql.Date로 바꾸기
	public static Date toDate(int year, int month, int day){
		String s = year + "-" + two(month+"") + "-" + two(day+"");
		Date d = Date.valueOf(s);
		return d;
	}
	public static String two(String msg){
		return msg.trim().length()<2?"0"+msg:msg.trim();
	}//
	public static String str(String msg){ //데크르라레이션에서 있던 메소드를 다 빼놨음
		return msg==null ?"":msg.trim();
	}//
	//완성하시오.
	public static String pollState(java.util.Date d){
		String s1="<div style='color:RED'>[종료]</div>";
		String s2="<div style='color:BLUE'>[진행중]</div>";
		return isEnd(d)?s1:s2;
	}
	//연월일만으로 대소 비교
	public static boolean isEnd(java.util.Date d){
		Calendar c=Calendar.getInstance();
		c.setTime(d);
		Calendar t=Calendar.getInstance();
		//오늘이 마지막날 보다 큰가?
		return Integer.parseInt(StringCal(t))>Integer.parseInt(StringCal(c));
	}
	//칼렌더를 20120807형식으로 만들기
	public static String StringCal(Calendar dd){
		String s=dd.get(Calendar.YEAR)+""+
		two((dd.get(Calendar.MONTH)+1)+"")+""+
		two(dd.get(Calendar.DATE)+"");
		return s;
	}
	
	
}