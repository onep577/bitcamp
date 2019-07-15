package main;

import java.util.Scanner;

public class java09 {

	public static void main(String[] args) {
		//int x, y, z;
		//double result;
		double x, y, z, result;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("x = ");
		x = scan.nextInt();
		System.out.print("y = ");
		y = scan.nextInt();
		System.out.print("z = ");
		z = scan.nextInt();
		
		result = (x - y) / (z - y);
		//System.out.println("(" + x + " - " + y + ")" + " / (" + z + " - " + y + ") = "
		//+ (x - y) + " / " + (z - y) + " = " + result);
		System.out.println("(x - y) / (z - y) = " + result);

	}

}
