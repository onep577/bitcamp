package main;

public class java15 {

	public static void main(String[] args) {
		/*
	 		9 x 5
	 		행      렬
		 	*****
	 		*****
	 		*****
	 		*****
	 		*****
	 		*****
	 		*****
	 		*****
	 		*****
	 	*/
		for(int i = 0; i < 9; i++) { // 세로축
			for(int j = 0; j < 5; j++) { // 가로축
				System.out.print("*");
			}
			System.out.println(); // 9줄을 만들 수 있는 개행 표시
		}
		
		

	}

}
