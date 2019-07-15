package scanner;


import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		
		// 입력 (콘솔에서)
		Scanner scan = new Scanner(System.in); // Scanner 바로 뒤에서 ctrl+space 자동 import
		
		// boolean
		boolean b;
		System.out.print("input b = ");
		b = scan.nextBoolean(); // scan이란 변수를 통해서 nextBoolean이란 원래 만들어진 함수에 접근
		System.out.println("b = " + b);
		
		// int
		int i;
		System.out.print("input i = ");
		i = scan.nextInt();
		System.out.println("i = " + i);
		
		// double
		double d;
		System.out.print("input d = ");
		d = scan.nextDouble(); // 구글링 안해도 된다 사용법만 알면 되는 함수이다
		System.out.println("d = " + d);
		
		// String
		String str;
		System.out.print("str = ");
		str = scan.next();
		System.out.println("str = " + str);
		
		// next, nextline
		System.out.print("str:");
		str = scan.next();
		// str = scan.nextLine(); // 엔터도 키 값 nextLine은 키 값까지 받아서 next(); 쓰자
		System.out.println("str = " + str);
		
		System.out.print("i:");
		i = scan.nextInt();
		System.out.println("i = " + i);
		
		// next(), nextInt(), nextDouble() 중요
		
		
		
		
		

	}

}
