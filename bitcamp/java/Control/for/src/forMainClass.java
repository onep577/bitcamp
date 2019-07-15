

import java.util.Scanner;

public class forMainClass {

	public static void main(String[] args) {
		// 구구단 출력
		// 2중 for
		// 1 * 1 = 1, 1 * 2 = 2, 1 * 3 = 3
		// 2 * 1 = 2
		
		// 입력 : 3
		// 3 * 1 = 3
		
		for(int i = 1; i < 10; i++) {
			for(int j = 1; j < 10; j++) {
				System.out.println(i + " * " + j + " = " + i*j);
			}
			System.out.println("-----------");
		}
		System.out.println("-------------------------------------------");
		
		Scanner scan = new Scanner(System.in);
		
		
		System.out.print("입력 : ");
		int num = scan.nextInt();
		
		for(int j = 1; j < 10; j++) {
			System.out.println(num + " * " + j + " = " + num*j);
		}
		System.out.println("-----------");
		
	}

}
