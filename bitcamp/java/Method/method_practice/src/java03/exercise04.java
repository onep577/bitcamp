package java03;

public class exercise04 {

	public static void main(String[] args) {
		// 주어진 int형 배열의 값 중에서 제일 큰 값을 반환한다
		// 만일 주어진 배열이 null이거나 크기가 0인 경우, -999999를 반환한다
		int[] data = { 3, 2, 9, 4, 7 };
		
		for (int i = 0; i < data.length; i++) {
			System.out.println("data[" + i + "] = " + data[i]);
		}
		System.out.println("최대값 : " + max(data));

	} // main 함수
	
	static int max(int[] arr) {
		int max = arr[0]; // 배열의 모든 값이 음수일 경우 m = 0인 것은 최대값이 아니다
		// 초기값을 배열의 첫번째 값으로 했다
		
		// int i = 0; 4byte로 메모리에 올라간다
		// ( 0Xffffffff )( 0 ) 앞에 주소 뒤에 value 값이 들어간다
		// null 은 아예 주소 설정이 안되어있을 때  ( 0x00000000 )( 0 )
		// int arr[] = (0); C언어에서 찾아보면 이렇게 쓰여있다 디파인
		
		// 크기가 0인 경우는 arr의 길이가 0인 경우
		if(arr == null || arr.length == 0) {
			return -999999;
		}

		// sorting 해도 된다 하지만 sorting은 길어지니까 이건 sorting보다 간단한 코드
		for (int i = 0; i < arr.length; i++) {
			if(max < arr[i]) { // 부등호만 > 로 바꾸면 최소값이 나온다
				max = arr[i];
			}
		}

		return max;
	} // max 함수

}
