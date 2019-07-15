package java03;

public class exercise03 {

	public static void main(String[] args) {
		// 배열의 값에 *2배의 연산된 값이 산출되도록 메소드를 작성하시오
		
		int num1[] = { 1, 2, 3, 4, 5 };
		getDouble(num1);
		
		// 결과 출력
		for(int i = 0; i < num1.length; i++) {
			System.out.println("num1[" + i + "] = " + num1[i]);
		}

	} // main 함수
	
	static void getDouble(int arr[]) {
		for(int i = 0; i < arr.length; i++) {
			arr[i] = arr[i] * 2;
		}
	} // getDouble 함수

	
} // main class
