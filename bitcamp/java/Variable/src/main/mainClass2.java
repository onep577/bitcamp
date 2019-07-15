package variable;

import java.util.Scanner;

public class mainClass2 {

	public static void main(String[] args) {
		// 변수 자료형
		// 숫자
		byte by;	// 1 byte = 8 bit
		short sh;	// 2 byte
		int i;		// 4 byte
		long l;		// 8 byte
		
		// 문자열
		char c;		// 2 byte a b c A B C -> byte
					// '한' '가' unicode
		String str;	// ? byte
		
		// true/false
		boolean b;	// 1 byte	0(false)/1(true)
		
		// 논리연산	&&(AND), ||(OR), !(NOT) ==
		// true/false
		
		
		
		Scanner scan = new Scanner(System.in); // new가 나왔다! 포인터사용
		/*
		boolean b1 = scan.nextBoolean(); // true/false
		
		int num = scan.nextInt(); // 정수 -3 ~ 0 ~ 3
		
		String msg = scan.next(); // 문자열 입력
		/**/ // 막을 때 사용 /*만 지우면 되니까
		
		
		
		// increment(++), decrement(--)
		int a = 0;
		a++; // 대부분 뒤에 적는다
		++a;
		a--;
		--a; // increment를 더 많이 사용
		
		System.out.println("a = " + a);
		
		
		int a1;
		a1 = a++; // 0 = 1 // 먼저 대입되고 ++가 된다
		// a1 = ++a; // 1 = 1 // 먼저 ++되고 대입된다 
		// a++;
		// a1 = a; // a1 = ++a; 를 두줄로 바꿔쓰자
		System.out.println("a = " + a);
		System.out.println("a1 = " + a1);
		
		
		// + - * / %
		int num1, num2;
		int result;
		
		System.out.print("첫번째 수 : ");
		num1 = scan.nextInt();
		
		System.out.print("두번째 수 : ");
		num2 = scan.nextInt();
		
		result = num1 + num2;
		System.out.println(num1 + " + " + num2 + " = " + result);
		
		System.out.println(num1 + " - " + num2 + " = " + (num1 - num2));
		
		//num1 *= num2; // num1에 num2를 곱하라
		//System.out.println(num1 + " * " + num2 + " = " + num1);
		result = num1 * num2;
		System.out.println(num1 + " * " + num2 + " = " + result);
		
		result = num1 / num2; // 몫
		System.out.println(num1 + " / " + num2 + " = " + result);
		
		result = num1 % num2; // 나머지
		System.out.println(num1 + " % " + num2 + " = " + result);
		
		
		
		
		// 단위 환산 프로그램
		System.out.print("단위 환산 프로그램입니다 ");
		
		double dNumber;
		// int iNumber;
		System.out.print("숫자를 입력해 주십시오 = ");
		dNumber = scan.nextDouble();
		
		double dcm = dNumber * 2.54;
		double dm = dNumber * 0.3048;
		double dkm = dNumber * 1.6093;
		
		System.out.println("입력하신 수 : " + dNumber + "입니다");
		System.out.println(dNumber + "inch는 " + dcm + "cm입니다");
		System.out.println(dNumber + "yard는 " + dm + "m입니다");
		System.out.println(dNumber + "mile는 " + dkm + "km입니다");
		
		
		
		
		int x = 2;
		int y = 3;
		int z = 4;
		
		int re = (x - y) / (z - y);
		
		System.out.println("결과 " + re + "입니다");



	}

}
