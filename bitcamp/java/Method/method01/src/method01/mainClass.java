package method01;

public class mainClass {
	// main함수 (main 메소드라고 안한다) void가 있다는 건 return값이 없다는 것
	/*
	 	function : 함수
	 			 : 특정 처리를 하기위한 process
	 	구성 : return 값, 매개변수(인수, 인자, parameter 파라미터)
	 	
	 	형태 :
	 	return 값 함수명(매개변수1, 매개변수2, ...){
	 		처리 영역
	 		
	 		return 값;
	 	}
	 	
	 	void : 형태가 없는 자료형
	 	
	 	method == function
	 	: 특정 class에 소속되어 있는 function을 method
	 	
	 	C언어의 특징 : function -> C++ function(method)
	 	C언어는 function만 있어서 다음에 나온 게 C++언어이다
	 	java의 특징 : class <- function(method)
	*/

	
	public static void main(String[] args) {
		function1();	// function1() 호출하는 코드
		function2(123);	// 123을 가지고  function2(123) 호출하는 코드
		function2(456); // 각각의 다른 처리를 하기 때문에 function2(456) 함수도 호출된다
		function3('A', 1357, "hello"); // A는 c로 1357은 i로 hello는 str로 들어간다
		
		
		// function4(); // 함수는 호출과 리턴값 가져왔다 보이지 않는 것뿐
		int re;
		re = function4(); // re에 리턴값을 넣는다
		System.out.println("re = " + re);
		
		
		/*
		double r;
		r = Math.random();
		r = r * 10;
		int ir = (int)r;
		*/
		
		
		double d; // function5() 함수와 변수명이 같지만 쓸 수 있다 지역이 다르기 때문에 쓸 수 있다
		d = function5(5, 2);
		System.out.println("d = " + d);
		
		int num1, num2;
		String op;
		int result;
		
		num1 = 7;
		num2 = 2;
		op = "+";
		
		// num1에 7, op에 +, num2에 2가 들어간다
		result = calculator(num1, op, num2);
		System.out.println(num1 + op + num2 + " = " + result);
		
		
		num1 = 8;
		num2 = 6;
		op = "*";
		
		// num1에 8, op에 *, num2에 6가 들어간다
		result = calculator(num1, op, num2);
		System.out.println(num1 + op + num2 + " = " + result);
		// 복잡한 처리도 한줄로 바꿀 수 있다 함수의 장점
		
		
		// char	-> ASCII(int)
		// 'A'	-> 65
		char ch = 'b';
		
		int asc = charToAscCode(ch);
		System.out.println(ch + "문자의 아스키코드 값 : " + asc);
		
		
		// ASCII(int)	-> char
		// 97			-> 'a'

		int _i = 99;
		char _ch = ascCodeToChar(_i);
		System.out.println(_i + "숫자의 아스키코드 문자 : " + _ch);
				
		
		char c1 = 'D';
		// 들어가는 값 char, 나오는 값 char
		// char(대문자) -> char(소문자)
		// 65('A')		97('a'
		char c2 = toLowerCase(c1);
		System.out.println("대문자 : " + c1 + " -> 소문자 : " + c2);
		
	} // main 함수
	
	
	
	// 나오는 것도 없고 들어가는 값도 없다
	// void 출구, 리턴값, () 입구, 매개변수 자리
	static void function1() {
		System.out.println("function1() 함수가 호출되었다");
		// function1() 호출되었다 출력 되었다는 건 function1() 함수가 호출되었다는 것
		// 콘솔에 출력은 되지만 돌아가는 값은 없다
	} // function1 함수
	
	
	// int n은 매개변수 , 매개변수를 통해서 호출할 수 있다
	static void function2(int n) {	// n == 가인수, 가상인수 버츄얼 파라매타
		System.out.println("function2(int n) 함수가 호출되었다");
		System.out.println("n = " + n);
		// 콘솔에 출력은 되지만 돌아가는 값은 없다
	} // function2 함수
	
	
	// 리턴값은 없고 매개변수는 3개이다
	static void function3(char c, int i, String str) {
		System.out.println("function3(char c, int i, String str) 함수가 호출되었다");
		System.out.println("c = " + c);
		System.out.println("i = " + i);
		System.out.println("str = " + str);
	} // function3 함수
	
	
	static int function4() {
		// 에러코드 This method must return a result of type int
		// int타입의 리턴값을 안 적었다
		System.out.println("function4() 함수가 호출되었다");
		
		return 3;
	} // function4 함수
	
	
	// 매개변수 2개, 리턴값 1개
	static double function5(int num1, int num2) {
		System.out.println("function5(int num1, int num2) 함수가 호출되었다");
		double d = (double)num1 / num2; // cast 변환
		
		return d;
	} // function5 함수
	
	
	static int calculator(int num1, String oper, int num2) {
		int result = 0;
		if(oper.equals("+")) {
			result = num1 + num2;
		}
		else if(oper.equals("-")) {
			result = num1 - num2;
		}
		else if(oper.equals("*")) {
			result = num1 * num2;
		}
		else if(oper.equals("/")) {
			result = num1 / num2;
		}
		
		return result;
	} // calculator 함수
	
	
	// 들어가는 값 char, 리턴값 int
	// 문자가 들어가면 그 문자의 아스키코드 값으로 바꿔 숫자로 리턴하는 함수
	static int charToAscCode(char ch) {
		int i= (int)ch;
		
		return i;
	} // charToAscCode 함수
	

	// 들어가는 값 int, 리턴값 char
	// 숫자가 들어가면 그 숫자의 아스키코드 문자로 리턴하는 함수
	static char ascCodeToChar(int i) {
		char ch  = (char)i;
		
		return ch;
	} // ascCodeToChar 함수
	
	
	// 들어오는 값 대문자 -> 리턴값 소문자
	// 대문자를 아스키코드 소문자로 리턴하는 함수
	static char toLowerCase(char ch) {
		int ascnum = ch + 32;
		char ascchar = (char)ascnum;
		
		return ascchar;

		// return (char)((int)ch + 32);
	} // toLowerCase 함수
	
	

} // main class


