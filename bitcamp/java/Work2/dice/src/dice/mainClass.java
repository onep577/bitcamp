package dice;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	User Interface : UI
		 	- App 어플리케이션
		 	- WB 웹 브라우져
		 	UI라고 되어있는건 개발자 입장에선 app, wb 둘 주 하나이다
		 	
		 	Graphic UI 요즘은 GUI 그래픽 유아이 라고한다
		*/
		/*
		 	두개의 주사위 합을 맞히는 게임 제작
		 	코인 : 20개
		 	합을 맞추면 제시한 숫자에 따라서 배당금이 달라집니다
		 	
		 	2, 12	: 제시할 수 없음
		 	3, 11	: 18배
		 	4, 10	: 12배
		 	5, 9	: 9배
		 	6, 8	: 7배
		 	7		: 6배
		 	
		 	배팅할 코인 수는? 입력
		 	두 주사위의 합은? 입력		2나 12를 입력하면 다시 입력
		 	두 주사위의 합은? 6
		 	주사위 번호 출력
		 	
		 	결과 출력
		*/
		
		diceClass dcls = new diceClass();
		Scanner scan = new Scanner(System.in);
		
		dcls.init();
		while(true) {
			// 랜덤으로 두 주사위의 번호를 구한다
				dcls.dice_Number();
			// 유저가 배팅할 코인수를 입력
			// 유저가 두 주사위의 합 입력
				// 2나 12를 입력하면 다시 입력
				dcls.user_Input();
			// 랜덤 합과 유저 합을 대조한다
				// 결과에 따라서 유저에게 코인을 주거나 +, 받는다 -
				// 만약 코인이 다 없어지면 끝
				boolean b = dcls.process();
			// 주사위 번호와 합을 출력
				//result_Print();
			
			if(b == false) break; // false는 coin 즉, 남은 돈이 0 원일 때
			else {
				System.out.print("다시 하시겠습니까? (y/n) : ");
				if(scan.next().equals("n")) break;
			}
		} // while
		System.out.println("프로그램 종료");
		
		
		
	}
}
