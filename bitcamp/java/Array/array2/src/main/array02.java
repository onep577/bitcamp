package java02;

public class array02 {

	public static void main(String[] args) {
		// 총합, 평균
		int total = 0;
		float average = 0;
		int[][] arr = {
				{5, 5, 5, 5, 5},
				{10, 10, 10, 10, 10},
				{20, 20, 20, 20, 20},
				{30, 30, 30, 30, 30}
		};
		
		
		for(int i = 0; i < arr.length; i++) { // 4
			for(int j = 0; j < arr[0].length; j++) { // 5
				total = total + arr[i][j];
			}
		}
		average = (float)total / (arr.length * arr[0].length);
		// 강제 형변환, float를 해줘야 평균이 실수로 나온다 // 325 / (4*5)
		
		System.out.println("total = " + total);
		System.out.println("average = " + average);

		
		
	}
}
