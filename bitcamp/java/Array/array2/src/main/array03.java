package java02;

public class array03 {

	public static void main(String[] args) {
		// 큰 금액의 동전을 우선적으로 거슬러 줘야 한다		
		int[] coinUnit = {500, 100, 50, 10};
		int money = 2680;		
		String moneyStr[] = {"500원 : ", "100원 : ", "50원 : ", "10원 : "};
		int a;
		
		for(int i = 0; i < coinUnit.length; i++) {
			a = money / coinUnit[i]; // 동전 개수

			System.out.println(moneyStr[i] + a + "개");
			
			money = money - coinUnit[i]*a; // 남은 돈

		}
		
		// 2680 / 500 = 5
		// 2680 - 500*5 = 180
		
		// 180 / 100 = 1
		// 180 - 100*1 = 80
			
		// 80 / 50 = 1
		// 80 - 50*1 = 30
		
		// 30 / 10 = 3		
	}
}
