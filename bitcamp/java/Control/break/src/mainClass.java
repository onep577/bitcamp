
public class mainClass {

	public static void main(String[] args) {
		/*
		 	break == 탈출(escape) == return
		 	단독사용X
		 	탈출 할 제어문 : for, while, do while, ...
		 	
		 	형식: // 가장 많이 쓰는 방법
		 	for(  ;  ;  ){
		 		if( 조건 ){
		 			break;
		 		}
		 	}
		*/
		
		
		int num = 1;
		
		switch(num) {
			case 1:
				System.out.println("num = 1");
				break;
			//	return; // break 일때와 똑같이 나온다 num = 1 출력
			case 2:
				System.out.println("num = 2");
				break;
		}
		
		
		for(int i = 0; i < 10; i++) {
			System.out.println("for i : " + i); // 0 ~ 5 출력
			if(i == 5) {
				break; // i가 5일 때 탈출
			}
		}
		
		
		
		
		char cArray[] = {'a', 'b', 'c'};
		
		for(int i = 0; i < cArray.length; i++) {
			System.out.println(cArray[i]); // a b 출력
			if(cArray[i] == 'b') {
				System.out.println("탈출!"); // 출력
				break;
			}
		}
		
		
		
		
		int iArray[] = {1, 2, 3, -1, 7};
		for (int i = 0; i < iArray.length; i++) {
			System.out.println("iArray[" + i + "] = " + iArray[i]);
			if(iArray[i] < 0) {
				break;
			}
		}
		System.out.println("----------------");
		
		
		
		
		
		// 2중 for
		
		
		// i=0 j=0~9, i=1 j=0~9, i=2 j=0~3, i=3 j=0~9, i=4 j=0~9,
		// i=5 j=0~9, i=6 j=0~9, i=7 j=0~9, i=8 j=0~9, i=9 j=0~9 출력
		for (int i = 0; i < 10; i++) {
			System.out.println("i = " + i);
			for (int j = 0; j < 10; j++) {
				System.out.println("\t j = " + j);
				
				if(i == 2 && j == 3) {
					break; // loop문 하나당 break문 하나
					
				}
				System.out.println("%"); // break를 만나니까 생략
				System.out.println("%%"); // break를 만나니까 생략
			
				
			} // 두번째 for문
			System.out.println("^"); // break를 만나도 생략되지 않는다
			System.out.println("^^"); // break를 만나도 생략되지 않는다
			
			
		} // 첫번째 for문
		System.out.println("----------------");
		
		
		
		
		// i=0 j=0~9, i=1 j=0~9, i=2 j=0~3 출력
		boolean b = false;	
		
		for (int i = 0; i < 10; i++) {
			System.out.println("i = " + i);
			for (int j = 0; j < 10; j++) {
				System.out.println("\t j = " + j);
				if(i == 2 && j == 3) {
					b = true;
				}
				if(b == true) {
					break; // 두번째 for문을 완전히 빠져나간다
					// System.out.println("%"); 에러코드 Unreachable code
				}
				System.out.println("%");	// 첫번째 break를 만나니까 생략
				System.out.println("%%");	// 첫번째 break를 만나니까 생략
				
			} // 두번째 for문
			if(b == true) {
				break; // 첫번째 for문을 완전히 빠져나가고 -------기 찍힌다
			}
			System.out.println("^");	// 두번째 break를 만나니까 생략
			System.out.println("^^");	// 두번째 break를 만나니까 생략
			
		} // 첫번째 for문
		System.out.println("----------------");
		
		
		
		
		// i=0 j=0~9, i=1 j=0~9, i=2 j=0~3 출력
		out:for (int i = 0; i < 10; i++) {
			System.out.println("i = " + i);
			for (int j = 0; j < 10; j++) {
				System.out.println("\t j = " + j);
				if(i == 2 && j == 3) {
					break out; // 첫번째 for문을 빠져나간다
				}
				System.out.println("%");
				System.out.println("%%");
				
				
			} // 두번째 for문
			System.out.println("^");
			System.out.println("^^");
			
			
		} // 첫번째 for문
		System.out.println("----------");
		
		
		
		
		
	}

}
