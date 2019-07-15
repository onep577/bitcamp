package java02;

public class array01 {

	public static void main(String[] args) {
		// 합계
		int[] arr = {10, 20, 30, 40, 50};
		int sum = 0;
		
		for(int i = 0; i < arr.length; i++) {
			sum = sum + arr[i];
		}
		
		System.out.println("sum = " + sum);

	}
}