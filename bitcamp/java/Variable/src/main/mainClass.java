package variable;

public class mainClass {

	public static void main(String[] args) {
		
		/*
		    소스코드
		     |
		    컴파일(문자코드 -> 기계어(2진수코드)) - lib파일(*.jar)
		     |
		  build  == .exe 파일 생성
		     |
		     실행
		     
		     컴파일과 build는 보통 묶어 실행된다
		  [Project] -> [build Automatically]
	    */
		
		/*
		  
		  숫자(상수): 2진수 : 0, 1
		          8진수 : 0 ~ 7   10(일영) == 8 -> 010 (8진수는 앞에 0을 쓴다)
		          10진수: 0 ~ 9
		          16진수 : 0 ~ 9 A B C D E F (F는 15)
		                                   0x8 0xA1 (16진수는 앞에 0x를 쓴다)
		          
		          1010 1100    1111 1111 -> 255 (2진수로 적을 때)
		          8421 8421
		          
		          16*10 + 1*12 = 172  (10진수로 적을 때)		          
		          
		          16의1승 16의0승		          
		          0xAC         0xFF         0X0000FF (16진수로 적을 때) (RGB)
		  
		  
		  변수: 특정 이름을 정하고 원할 때 값을 변경할 수 있는 수
		            바로 알아 볼 수 있도록 선언한다
		     (그릇에 비유)
		     int == integer (정수)
		           예약어
		*/
		
		int i;
		//자료형 변수명
		
		int aa; //노란색 이유는 사용하지 않아서 경고메시지
		int _num;
		int num_;
		int n; //학생수는 number니까 n이라고 해도 되지만 바로 알아 볼 수 있도록 선언하자
		int studentNumber; //나와 다른 사람도 바로 알아 볼 수 있도록 선언한 예이다
		int stNum; 
		int stu_num;
		
		// int int; 예약어 사용 불가능
		// int _num; //같은 변수 다시 선언 불가능 에러 코드 Duplicate local variable _num
		// int -num; //연산자 포함 불가
		// int *num;
		// int 1sb; //맨 처음에 숫자로 설정불가 에러 코드 Syntax error on token "1", delete this token
		int 넘버; //변수명 한글 사용가능 하지만 사용하지 말자
		
		
		
		
		
		//변수의 종료
		/*
		숫자형
		        정수
		    byte    1 byte  == 8 bit   256개 숫자를 표현
		    short   2 byte  short int
		    int     4 byte
		    long    8 byte  long int
		    
		        소수(실수)
		    float   4 byte (원을 그리면 마름모가 나온다 정확한 소수점을 표현 못 한다)
		    double  8 byte 
		        
		문자형
		        문자
		    char    2 byte  character  ASCII(아스키코드) == 문자의 숫자
		                               'A' == 65 'a' == 97
		        
		        문자열         "abc" "cdefg"  String (!= 자료형) == class  wrapper class
		
		참/거짓
		boolean 1 byte  true(1)/false(0)
		
		int, double, char, boolean 많이 사용
		*/

		// 변수 사용법
		int number;
		// 변수의 자료형		int
		// 변수명			number
		number = 123;	// 대입 연산자
		System.out.println(number);
		number = 234;
		System.out.println(number); // 123은 사라지고 234가 출력된다
		
		byte by;	// 변수의 선언
		by = 12;	// 변수에 값을 대입
		
		byte by1 = 23; // 변수의 선언과 동시에 값을 대입
		
		System.out.println("by = " + by);
		
		//by = 128; // 에러코드 표현 범위 넘김 Type mismatch: cannot convert from int to byte
		System.out.println("by = " + by);
		by = 127; //표현 할 수 있음
		System.out.println("by = " + by);
		//by = -129; // 에러코드 표현 범위 넘김 Type mismatch: cannot convert from int to byte
		System.out.println("by = " + by);
		by = -128;
		System.out.println("by = " + by);
		
		
		int Number; // 4byte
		int NUMBER; // 변수는 대문자로 사용 말자
		Number = 123456; // 왠만한 값은 integer로 출력 가능
		System.out.println(Number);
		
		
		long lo;
		// lo = 5674593655656; 에러코드 The literal 5674593655656 of type int is out of range 
		// lo = 5674593655656l; // 멘 끝에 엘은 소문자로 사용가능 하지만 
		lo = 5674593655656L; // 대문자로 사용한다
		System.out.println(lo);
		
		
		float f;
		f = 123.4f;
		System.out.println("f = " + f);
		
		
		double d;
		d = 123.4567891231231231239; //반올림
		System.out.println(d);
		
		
		// 문자
		char c;
		
		c = 'A';
		System.out.println("c = " + c);
		// c = "A"; 에러코드 Type mismatch: cannot convert from String to char
		c = 66; //B 출력
		System.out.println("c = " + c);
		c = 66 + 1 ; //C 출력
		System.out.println("c = " + c);
		
		System.out.printf("%c %d \n", c, (int)c);
		
		// 문자열
		// String == 자료형이 아님!!
		// Wrapper class == 자료형을 클래스로 만들어 놓은 것
		
		String str; // str 변수가 아닌 객체 이후에 다시 배운다
		str = "안녕하세요";
		System.out.println("str = " + str);
		str = "반갑습니다";
		System.out.println("str = " + str);
		
		// true(1)/false(0)
		// bool과  BOOL의 차이점은 용량이 다르다
		// bool(1byte) 0/1  / BOOL(4byte) 0/213213 C언어
		
		boolean b;
		b = true;
		System.out.println(b);
		b = false;
		System.out.println(b);
		// b = 0; // 에러코드 Type mismatch: cannot convert from int to boolean
		
		// escape sequence
		// \n == 개행. 줄 맞춤 때 편리하다
		// \t == tap 띄어쓰기
		System.out.println("hello\t" + "world");
		// "world"  \" \'
		System.out.println("\"world\"");
		System.out.println("\'world\'");
		
		
		
	}

}
