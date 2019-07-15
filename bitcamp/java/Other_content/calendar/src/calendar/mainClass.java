package calendar;

import java.util.Calendar;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	Calendar, Date
		*/
		// Calendar cal = new GregorianCalendar();
		
		Calendar cal = Calendar.getInstance();
		// 일정관리 = 예약시스템
		
		
		
		// 날짜 취득 == getter	get은 얻다
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;	// 0 ~ 11나와서 +1 해야한다
		int day = cal.get(Calendar.DATE);
		
		System.out.println(year + "년 " + month + "월 " + day + "일 ");
		// 2019년 5월 28일

		
		// 날짜 설정 == setter
		cal.set(Calendar.YEAR, 2020);
		cal.set(Calendar.MONTH, 4 - 1);		// 4월이 나온다
		cal.set(Calendar.DATE, 27);
		
		
		year = cal.get(Calendar.YEAR);
		month = cal.get(Calendar.MONTH) + 1;	// 0 ~ 11나와서 +1 해야한다
		day = cal.get(Calendar.DATE);
		
		System.out.println(year + "년 " + month + "월 " + day + "일 ");
		// 2020년 4월 27일
		
		
		
		// 오전(0) : 오후(1)
		String ampm = cal.get(Calendar.AM_PM) == 0? "오전":"오후";
		System.out.println("ampm = " + ampm + " " + cal.get(Calendar.AM_PM));
		// ampm = 오후1
		
		
		
		// 요일
		int weekday = cal.get(Calendar.DAY_OF_WEEK);
		// 일요일 1, 월요일 2 ~ 토요일 7
		System.out.println("weekday = " + weekday);
		// weekday = 2
		
		
		switch(weekday) {
			case 1:
				System.out.println("일요일입니다");
				break;
			case 2:
				System.out.println("월요일입니다");
				break;
			case 3:
				System.out.println("화요일입니다");
				break;
			case 4:
				System.out.println("수요일입니다");
				break;
			case 5:
				System.out.println("목요일입니다");
				break;
			case 6:
				System.out.println("금요일입니다");
				break;
			case 7:
				System.out.println("토요일입니다");
				break;
		}
		// 월요일입니다
		
		
		
		cal.set(Calendar.MONTH, 9 - 1); // 9월
		//month = cal.set(Calendar.MONTH, 9 - 1); // 9월
		// 에러코드 Type mismatch: cannot convert from void to int
		System.out.println(year + "년 " + month + "월 " + day + "일 ");
		// 2020년 4월 27일     2020년 9월 27일 되지않은 이유는? set은 세팅만 해준다 get으로 얻어야 날짜가 바뀐다
		
		// 지정한 달의 마지막 날짜를 취득(31, 30, 29, 28)
		int lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		System.out.println("lastday = " + lastday);
		// lastday = 30
		
		
		
		// 년월일을 설정하면, 달력의 빈칸이 몇개 있는지 취득
		year = 2020;
		month = 4;
		day = 3;
		
		// 2020년 4월 3일로 세팅
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1); // 1 ~ 12
		cal.set(Calendar.DATE, day);
		
		weekday = cal.get(Calendar.DAY_OF_WEEK); // 요일을 얻는다
		// 요일을 구한다 일요일 1 월요일 2 화요일 3 ~ 토요일 7
		int _day = (weekday - 1) % 7; // 그 달의 첫째 날이 수요일이라면 _day는 3이다 (일,월,화)
		System.out.println("윗쪽의 빈칸은 " + _day + "칸입니다");
		//윗쪽의 빈칸은 5칸입니다
		
		// 밑쪽의 빈칸
		// 마지막 날짜
		lastday = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DATE, lastday); // 29일로 세팅
		System.out.println("lastday = " + lastday);
		// lastday = 30
		
		// 요일
		weekday = cal.get(Calendar.DAY_OF_WEEK);
		System.out.println("weekday = " + weekday);
		// weekday = 5
		
		int _lastday = 7 - weekday;
		System.out.println(month + "월의 밑의 빈칸은 " + _lastday + "입니다");
		// 4월의 밑의 빈칸은 2입니다
		/**/
		
		
		
		
		
		
		
		/*		9월
		 	달력을 만들어 보자
		 *  *  *  1  2  3  4
		 5  6  7  8  9  10 11
		 12 13 14 15 16 17 18
		 19 20 21 22 23 24 25
		 26 27 28 29 30 ...등
		
		Calendar cale = Calendar.getInstance();
		// 9월 달력의 1일이 무슨요일인지
		// 1일 앞에 빈칸이 몇개인지
		// 9월 달력의 마지막날이 며칠인지
		// 마지막날 뒤에 빈칸이 몇개인지
		// 마지막날 
		*/
		
		
		
	} // main 함수

} // main class
