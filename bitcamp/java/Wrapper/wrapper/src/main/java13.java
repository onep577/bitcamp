package bit;

import java.util.Scanner;

public class java13 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		System.out.print("수를 입력하세요 : ");
		int i = scan.nextInt();
		
		// 삼항 연산자
		String str = (i > 0)?"양수입니다":"음수이거나 0입니다";
		
		System.out.println(str);

	}

}
