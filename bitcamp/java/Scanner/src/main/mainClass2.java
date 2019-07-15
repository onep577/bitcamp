package scanner;

public class mainClass2 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		// TODO 여기는 메인입니다
		System.out.println("Hello Java");
		//클래스 변수 함수
		//println에서 ln은 라인의 약자 개행 줄바꿈
		System.out.print("Hello Java");
		System.out.println("Hello Java");
		//한 줄 주석문

		/*
		범위 주석문
		주석문 : 컴파일 되지 않는다
		           Compile(프로그램 언어 -> 기계어)
		소스의 내용을 명시 (상세히 적는 게 좋다)
		
		html <!-- 주석문 --!>
		oracle --
		jsp <%-- 주석문 --%>
		*/
		
		//TODO 여기는 끝 부분입니다
		
		// input, output
		System.out.println('a');        //문자 하나 작은 따옴표
		System.out.print("hello\n");    //\n은 escape sequence 문자열 쌍 따옴표
		
		System.out.println("헬로우 자바"); //문자열
		System.out.println(12345);      //숫자
		
		//System.out.println('abcdefg'); 형식에 맞지않아 에러
		System.out.println("a");
		
		System.out.println(12 + 34);         //숫자
		System.out.println("12 + 34");       //문자열
		System.out.println(12 + 34 + "56");  //숫자와 문자열
		System.out.println("12" + 34 + 56);  //앞이 문자열이면 그 뒤도 문자열로 포함
		
		//print 목적은 출력, println 목적은 개행출력
		System.out.print("Hello");
		System.out.println();
		System.out.println("World");
		
		// f == format(형식,값) d는 정수
		System.out.printf("%d", 24);
		
	}

}
