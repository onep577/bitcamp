package java02;

import java.util.Scanner;

public class randomNumber {

	public static void main(String[] args) {
		// Random number
		// random (1 ~ 100) 랜덤으로 뽑고 User Input 유저로부터 입력받는다 두 수를 비교 출력 맞추면 결과
		// 못 맞추면 다시 유저가 수를 입력하는 곳으로 이동 10번 입력해도 못 찾으면 끝
		// 예) 랜덤으로 65로 나온다 유저가 50 입력하면 '너무 작습니다' 출력
		// 유저가 75 입력 '너무 큽니다' 출력 총, 10번의 기회만 준다
		
		
		
		// 객체 갔을 때 두가지를 함께 처리하면 어려워진다 간단하더라도 나눠서 작업하자
		// 선언부
		boolean clear;
		int rand_num, user_num;
		Scanner scan = new Scanner(System.in);
		
		// init
		clear = false;
		

		// 1. random number setting (1 ~ 100)
		rand_num = (int)(Math.random() * 100) + 1;
		System.out.println(rand_num);

		
		// ------------------------------- loop 10번
		int w = 0;
		while(w < 10) {
		
		// 2. user input
			while(true) {
				System.out.print((w+1) + "번째 도전! 숫자를 입력(1~100) : ");
				user_num = scan.nextInt();
				
				if(user_num < 1 || user_num > 100) {
					System.out.println("범위를 벗어 났습니다");
					continue; // 음수, 0, 101이상 일때
							  // 즉, 1~100 아닐 때 밑에 생략하고 다시 while문
				}
				break; // 입력 되었고 랜덤값과 비교하러 가자
			}
	
			
			// 3. finding
			int msg = 0;
			if(user_num > rand_num) { // 유저번호가 클 때
				msg = 1;
			}else if(user_num < rand_num) { // 유저번호가 작을 때
				msg = 2;
			}else {
				clear = true;
				break; // 10번의 기회안에 랜덤값을 맞췄다
			}
	
			
			// 4. printing
			switch(msg) {
			case 1:
				System.out.println("너무 큽니다");
				break;
			case 2:
				System.out.println("너무 작습니다");
				break;
			}
		
		
		w++; // 10번의 기회를 카운트한다
		} // 10번의 기회 while문
		// -------------------------------
		// 5. result printing
		if(clear) { // 유저번호와 랜덤값이 맞아 break하면 여기로 직행
			System.out.println("축하합니다. Game Clear");
		}else { // 10번의 기회안에 못 맞췄다
			System.out.println("아쉽습니다. 다시 도전해보세요");
		}
		
		
		
		
		
		
		
		/*
		ran = (int)(Math.random() * 100 + 1);
		System.out.println("랜덤 수 : " + ran);
		
		Scanner scan = new Scanner(System.in);
		
		int count = 0;
		while(true) {
			
			if(count < 10) {
				
				do {
				
					System.out.print("1 ~ 100 중 수를 입력해주세요 : ");
					input = scan.nextInt();
					
				} while(input < 0 || input >= 100); // 아니면 나간다
				// 음수, 0, 101이상 일 때 true 다시 do while돈다 즉, 1~100 입력하면 나간다
					
				
				if(ran > input) {
					System.out.println("입력한 수가 작습니다");
				}else if(ran < input) {
					System.out.println("입력한 수가 큽니다");
				}else {
					System.out.println("입력한 수가 " + input + "로 같습니다");
					break; // 무한루프 while문 빠져나간다
				}
				count++;
				
			}else {
				System.out.println("10번 틀리셨습니다");
				break;
			}

		} // while문
		System.out.println("끝");
		/**/

		
	}
}
