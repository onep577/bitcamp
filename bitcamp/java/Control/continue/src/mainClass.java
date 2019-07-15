import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	continue == 생략 skip
		 	
		 	continue문 자체만으로 사용할 수 없다
		 	loop문과 같이 사용해야 한다. for while, do while
		*/
		
		
		
		for(int i = 0; i < 5; i++) {
			System.out.println("i = " + i);
			System.out.println("for start");
			
			if(i > 1) {
				// continue;
				// 무조건 그 다음 작업 생략 i=2 일때 for end와 하하는 생략 후 i=3 일때 진행
				break; // 여기에서 break를 쓰면 i=2 일때 탈출
			}
			System.out.println("for end");
			System.out.println("하하");
		}
		System.out.println("---------------");
		/**/
		
		
		
		Scanner scan = new Scanner(System.in);
		
		int number;
		
		
		// 잘 못 입력해도 i가 증가된다
		// 왜? 증가값을 받는 변수가 반복문 밖에 있기 때문이다
		// 입력 받을 값이 모두 제대로 된 값이 아니어요 세번만 묻는다
		for(int i = 0; i < 3; i++) {
			System.out.print("숫자를 입력해 주십시오 = ");
			number = scan.nextInt();
			if(number < 0) {
				System.out.println("잘 못 입력하셨습니다");
				// continue;
				break;
			}
			System.out.println("i = " + i);
			System.out.println("i = " + i);
		}
		System.out.println("연산자가 위에 있어서 잘 못 입력해도 i가 증가된다");
		/**/
		
		
		
		// 잘 못 입력하면 w가 증가되지 않는다
		// 왜? 증가값을 받는 변수가 반복문 안에 있기 때문이다
		// 입력받을 값이 모두 제대로 된 값이 필요하면 while문을 사용하자
		int w = 0;
		while(w < 3) {
			System.out.print("숫자를 입력해 주십시오 = ");
			number = scan.nextInt();
			if(number < 0) {
				System.out.println("잘 못 입력하셨습니다");
				continue;
			}
			System.out.println("w = " + w);
			System.out.println("w = " + w);
			w++;
		}
		System.out.println("연산자가 while문 안에 있어서 잘 못 입력하면 i가 증가되지 않는다");
		
		
		
		
		
		
	}

}
