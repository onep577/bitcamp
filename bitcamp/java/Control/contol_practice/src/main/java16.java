package main;

public class java16 {

	public static void main(String[] args) {
		/* 내가 한 것 
		int i, j, x;
		
		for(i = 0; i < 6; i++) {
			System.out.println();
			for(j = 0; j < 5; j++) {
				//System.out.print("*");
				
				if(i == j) {
					break;
				}
				
				System.out.print("*");
				
			}
			
		} // 첫번째 for문
		
		
		
		for(i = 0; i < 4; i++) {
			System.out.println();
			for(j = 4; j > 0; j--) {
				
				if(i == j) {
					break;
				}
				
				System.out.print("*");
				
			}
			
		} // 첫번째 for문
		*/
		
		/* 강사님 코드
		int len = 0;
		for(int i = 0; i < 9; i++) { // 세로축
			if(i < 5) len++;

			else len--;
			
			for(int j = 0; j < len; j++) { // 가로축
				System.out.print("*");
			} // 두번째 for문
			System.out.println(); // 9줄을 만들 수 있는 개행 표시
			
			
		} // 첫번째 for문
		*/
		
		
		/*
		
		***			3
		*******		7
		*****		5
		******		6
		********	8
		*******		7
		******		6
		****		4
		**			2
		*			1
		이렇게 들쑥 날쑥한 경우는 배열 사용
		
		*/
		
		
		int numArr[] = { 3, 7, 5, 6, 8, 7, 6, 4, 2, 1};
		
		for (int i = 0; i < 9; i++) {
			
			for(int j = 0; j < numArr.length; j++) {
				System.out.print("*");
		
			}
			System.out.println();
		}
		
		
		
		
	}

}
