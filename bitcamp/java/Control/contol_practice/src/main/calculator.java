package java02;

import java.util.Scanner;

public class calculator {

	public static void main(String[] args) {
		// calculator 계산기
		// 1번째 수 입력 받고 -> 연산자 입력 받고 (+ - * /) -> 2번째 수 입력 받고 -> 결과 -> 다시 할지 끝날지 물어본다
		// 연산자 4개중에 다른거 입력하면 다시 입력하라고
		
		Scanner scan = new Scanner(System.in);
		
		int num1 = 0;
		int num2 = 0;
		int result1 = 0;
		String oper, replay;
		double result2;
		
		
		
		while(true) {
		
			System.out.print("첫번째 수 : ");
			num1 = scan.nextInt();
			
			
			
			/*
			boolean b = false;
			do {
				System.out.print("연산자 (+,-,*,/) : ");
				oper = scan.next();
				switch(oper) {
					case "+":
						b = true;
						break;
					case "-":
						b = true;
						break;
					case "*":
						b = true;
						break;
					case "/":
						b = true;
						break;
					default:
						System.out.println("+ - * / 넷 중 하나를 입력하세요");
						break;
				}
			} while(b == false); // 아니면 빠져나온다
			*/
			
			while(true) {
				System.out.print("연산자 (+,-,*,/) : ");
				oper = scan.next();
				if(oper.equals("+") == true ||
						oper.equals("-") == true || 
						oper.equals("*") == true ||
						oper.equals("/") == true ) {
					break;
				}
					System.out.println("연산자는 (+, -, *, /) 넷 중 하나를 입력하세요");
			} // while문 무한루프로 계속 돌아가고 있다
				
			
			
			/*
			System.out.print("두번째 수 : ");
			num2 = scan.nextInt();
			
			result1 = 0;
			switch(oper) {
				case "+":
					result1 = num1 + num2;
					System.out.println(num1 + " " + oper + " " + num2 + " = " + result1);
					break;
				case "-":
					result1 = num1 - num2;
					System.out.println(num1 + " " + oper + " " + num2 + " = " + result1);
					break;
				case "*":
					result1 = num1 * num2;
					System.out.println(num1 + " " + oper + " " + num2 + " = " + result1);
					break;
				case "/":
					result2 = (double)num1 / (double)num2;
					System.out.println(num1 + " " + oper + " " + num2 + " = " + result2);
					break;
			
			}
			*/
			
			// 3. 두번째 숫자 입력
			while(true) {
				System.out.print("두번째 숫자 : ");
				num2 = scan.nextInt();
				
				if(oper.equals("/")) {
					
					if(num2 != 0) {
						break;
					}else {
						System.out.println("0으로 나눌 수 없습니다 다시 입력해주세요");
					} // 두번째 if문
					
				}else {
					break;
				}
			} // while문 무한루프로 계속 돌아가고 있다
			
			
			
			// 4. 계산처리
			switch (oper) {
				case "+":
					result1 = num1 + num2;
					break;
				case "-":
					result1 = num1 - num2;
					break;
				case "*":
					result1 = num1 * num2;
					break;
				case "/":
					result1 = num1 / num2;
					break;
	
			}
			
			
			// 5. 출력
			System.out.println(num1 + " " + oper + " " + num2 + " = " + result1);
						
			
			// 계속할건지?
			System.out.print("계산을 계속하시겠습니까?(y/n) = ");
			replay = scan.next();
						
			if(replay.equals("n")) {
				System.out.println("안녕히 가십시오");
				break;
			}else {
				// n 이외에는 다시 시작한다
			}

			
			
		} // 첫번째 while문 무한루프로 계속 돌아가고 있다
		
		
		/*
		 완성된 계산기는 아니다
		 9/2 에서 소수점이 찍히지 않는다. n 이외의 모든 입력값에 계산이 계속된다.
		*/
		
	}

}
