package java03;

public class exercise02 {

	public static void main(String[] args) {
		// 메소드명 : shuffle
		// 주어진 배열에 담긴 값의 위치를 바꾸는 작업을 반복하여 뒤섞이게 한다
		// 처리한 배열을 반환한다
		// 반환타입 : int[], 매개변수 : int[] arr - 정수 값이 담긴 배열
		
		int[] original = { 1, 2, 3, 4, 5, 6, 7, 8 ,9 };
		
		// 리턴값이 있을때
		//int[] result = shuffle(original);
		shuffle(original);
		for (int i = 0; i < original.length; i++) {
			System.out.println("result[" + i + "] = " + original[i]);
		}

	} // main 함수
	
	// 리턴값이 있으면 static int[]로 바꾼다
	static void shuffle(int original[]) {
		// 섞이지 않는게 있을 수 있으니 계속 돌리기 위해서 i < 1000이다
		for (int i = 0; i < 1000; i++) {
			// x, y에 0 ~ 8까지의 숫자 중 하나를 받는다
			int x = (int)(Math.random() * 9);
			int y = (int)(Math.random() * 9);
		
			// shuffle
			int temp = original[x];
			original[x] = original[y];
			original[y] = temp;
		}
		
		// 리턴값이 없어도 된다
		//return original;
	} // shuffle 함수

}
