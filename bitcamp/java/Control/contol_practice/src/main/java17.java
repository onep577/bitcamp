package main;

public class java17 {

	public static void main(String[] args) {
		// 1부터 1000까지의 총합
		int sum = 0;
		for(int i = 0; i < 1001; i++) {
			// i의 초기값이 0이어도 1 이어도 답이 같다 왜?
			// 0 = 0 + 0; 이니까
			// System.out.print(sum + " + " + i);
			sum = sum + i;
			// System.out.println(" = " + sum);
		}
		System.out.println("1부터 1000까지의 총합 : " + sum);
		// 2씩 늘어나게 바꾸려면  바꿀게 더 많지만 틀리지 않았다 둘 다 알아두자
		
		
		sum = 0;
		int count = 0;
		for (int i = 0; i < 1000; i++) {
			count += 1;
			sum = sum + count;
		}
		System.out.println("1부터 1000까지의 총합 : " + sum);
		
	}

}
