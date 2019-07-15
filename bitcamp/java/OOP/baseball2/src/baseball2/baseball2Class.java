package baseball2;

import java.util.Scanner;

public class baseball2Class {
	private int r_num[];
	private int u_num[];
	private boolean clear;
	
	
	public void init() {
		r_num = new int[3];
		u_num = new int[3];
		clear = false;
		
		randomNumber(); // while문에서 돌리는게 아니라 한번만 돌린다 즉, 초기화와 같은 의미
	} // init 함수
	
	
	
	public void randomNumber() {
		boolean swit[] = new boolean[9];
		int r, w;
		
		for(int i = 0; i < swit.length; i++) {
			swit[i] = false;
		}
		
		w = 0;
		// 셔플코드 실무코드 카드, 고스톱 등 카드 섞을 때
		while(w < r_num.length) { // 3
			r = (int)(Math.random() * 9) + 1;	// 1 ~ 9
			if(swit[r] == false) {
				swit[r] = true;
				r_num[w] = r;	// 1 ~ 9
				w++;
			}
		}
		
//		for(int i = 0; i < r_num.length; i++) {
//			System.out.println("r_num[" + i + "] = " + r_num[i]);
//		}
//		System.out.println("-----------");
		
	} // randomNumber 함수
	
	
	
	public void userInput() {
		Scanner scan = new Scanner(System.in);
		
		// 2. user input(1 ~ 9) -> 3개
		//		u1 != u2 != u3
		while(true) {
			for(int i = 0; i < u_num.length; i++) {
				System.out.print((i + 1) + "번째 수 : ");
				u_num[i] = scan.nextInt();
			}
			
			if(u_num[0] != u_num[1] 
					&& u_num[0] != u_num[2] 
					&& u_num[1] != u_num[2]) {
				break;
			}
			System.out.println("같은 수가 있습니다. 다시 입력하십시오");
		} // while문
		
	} // userInput 함수
	
	
	
	public void loop() {
		int w = 0;
		int strike, ball;

		while(w < 10) {
			
			userInput();
		
			ball = 0;
			// ball
			for (int i = 0; i < u_num.length; i++) {
				for (int j = 0; j < u_num.length; j++) {
					if(u_num[i] == r_num[j] && i != j) {
						ball ++;
					}
				}
			}
			
			strike = 0;
			// strike
			for(int i = 0; i < u_num.length; i++) {
				if(u_num[i] == r_num[i]) {
					strike ++;
				}
			}
			
			if(strike > 2) {
				clear = true;
				break; // 스트라이크 3개면 while문을 빠져나간다
			}

			System.out.println(strike + "스트라이크" + ball + "볼 입니다");
			w++;
		} // while

	} // loop 함수
	
	
	
	public void result() {
		if(clear) {
			System.out.println("축하합니다");
		}
		else {
			System.out.println("아쉽습니다. 다시 도전하세요");
		}
	} // result 함수
	
	
	
}
