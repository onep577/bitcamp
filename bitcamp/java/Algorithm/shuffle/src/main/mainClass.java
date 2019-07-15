package card;

public class mainClass {

	public static void main(String[] args) {
		/* 4대 알고리즘의 요소
		 * 정렬(sort), 트리(tree), 셔플(섞기), 탐색(index)
		 * index : 값을 가능한 빨리 찾기 위한 방법
		 */
		// 1 ~ 10 J(11) Q(12) K(13) * 4
		// == 52장
		// 52를 셔플
		// 0 ~ 51
		// 스페이드, 다이아, 하트, 클로버
		// 0 ~ 12  13 ~ 25  26 ~ 38  39 ~ 51
		
		/*
		 	랜덤 숫자	카드 숫자	그림
		 	13		1		다이아
		 	51		13		클로버
		 			:
		*/
		
		// 선언  생성
		int ran_num[];
		boolean swit[];
		String ran_card[] = new String[52];
		String ran_pic[] = new String[52];
		int r, w;
		
		
		// 초기화
		ran_num = new int[52];
		swit = new boolean[52];		// 00000 00000
		// swit의 초기화
		for(int i = 0; i < swit.length; i++) {
			swit[i] = false;		// 00000 00000
		}
		
		
		
		// 랜덤값 셔플
		w = 0;
		while(w < ran_num.length) { // 0 ~ 51까지 돌린다
			r = (int)(Math.random() * 52); // 랜덤값은 0 ~ 51까지 정수형으로 나온다
			if(swit[r] == false) { // 랜덤값을 index에 넣는다 true 라면 이미 값을 넣었기 때문에 패스
				swit[r] = true;
				//ran_num[w] = r + 1;	// 1 ~ 52
				ran_num[w] = r;			// 0 ~ 51, ran_num의 index는 while문의 index값인 w이다!
										// index인 w도 0 ~ 51까지이고, 데이터 값인 r도 0 ~ 51 까지이다
				w++;					// ran_num에 값이 들어가면 while문의 index값인 we도 증가한다
			}
		} // 랜덤값 셔플 while()
		
		
		
		
		/*
		// 스페이드, 다이아, 하트, 클로버 넣고 카드값 1 ~ 10, J, Q, K 넣기
		for(int i = 0; i < ran_num.length; i++) { // 0 ~ 51
			
			// 스페이드, 다이아, 하트, 클로버 넣고 카드값 1 ~ 13
			if(ran_num[i] >=0 && ran_num[i] <= 12) {
				ran_pic[i] = "스페이드";
				ran_card[i] = ran_num[i] + "";
				
			}else if(ran_num[i] >=13 && ran_num[i] <= 25) {
				ran_pic[i] = "다이아";
				ran_card[i] = ran_num[i] - 13 + "";
				
			}else if(ran_num[i] >=26 && ran_num[i] <= 38) {
				ran_pic[i] = "하트";
				ran_card[i] = ran_num[i] - 26 + "";
				
			}else {
				ran_pic[i] = "클로버";
				ran_card[i] = ran_num[i] - 39 + "";
			}
			
			

			// J, Q, K
			if(ran_card[i].equals("11")) {
				ran_card[i] = "J";
			}else if(ran_card[i].equals("12")) {
				ran_card[i] = "Q";
			}else if(ran_card[i].equals("13")) {
				ran_card[i] = "K";
			}
			
		} // 카드그림, 실 숫자의 for문
		
		
		
		// 출력
		System.out.println("랜덤숫자\t카드숫자\t그림");
		for(int i = 0; i < ran_num.length; i++) {
			System.out.print(ran_num[i] + "\t");
			System.out.print(ran_card[i] + "\t");
			System.out.print(ran_pic[i] + "\t");
			System.out.println();
		}
		*/
		
		
		int cardNumber;		// 1 ~ 13
		int cardPicture;	// 0 ~ 3
		
		for(int i = 0; i < ran_num.length; i ++) {
		
			// random number print
			System.out.print("r ran_num : " + ran_num[i] + ",\t");
			
			// 카드숫자
			cardNumber = ran_num[i] % 13 + 1; // 1 ~ 13
			
			if(cardNumber == 1) {
				System.out.print("실 숫자 : " + "A" + " ");
			}
			else if(cardNumber == 11) {
				System.out.print("실 숫자 : " + "J" + " ");
			}
			else if(cardNumber == 12) {
				System.out.print("실 숫자 : " + "Q" + " ");
			}
			else if(cardNumber == 13) {
				System.out.print("실 숫자 : " + "K" + " ");
			}
			else {
				System.out.print("실 숫자 : " + cardNumber + " ");
			}
		
		
			// 그림
			cardPicture = ran_num[i] / 13; // 몫이 0 1 2 3
			
			switch(cardPicture) {
				case 0:
					System.out.println("스페이드");
					break;
				case 1:
					System.out.println("다이아");
					break;
				case 2:
					System.out.println("하트");
					break;
				case 3:
					System.out.println("클로버");
					break;
			}
			
			
		} // 카드숫자, 카드그림 넣는 for문
		
		
		

	}

}
