
public class mainClass {

	public static void main(String[] args) {
		/*
		 	loop
		 	
		 	for(초기화; 조건식; 연산식){
		 		처리
		 	}
		 	
		 	초기화
		 	while(조건식){
		 		처리
		 		연산식
		 	}
		 	
		 	do{
		 		처리
		 		연산식
		 	}while(조건식)
		*/
		
		int w;
		
		w = 0;			// 초기화
		while(w < 10) { // 조건식
			System.out.println("while w : " + w); // 0 ~ 9 출력
			w++;		// 연산식
		}
		System.out.println("-----------");
		
		w = 0;						// 초기화
		while(w <= 3 && w >= 0) {	// 조건식
			System.out.println("while w : " + w); // 0 ~ 3 출력
			w++;					// 연산식			
		}
		System.out.println("-----------");
		
		w = -1;									// 초기화
		while(w <= 3 && w >= 0 && w != 10) {	// 조건식
			System.out.println("while w : " + w); // 출력 안된다
			w++;								// 연산식			
		}
		System.out.println("-----------");
		
		w = 5;			// 초기화
		do {
			System.out.println("do while w : " + w); // 5 출력
			w++;		// 연산식
		}while(w < 5);	// 조건식
		System.out.println("-----------");
		
		// 무한루프
		/*
		w = 0;
		while(true) {
			System.out.println("while true w : " + w);
			w++;
		}
		*/
		
		// application
		
		// 1. initialize(초기화)
		
		// 2. loop(무한루프)	while
		
		// 3. release(해방)

		
		
	}

}
