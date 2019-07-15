package scanner;

import java.util.Scanner;

public class java05 {

	public static void main(String[] args) {
		// 과제5(java05)
		/*int x,y;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("x = ");
		x = scan.nextInt();
		System.out.print("y = ");
		y = scan.nextInt();
		
		System.out.println("x = " + y + "\ty = " + x);
		*/
		
		int num1 = 11;
		int num2 = 22;
		
		int temp; // 아무런 의미없는 변수일 경우, 일외용일 경우
				  // buffer(저장소)
		
		System.out.println("교환전");
		System.out.println("num1 = " + num1 + " num2 = " + num2);
		
		// swap(교환)
		temp = num1; // num1의 값을 보관, 저장(temp)
		num1 = num2; // num1은 새로운 값을 할당
		num2 = temp; // num2에 저장했던 num1의 값을 대입

		System.out.println("교환후");
		System.out.println("num1 = " + num1 + " num2 = " + num2);
		

	}

}
