
public class mainClass {

	public static void main(String[] args) {
		/*
		 	for : loop(순환, 반복)
		 	
		 	for( 초기화(선언)(1) ; 조건문(4)(7)(10) ; 연산식(3)(6)(9)) {
		 		// 처리(2)(5)(8)
		 	}
		 	(11)
		 	
		 	int num = 0;
		 	
		 	num = num
		 */
		
		int i;
		for(i = 0; i < 10; i = i + 1) {
			System.out.println("loop i: " + i); // 0 ~ 9까지 출력되고
		}
		System.out.println("loop out i: " + i); // 나와서 10이 출력된다
		
		
		/*
		for(i = 0; i < 10; ) { // 두번째 또는 세번째가 없으면 무한루프
			System.out.println("loop i: " + i);
		}
		*/
		
		
		// 1 ~ 10 더한 수를 구하라
		int num, sum;
		sum = 0;
		for(num = 1; num < 11; num = num + 1) {
			sum = sum + num;			
			System.out.println("sum = " + sum);
			System.out.println("---------");
		}
		
		// increment
		for(i = 0; i < 10; i = i + 2) {
			System.out.println("loop i : " + i); // 0, 2, 4, 6, 8 출력
		}
		System.out.println("---------");
		
		// decrement
		for(i = 10; i > 0; i = i - 1) {
			System.out.println("loop i : " + i); // 10 ~ 1까지 출력
		}
		System.out.println("---------");
		
		// endless loop(무한루프)
		//for(i = 0; i < 10; i++) {
			
		//}
		
		int j = 0;
		for( ; j < 10; ) {
			System.out.println("loop j : " + j); // 0 ~ 9까지 출력
			j++;
		}
		System.out.println("---------");
		
		for(i = 0, j = 0; i < 10; i++, j++) { // 0 0 1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 출력
			System.out.println("loop i : " + i);
			System.out.println("loop j : " + j);
		}
		System.out.println("---------");
		
		for(int k = 0; k < 10; k ++) {
			System.out.println("loop k : " + k); // 0 ~ 9 출력
		}
		System.out.println("---------");
		
		
		
		
		// 이중 for문
		for(i = 0; i < 10; i ++) {
			System.out.println("loop i : " + i);	
			for(j = 0; j < 5; j++) {
				System.out.println("\tloop j : " + j);				
			}
		}
		// 0 01234 1 01234 2 01234 3 01234 4 01234 5 01234 6 01234 7 01234 8 01234 9 01234
		
		
	}

}
