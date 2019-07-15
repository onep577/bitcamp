package main;

import java.util.Scanner;

public class java18 {

	public static void main(String[] args) {
		/*
		 	Scanner는 콘솔 벗어나면 안쓴다 구글링 하지말자
		 	하나의 수를 입력 받고 10의 배수의 사이를 알려주자 (조건분기 이용)
		 	예) 23 입력 -> 20보다 크고 30보다 작습니다
		*/
		
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("입력 : " );
		int inputNumber = scan.nextInt();
		
		
		// 하드코딩 하지만 코드가 긴게 무조건 나쁜 게 아니다
		/*
		if(inputNumber > 0 && inputNumber <= 10){
			System.out.println("입력한 수는 0보다 크고 10보다 작거나 같습니다");
		}else if(inputNumber > 10 && inputNumber <= 20){
			System.out.println("입력한 수는 10보다 크고 20보다 작거나 같습니다");
		}else if(inputNumber > 20 && inputNumber <= 30){
			System.out.println("입력한 수는 20보다 크고 30보다 작거나 같습니다");
		}else if(inputNumber > 30 && inputNumber <= 40){
			System.out.println("입력한 수는 30보다 크고 40보다 작거나 같습니다");
		}else
			System.out.println("입력한 수는 40보다 큽니다");
		/**/
		
		
		
		// 100,000까지 입력하는 코드라면 위에 코드보다 아래 코드가 더 좋겠지?
		// 1 ~ 100까지 입력했을 때 원하는 결과값이 나온다
		// 0과 음수와 101이상은 입력받고 엔터치면 결과값이 안나온다
		// 풀제의도 if else로 반복되는 걸 보고 for문을 생각하길
		int num10 = 0;
		for(int i = 0; i < 10; i++) { // 10 - 입력한 수 * 10까지 입력 받을 수 있다
			num10 = 10 * i;
			if(inputNumber > num10 && inputNumber <= num10 + 10) {
				System.out.println(num10 + "보다 크고 " + (num10 +10) + "보다 작거나 같습니다");
			}
		}
		/**/
		
		
		
		
		
	}
}
