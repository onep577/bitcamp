package java02;

import java.util.Scanner;

public class rock_paper_scissors {

	public static void main(String[] args) {
		// 가위 바위 보
		
		//------------------------------ loop
		// 랜덤으로 숫자 1,2,3 중 하나 (바위 가위 보)
		
		// 유저 가위,바위,보 중 하나 입력
		
		// 랜덤숫자와 유저 입력을 처리해서 승,무,패 를 정한다
		
		// 결과 출력 ?승 ?패
		
		// 다시 하시겠습니까?
		//------------------------------ loop 끝
		
		
		
		
		
		/*
		Scanner sc = new Scanner(System.in);
				
		// 선언부
		int userNum, comNum;
		int win, lose, draw;
		int result = 0;	// 승패무승부
		
		// 초기화
		win = lose = draw = 0;
		
		////////////////////////////// replay loop
		while(true) {
			// 1. random number -> com	(0 ~ 2)
			comNum = (int)(Math.random() * 3);
			
			// 2. user input	(0 ~ 2)
			System.out.print("가위(0), 바위(1), 보(2) = ");
			userNum = sc.nextInt();
		*/	
			/*
			while(true) {
				String userInput = sc.next();
				if(userInput.equals("0") || 
					userInput.equals("1") ||
					userInput.equals("2")) {
					break;
				}
				System.out.println("잘못 입력하셨습니다. 다시 입력해 주십시오");
			}
			
			// 문자열 -> 숫자
			userNum = Integer.parseInt(userInput);
			*/
			
			// 3. finding
			// win	0-2, 1-0, 2-1
			/*
			if(userNum == 0 && comNum == 2) {
				result = 1;
			}else if(userNum == 1 && comNum == 0) {
				result = 1;
			}else if(userNum == 2 && comNum == 1) {
				result = 1;
			}		
			
			// lose
			if(userNum == 2 && comNum == 0) {
				result = 0;
			}else if(userNum == 0 && comNum == 1) {
				result = 0;
			}else if(userNum == 1 && comNum == 2) {
				result = 0;
			}
			
			// draw
			if(userNum == 0 && comNum == 0) {
				result = 2;
			}else if(userNum == 1 && comNum == 1) {
				result = 2;
			}else if(userNum == 2 && comNum == 2) {
				result = 2;
			}
			*/
			// user 0(가위), 1(바위), 2(보)
			/*
			  	user win
				com		user
				2	-	0		+ 2		= 	4	% 3	-> 1
				0	-   1		+ 2		=   1	% 3 -> 1
				1   -   2       + 2     =   1	% 3 -> 1 
				
				user lose
				com		user
				0	-   2		+ 2		=	0   % 3 -> 0
				1	-	0		+ 2 	=   3   % 3 -> 0
				2	-	1 		+ 2		=	3	% 3 -> 0    
				
				user draw
				com 	user
				0	-	0		+ 2		=	2	% 3 -> 2  
				1	- 	1		+ 2		=	2	% 3 -> 2
				2	-	2		+ 2		= 	2	% 3	-> 2	
			*/	
		/*
			result = (comNum - userNum + 2) % 3;
			
			String resultMsg = "";
			
			switch(result) {
				case 1:		// 승
					resultMsg = "You Win";
					win++;
					break;
				case 0:		// 패
					resultMsg = "You lose";
					lose++;
					break;
				case 2:		// 무승부
					resultMsg = "Draw";
					draw++;
					break;		
			}
			
			String userChar = "";
			String comChar = "";
			
			if(userNum == 0) userChar = "가위";
			else if(userNum == 1) userChar = "바위";
			else				userChar = "보";
			
			if(comNum == 0) comChar = "가위";
			else if(comNum == 1) comChar = "바위";
			else			comChar = "보";	
				
			// 4. result print
			System.out.println(resultMsg + "으로 당신은 " + userChar + 
										"이고 com은 " + comChar + "입니다");
			System.out.println(win + "승 " + lose + "패 " + draw + "무입니다");
			
			System.out.print("한판 더?아무키나 물러 주십시오.그만하시려면 n을 입력해 주십시오 = ");
			String nextStage = sc.next();
			
			if(nextStage.equals("n")) {
				System.out.println("안녕히 가십시오");
				break;
			}
			System.out.println("다시 게임을 시작합니다");
		}
		////////////////////////////////////
		 */
		
		
		
		
		// 선언
		int com, user, result;
		int win, lose, draw;
		String comStr, userStr;
		String yn = null;
		
		
		// 초기화
		result = 0;
		win = lose = draw = 0;
		
		
		
		
		// ---------------------------
		while(true) {
			// 랜덤으로 컴퓨터의 가위/바위/보 받기
			System.out.println("========================");
			com = (int)(Math.random() * 3); // 0 1 2
	
			if(com == 0) {
				comStr = "가위";
				System.out.println("com = " + comStr);
			}else if(com == 1) {
				comStr = "바위";
				System.out.println("com = " + comStr);
			}else if(com == 2) {
				comStr = "보";
				System.out.println("com = " + comStr);
			}
			
			
			
			
			// 사람이 가위/바위/보 입력
			Scanner scan = new Scanner(System.in);
			System.out.print("가위(0) 바위(1) 보(2) : ");
			user = scan.nextInt();
			
			if(user == 0) {
				userStr = "가위";
				System.out.println("user = " + userStr);
			}else if(user == 1) {
				userStr = "바위";
				System.out.println("user = " + userStr);
			}else if(user == 2) {
				userStr = "보";
				System.out.println("user = " + userStr);
			}
			
			
			
			
			// 승, 무, 패 처리
			/* com	user
			 * user win
			 * 0	-	1	+	2	=	1	%	3	=	1
			 * 1	-	2	+	2	=	1	%	3	=	1
			 * 2	-	0	+	2	=	4	%	3	=	1
			 * 
			 * user draw
			 * 0	-	0	+	2	=	2	%	3	=	2
			 * 1	-	1	+	2	=	2	%	3	=	2
			 * 2	-	2	+	2	=	2	%	3	=	2
			 * 
			 * user lose
			 * 0	-	2	+	2	=	0	%	3	=	0
			 * 1	-	0	+	2	=	3	%	3	=	0
			 * 2	-	1	+	2	=	3	%	3	=	0
			 * 
			 * win 1, draw 2, lose 0
			 */
			
			result = (com - user + 2) % 3;
			switch(result) {
				case 1:
					System.out.println("--승--");
					win++;
					break;
				case 2:
					System.out.println("--무--");
					draw++;
					break;
				case 0:
					System.out.println("--패--");
					lose++;
					break;
			}
	
		// 출력
			System.out.println("누적 결과 : " + win +"승, " + draw + "무, " + lose + "패");
			
		// ---------------------------
		// 다시 하시겠습니까?
			System.out.print("다시 하시겠습니까? (y/n) : ");
			yn = scan.next();

			if(yn.equals("n")) {
				break;
			}
		} // 무한루프 while() 프로그램은 계속 돌아간다
		System.out.println("프로그램 끝");
		
		

	}

}
