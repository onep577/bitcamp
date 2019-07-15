package main;

import java.util.Scanner;

public class java10 {

	public static void main(String[] args) {
		/* 편의점 과제
		 물건값 : 3420 <- 입력
		 손님 : 10,000 <- 입력
		 거스름돈 6580
		 5000 -> ?장
		 1000 -> ?장
		 500  -> ?개
		 100  -> ?개
		 50   -> ?개
		 10   -> ?개
		*/
		
		int product, money, change, num5000, num1000, num500, num100, num50, num10;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("물건 값 : " );
		product = scan.nextInt();
		System.out.print("내신 금액 : ");
		money = scan.nextInt();
		
		change = money - product;
		
		/*
		num5000 = change / 5000;
		num1000 = (change - (num5000 * 5000)) / 1000;
		num500 = change % 1000 / 500;
		num100 = (change - (num5000 * 5000) - (num1000 * 1000) - (num500 * 500)) / 100;
		num50 = change % 100 /50;
		num10 = (change - (num5000 * 5000) - (num1000 * 1000) - (num500 * 500)
				- (num100 * 100) - (num50 * 50)) / 10;
		*/
		
		
		num5000 = change / 5000;
		num1000 = change % 5000 / 1000;
		num500 = change % 5000 % 1000 / 500;
		num100 = change % 5000 % 1000 % 500 / 100;
		num50 = change % 5000 % 1000 % 500 % 100 / 50;
		num10 = change % 5000 % 1000 % 500 % 100 % 50 / 10;
		
		
		System.out.println("거스름돈 " + change);
		System.out.println("오천원 " + num5000 + "장");
		System.out.println("천원 " + num1000 + "장");
		System.out.println("오백원 " + num500 + "개");
		System.out.println("백원 " + num100 + "개");
		System.out.println("오십원 " + num50 + "개");
		System.out.println("십원 " + num10 + "개");

	}

}
