package calculator;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		// 계산기
		int number1, number2;
		String oper;
		int result;
		
		// 1. 첫번째 수
		number1 = numberInput(1); // 문자열로 입력하고 문자열을 숫자로 바꾼다
		
		// 2. 연산자
		oper = operatorInput();
		
		// 3. 두번째 수 (나누기가 0일때는 무시)
		number2 = numberInput(2);
		
		// 4. 연산 (+, -, *, /)
		result = processing(number1, number2, oper);
		
		// 5. 결과
		printing(number1, number2, oper, result);

	} // main 함수
	
	
	
	static int numberInput(int n){
		String str = "";
		
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			System.out.print(n + "번째 숫자를 입력하세요 : ");
			str = scan.next();
			
			boolean b = isNumber(str);
			// 문자열의 값이 전부 숫자로 이루어졌는지 확인하는 함수
			// 입력한 문자열 str이 숫자인지 확인한다 함수 안에서도 함수를 호출할 수 있다
			
			if(n == 2 && str.equals("0")) {
				// 2번째 숫자가 0일 때 b의 값을 확인하는 코드를 생략하고
				// while문으로 돌아가서 다시  n + "번째 숫자를 입력하라고 한다
				continue;
			}
			
			if(b == true) {
				break;
			} else {
				// null이거나 값이 없으면 여기로 온다
				// // 하나의 문자라도 0 ~ 9까지가 아니면 false
				System.out.println("숫자가 아닌 문자가 포함되어있습니다");
				System.out.println("다시 입력해 주세요");
			}
		} // while
		
		// 문자열이 null이거나 값이 0이거나 두번째 숫자가 0이 아니면서 모두 숫자로 이루어져 있을때 온다
		// String을 int로 바꾼다
		int num = Integer.parseInt(str);
		// "345" -> 숫자 345 로 바꾼다
		
		return num;
	} // numberInput 함수
	
	
	// 문자열의 값이 모두 숫자인지?
	static boolean isNumber(String st){
		// st가 입력한 문자열
		if(st == null || st == "") {
			return false;
		}
		// null이거나 값이 없으면 false
		boolean b = true;
		int num;
		char ch;
		
		// charAt( 0, 1, 2 )
		for(int i = 0; i < st.length(); i++) {
			// 입력한 문자열에서 문자 하나씩 빼서 그 문자의 아스키 코드값을 num에 넣는다
			ch = st.charAt(i);		
			num = (int)ch;
			
			// 아스키 코드값이 48 ~ 57 까지가 0 ~ 10이고 if문 처럼 아니면 0 ~ 10 까지가 아니다
			// 그러면 11부터는 어떻게 인식할까?
			// 문자열이기 문자 하나씩 0 ~ 9 까지인지 대조하기때문에 전부다 숫자로 이루어진 문자열을 판명할 수 있다
			// 138은 1이 0 ~ 9까지인지 3이 0 ~ 9까지인지 8이 0 ~ 9까지인지 대조한다
			if(num < 48 || num > 57) { // 아스키코드값 48 ~ 57은 0 ~ 10까지 이다
				// 하나의 문자라도 0 ~ 9까지가 아니면 false
				b = false;
				break;
			}
		}
		
		return b; // return 되는 값은 모두 true이다
	} // isNumber 함수
	
	
	
	static String operatorInput() {
		String oper = "";
		Scanner scan = new Scanner(System.in);

		while(true) {
			System.out.print("연산자(+, -, *, /) 중 하나를 입력하세요 : ");
			oper = scan.next();
			
			if( oper.equals("+") || oper.equals("-") 
					|| oper.equals("*") || oper.equals("/") ) {
				break;
			}
			else {
				// + - * / 넷 중 하나가 아니면
				System.out.println("잘못 입력하셨습니다. 다시 입력해주세요");
			}
			
		} // while
		
		return oper;		
	} // operatorInput 함수
	
	
	
	static int processing(int number1, int number2, String oper) {
		int result = 0;
		
		switch(oper) {
			case "+" :
				result = number1 + number2;
				break;
			case "-" :
				result = number1 - number2;
				break;
			case "*" :
				result = number1 * number2;
				break;
			case "/" :
				result = number1 / number2;
				break;
		}
		
		return result;
	}
	
	
	
	static void printing(int number1, int number2, String oper, int result) {
		System.out.println("결과값 : " + number1 + oper + number2 + " = " + result);
	}

} // mainClass
