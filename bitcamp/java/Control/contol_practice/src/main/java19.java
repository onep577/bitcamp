package main;

public class java19 {

	public static void main(String[] args) {
		// 1 ~ 100 에서 짝수의 총 합과 홀수의 총 합을 구하시오
		
		
		// int sum1 = 0;
		// int sum2 = 0;
		
		/*
		for(int i = 0; i <= 100; i++) { // i 초기값으로 0과 1 둘 다 가능하다
			if(i % 2 == 0) {
				//System.out.println("짝수");
				//System.out.println(i);
				sum1 = sum1 + i;
			}
			if(i % 2 != 0) {
				//System.out.println("홀수");
				//System.out.println(i);
				sum2 = sum2 + i;
			}
			
		} // for문
		*/
		
		
		// 선언
		int sum1, sum2;
		int num;
		
		// 초기화
		sum1 = sum2 = 0;
		num = 0;
		
		// 처리
		for(int i = 0; i < 100; i++) {
			num ++;
			if(num % 2 == 1) {		// 홀수
				sum1 = sum1 + num;
			}else {					// 짝수
				sum2 = sum2 + num;
			}
			
		}
		

		System.out.println("1부터 100 사이 짝수의 합 : " + sum1);
		System.out.println("1부터 100 사이 홀수의 합 : " + sum2);
		
		

	}

}
