package main;

import java.util.Scanner;

public class java08 {

	public static void main(String[] args) {
		double inch, yard, mile, cm, m, km, num1, num2, num3, num4, num5, num6;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("inch = ");
		num1 = scan.nextInt();
		cm = num1 * 2.54;
		System.out.println(num1 + " inch = " + cm + " cm");
		
		System.out.print("yard = ");
		num2 = scan.nextInt();
		m = num2 * 0.3048;
		System.out.println(num2 + " yard = " + m + " m");
		
		System.out.print("mile = ");
		num3 = scan.nextInt();
		km = num3 * 1.6093;
		System.out.println(num3 + " mile = " + km + " km");
		
		System.out.print("cm = ");
		num4 = scan.nextDouble();
		inch = num4 / 2.54;
		System.out.println(num4 + " cm = " + inch + " inch");
		
		System.out.print("m = ");
		num5 = scan.nextDouble();
		yard = num5 / 0.3048;
		System.out.println(num5 + " cm = " + yard + " yard");
		
		System.out.print("km = ");
		num6 = scan.nextDouble();
		mile = num6 / 1.6093;
		System.out.println(num6 + " km = " + mile + " mile");
		

	}

}
