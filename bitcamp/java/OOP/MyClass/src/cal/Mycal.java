package cal;

import java.util.Scanner;

public class Mycal {
	public int number1;
	public int number2;
	public String oper;
	public int result; // 멤버 변수
	// 앞에 public 을 빼도 똑같이 동작한다
	
	public void input() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("숫자입력 : ");
		number1 = sc.nextInt();
		
		System.out.print("연산자입력 : ");
		oper = sc.next();
		
		System.out.print("숫자입력 : ");
		number2 = sc.nextInt();
	}
	
	public void process() {
		switch(oper) {
			case "+":
				result = number1 + number2;
				break;
			case "-":
				result = number1 - number2;
				break;
			case "*":
				result = number1 * number2;
				break;
			case "/":
				result = number1 / number2;
				break;
		}
	}
	
	public void resultPrint() {
		System.out.println(number1 + " " + oper + " " + number2 + " = " + result);
	}
	
	
	
} // Mycal 클래스
