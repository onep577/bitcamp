package java02;

import java.util.Scanner;

public class baseball {

	public static void main(String[] args) {
		// baseball
		Scanner scan = new Scanner(System.in);
		
		// 선언부
		int r_num[], u_num[];
		boolean clear;
		
		///////////////////////////////// replay
		
		// 초기화
		r_num = new int[3];
		u_num = new int[3];
		clear = false;
		
		
		// 1. random number(1 ~ 9) -> 3개
		//		n1 != n2 != n3
		
		
		/*
		  // 첫번째 방법 (하드코딩)
		while(true) {
			r_num[0] = (int)(Math.random() * 9) + 1;
			r_num[1] = (int)(Math.random() * 9) + 1;
			r_num[2] = (int)(Math.random() * 9) + 1;
		
			if(r_num[0] != r_num[1] && r_num[0] != r_num[2]
					&& r_num[1] != r_num[2]) {
				break;
			}
		} // while()
		
		for (int i = 0; i < u_num.length; i++) {
			System.out.println("r_num[" + i + "] = " + r_num[i]);
		}
		하드코딩이 된다
		*/
		
		
		/*
		 // 두번째 방법 (잘 안 섞일 수도 있다)
		int rnum[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9};
		int temp;
		
		int n1, n2;
		for (int i = 0; i < 100; i++) {
			n1 = (int)(Math.random() * 9); // 0 ~ 9
			n2 = (int)(Math.random() * 9); // 0 ~ 9
			
			temp = rnum[n1];
			rnum[n1] = rnum[n2];
			rnum[n2] = temp;
			// 0 번째와 1번째를 교환
		}
		for (int i = 0; i < rnum.length; i++) {
			System.out.println("rnum[" + i + "] = " + rnum[i]);
		}
		 */
		
		
		/*
		 	// 세번째 방법
		  	00000 00000
		  	random number -> 3
		  	00010 00000
		  	random number -> 5
		  	00010 10000
		 */
		
		
		// 카드, 고스톱 등 카드 섞을 때
		// 셔플코드 실무코드
		boolean swit[] = new boolean[9];	// 00000 00000
		int r, w;
		
		for(int i = 0; i < swit.length; i++) {
			swit[i] = false;		// 00000 00000
		}
		w = 0;
		
		// 카드, 고스톱 등 카드 섞을 때
		// 셔플코드 실무코드
		while(w < u_num.length) {
			r = (int)(Math.random() * 9);	// 0 ~ 8
			if(swit[r] == false) {
				swit[r] = true;
				r_num[w] = r + 1;	// 1 ~ 9
				w++;
			}
		}
		
		for(int i = 0; i < r_num.length; i++) {
			System.out.println("r_num[" + i + "] = " + r_num[i]);
			System.out.println("-----------");
		}
		
		
		
		w = 0;
		//////////////////////////////////// loop 10회		
		while(w < 10) {
		
			// 2. user input(1 ~ 10) -> 3개
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
					
			}
			
			
			
			
			
			// 3. finding( strike, ball )
			//		strike : 자리 O, 숫자O
			//		ball : 자리X, 숫자O
			
			int strike, ball;
			strike = ball = 0;
			// ball
			for (int i = 0; i < u_num.length; i++) {
				for (int j = 0; j < u_num.length; j++) {
					if(u_num[i] == r_num[j] && i != j) {
						ball ++;
					}
				}
			}
			
			// strike
			for(int i = 0; i < u_num.length; i++) {
				if(u_num[i] == r_num[i]) {
					strike ++;
				}
			}
			
			if(strike > u_num.length - 1) {
				clear = true;
				break;
			}
			
			
			
			
			// 4. message(printing)
			System.out.println(strike + "스트라이크" + ball + "볼 입니다");
			
			w ++;
		}
		///////////////////////////////////////
		
		
		
		
		
		// 5. result(clear, no good)
		if(clear) {
			System.out.println("축하합니다");
		}
		else {
			System.out.println("아쉽습니다. 다시 도전하세요");
		}
		
		
		
		
	}

}
