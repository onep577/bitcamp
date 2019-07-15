package baseball;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		int r_num[] = null;
		boolean clear;
		
		r_num = new int[3];
		clear = false;
		
		// 초기화
		bRandom(r_num); // 0 ~ 9까지 중 3개의 숫자를 중복되지 않게 각각 r_num 배열에 넣는다
		
		// loop 실프로그램 (input, strike, ball, message)
		clear = loop(r_num); // 사용자 도 중복되지 않게 3개의 숫자를 입력하고 r_num배열의 값과
		// 대조하여 strike, ball을 판별 후 message를 clear에 가져온다
		
		// 결과 출력
		resultPrint(clear);
		
	} // main 함수

	
	static void resultPrint(boolean clear) {
		 // clear가 true 일 때
		if(clear)	System.out.println("축하합니다 맞췄습니다");
		else		System.out.println("10번안에 맞추지 못 했습니다");
	} // resultPrint 함수


	static boolean loop(int[] r_num) {
		// Scanner로 세개의 수를 입력받는다
		// 중복되지 않아야한다
		// r_num와 대조하여 strike, ball을 판별한다
		// clear에 메시지 넣고 리턴한다
		int u_num[] = new int[3];
		boolean clear = false;
		int w = 0; // w는 10번의 기회를 알려준다
		
		while(w < 10) { // 10번의 기회
			userInput(u_num); // 유저 입력
			
			clear = finding(r_num, u_num); // strike ball 판별 후 clear로 리턴
			// 3 strike는 true, 아니면 false가 리턴
			
			// 3 strike는 while문을 나간다 아니면 w 증가 즉, 1번의 기회를 썼다
			if(clear == true) break;
			w++;
		} // while
		
		return clear;
	} // loop 함수

	
	static boolean finding(int[] r_num, int[] u_num) {
		// strike, ball 판별하는 함수
		int strike = 0;
		int ball = 0;
		
		for(int i = 0; i < u_num.length; i++) {
			for (int j = 0; j < u_num.length; j++) {
				// 숫자는 같고 인덱스 번호가 다를 때 ball
				if(u_num[i] == r_num[j] && i != j) {
					ball++;
				}
			}
			// 숫자도 같고 인덱스 번호도 같은 때 strike
			if(r_num[i] == u_num[i]) {
				strike++;
			}
		}
		
		// strike의 개수가 입력한 수의 개수와 같을 때 
		if(strike == u_num.length) {
			return true;
		}
		
		System.out.println(strike + "스트라이크 " + ball + "볼 입니다");
		
		// strike의 개수가 입력한 수의 개수와 같지 않을 때
		return false;
	} // finding 함수


	static void userInput(int[] u_num) {
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			// 세 개의 수를 입력한다
			for (int i = 0; i < u_num.length; i++) {
				System.out.print((i+1) + "번째 수 : ");
				u_num[i] = scan.nextInt();
			}
			// 입력한 세 개의 수가 다 다를 때 while문을 나가고 유저입력 함수가 끝난다
			if(u_num[0] != u_num[1] 
					&& u_num[0] != u_num[2] 
					&& u_num[1] != u_num[2]) {
				break;
			}
			// 입력한 세 개의 수 중 같은 게 있을 때 출력 다시 while문 돌고 입력하세요 뜬다
			System.out.println("같은 숫자가 있습니다. 다시 입력해주세요");
		}
		
	} // userInput 함수


	static void bRandom(int[] r_num) {
		// 0 ~ 9 까지의 숫자 중 하나를 r_num에 넣는다
		// for문 반복해서 3개를 만든다
		// 단, 세 개가 중복되면 안된다
		boolean swit[] = new boolean[10];
		
		// 비교 swit는 전부 다 false
		for(int i = 0; i < r_num.length; i++) {
			swit[i] = false;
		}
		
		int r;
		int w = 0;
		while(w < r_num.length) { // 0 1 2   즉, 3
			r = (int)(Math.random() * 9 + 1); // 1 ~ 9
			
			// 1 ~ 9 중 하나의 랜덤값이 인덱스로 있는 swit에 true이면 즉, r_num에 값이 있으면 다시 랜덤
			if(swit[r] == false) {
				swit[r] = true;
				r_num[w] = r;
				w++;
			}
				
		} // while

		
		for(int j = 0; j < r_num.length; j++) {
			System.out.println("r_num[" + j + "] = " + r_num[j]);
		}
		
	} // bRandom 함수

} // main class
