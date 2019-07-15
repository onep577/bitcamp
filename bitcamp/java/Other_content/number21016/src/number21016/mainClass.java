package number21016;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		// 수치 변환 프로그램
		Scanner sc = new Scanner(System.in);
		int choice;

		while(true) {
			System.out.println("1. 10진수 -> 2진수");
			System.out.println("2. 2진수 -> 10진수");
			System.out.println("3. 10진수 -> 16진수");
			System.out.println("4. 16진수 -> 10진수");
			System.out.println("5. 2진수 -> 16진수");
			System.out.println("6. 16진수 -> 2진수");
			
			System.out.print("어떤 수치를 변환하시겠습니까? = ");
			choice = sc.nextInt();
			
			switch(choice) {
				case 1:
					// 10진수 입력
					System.out.print("10진수 : ");
					int num = sc.nextInt();
					String num2 = number10to2(num);
					System.out.println("2진수는 " + num2 + "입니다");
					break;
				case 2:
					// String 입력
					System.out.print("2진수 : ");
					String str2 = sc.next();
					int num10 = number2to10(str2);
					System.out.println("10진수는 " + num10 + "입니다");
					break;
				case 3:
					// 10진수 입력
					System.out.print("10진수 : ");
					num = sc.nextInt();
					String num16 = number10to16(num);
					System.out.println("16진수는 " + num16 + "입니다");
					break;
				case 4:
					// String 입력
					System.out.print("16진수 : ");
					String str16 = sc.next();
					num10 = number16to10(str16);
					System.out.println("10진수는 " + num10 + "입니다");
					break;
				case 5:
					// 2->16   2 3
					// String 입력
					System.out.print("2진수 : ");
					str2 = sc.next();
					num16 = number2to16(str2);
					System.out.println("16진수는 " + num16 + "입니다");
					break;
				case 6:
					// 16->2  4 1
					// String 입력
					System.out.print("16진수 : ");
					str16 = sc.next();
					num2 = number16to2(str16);
					System.out.println("2진수는 " + num2 + "입니다");
					break;
			
			} // switch
		} // while
		
	} // main 함수
	
	
	
	// 10진수 -> 2진수
	static String number10to2(int num) {
		String num2 = "";
		int tag; // 2로 나눈 나머지 값
		
		// 20 % 2 = 0
		// 10 % 2 = 0
		// 5 % 2 = 1
		// 2 % 2 = 0
		// 1 % 2 = 1
		// 10진수 20 -> 2진수 10100
		while(true) {
			tag = num % 2;
			//System.out.println("tag = " + tag);
			num2 = tag + num2; // 0"" - 00"" - 100"" - 0100"" - 10100""
			// 리턴할 2진수 변수에 tag를 넣는다  tag 다음에 num2 순서 중요!
			if(num / 2 == 0) { // 몫이 0일 때 끝
				break;
			}
			num = num / 2; // 10 - 5 - 2 - 1 - 0 
			// 사용자가 입력해서 매개변수로 받은 10진수가 0이 되었다 break; 2진수가 찍힌 num2를 리턴
		}
		return num2;
	} // number10to2 함수
	
	
	
	// 2진수 -> 10진수
	static int number2to10(String num2) {
		int len = num2.length(); // 사용자가 입력한 2진수의 길이
		int n, n1;	// n:숫자  n1:승수
		
		int num10 = 0; // 리턴할 10진수
		
		for(int i = 0; i < num2.length(); i++) { // 10100
			char c = num2.charAt(i); // 1, 0, 1, 0, 0, 유저가 입력한 2진수를 하나씩 가져온다
			n = Integer.parseInt(c + ""); // n = 1, 여기서 n이 정수가 된다
			n1 = (int)Math.pow(2, len - 1); // len의 값 4, 3, 2, 1, 0
			
			n = n * n1; // 16 0 4 0 0
			// 1 * 2의 4승, 1 * 2의 2승
			len--;	// 중요! num2.length()의 길이는 for문이 도는 횟수 즉, 유저가 입력한 2진수의
					// 길이 이므로 줄이면 난감! 그래서 len이라는 변수를 따로 생성했다
			
			num10 = num10 + n; // 여기서 n은 정수이다
			// num10 = 0 + 16 + 4 = 20
		}
		return num10;
	} // number2to10 함수
	
	
	
	// 10진수 -> 16진수
	static String number10to16(int num) {	// 0 ~ 9 a b c d e f		
		int tag; // 유저에게 입력받은 10진수를 16으로 나눈 나머지 값
		String num16 = ""; // 리턴할 16진수
		String str = ""; // a b c d e f 16진수의 특징!
		
		while(true) {
			tag = num % 16; // 유저에게 입력받은 10진수를 16으로 나눈 나머지 값
			// 213 % 16 = 5, 13 % 16 = 13
			
			switch(tag) {
				case 10:
					str = "A";
					break;
				case 11:
					str = "B";
					break;
				case 12:
					str = "C";
					break;
				case 13:
					str = "D";
					break;
				case 14:
					str = "E";
					break;
				case 15:
					str = "F";
					break;
				default:	// 0 ~ 9 숫자이다
					str = tag + "";
			} // switch
			
			num16 = str + num16;
			// num16 = D + "" + 5 + ""
			
			if(num / 16 == 0) { // 유저에게 입력받은 10진수를 16으로 다 나눴다 끝
				break;
			}
			
			num = num / 16; // 13
			
		} // while
		
		return num16;
	} // number10to16 함수
	
	
	
	// 16진수 -> 10진수
	static int number16to10(String num16) {
		int len = num16.length(); // 유저가입력한 16진수의 길이 예) D5 라면 2이다
		
		int n = 0;	// 승수
		int n16;	// 하나씩 산출한 숫자		A132	10 1 3 2
		int num10 = 0; // 리턴할 10진수
		
		for (int i = 0; i < num16.length(); i++) { // 유저가 입력한 16진수의 길이만큼 돌린다
			
			char c = num16.charAt(i); // 16진수에서 앞부터 하나씩 꺼낸다
			
			if(c == 'a' || c == 'A')		n16 = 10; // 꺼낸 문자가 A라면 10이다
			else if(c == 'b' || c == 'B')	n16 = 11; // 꺼낸 문자가 B라면 11이다
			else if(c == 'c' || c == 'C') 	n16 = 12; // 꺼낸 문자가 C라면 12이다
			else if(c == 'd' || c == 'D') 	n16 = 13; // 꺼낸 문자가 D라면 13이다
			else if(c == 'e' || c == 'E') 	n16 = 14; // 꺼낸 문자가 E라면 14이다
			else if(c == 'f' || c == 'F')	n16 = 15; // 꺼낸 문자가 F라면 15이다
			else { 	// 0 ~ 9 꺼낸 문자가 숫자라면 
				n16 = Integer.parseInt(c + "");
			}
			
			n = (int)Math.pow(16, len - 1); // 16  1,  D라면 16의 1승   5라면 16의 0승
			n16 = n16 * n;	// 산출한 숫자에 승수를 곱한다.
							// n16 = 13 * 16 = 208, n16 = 5 * 1 = 5
			len--; 	// 중요! for문의 num16.length() 는 유저가 입력한 16진수의 길이만큼 돌려야한다
					// 줄어들 수 없다 그래서 len라고 따로 변수를 생성하고 문자하나씩 꺼내 확인하고 줄인다
					// 예시) D5 -> D 5, 유저가 입력한 16진수를 앞에서부터 차례로 확인하게 하는 변수
			
			num10 = num10 + n16;
			// 0 = 0 + 208 + 5 = 213
		}
		
		// 16진수 D5라면  최종 리턴할 10진수는 213이다
		return num10;
	} // number16to10 함수
	
	
	
	// 2진수 -> 16진수
	static String number2to16(String num2) {
		// 유저가 입력한 2진수 -> 10진수로 바꾼다
		int num10 = number2to10(num2);
		
		// 10진수로 바꾼 걸 다시 16진수로 바꾼다
		String num16 = number10to16(num10);
		
		// 최종 16진수로 리턴
		return num16;
	}
	
	
	
	// 16진수 -> 2진수
	static String number16to2(String num16) {
		// 유저가 입력한 16진수 -> 10진수로 바꾼다
		int num10 = number16to10(num16);
		
		// 10진수로 바꾼 걸 다시 2진수로 바꾼다
		String num2 = number10to2(num10);
		
		// 최종 2진수로 리턴
		return num2;
	}
	
	
	
} // main class
