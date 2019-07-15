
public class mainClass {

	public static void main(String[] args) {
		/*
		 	// 오버로드 는 함수 동명이인 이다
		 	Over Load : function의 명칭은 같고
		 				매개변수(인수, 인자, Parameter)의 자료형이나
		 				개수가 다른 함수들을 의미한다
		 	image draw	-> RGB, RGBA
		 				배경을 draw		paint(String imagename)
		 				달, 해의 이미지		paint(String imagename, int x, int y)
		*/
		
		mathod();			// method() 호출
		mathod('A');		// method(char c) 호출
		mathod(12);			// method(int i) 호출
		mathod('A', 12);	// method(char c, int i) 호출
		mathod(12, 'A');	// method(int i, char c) 호출
		int sum = displaySum(1, 2, 4, 6, 7);
		System.out.println("sum = " + sum);	// sum = 20
		sum = displaySum(4, 6, 7);
		System.out.println("sum = " + sum);	// sum = 17
		disp("hello", 3, 7, 9, 12);			// str = hello, sum = 31

	}
	
	static void mathod() {
		System.out.println("method() 호출");
	}
	
	static void mathod(char c) {
		System.out.println("method(char c) 호출");
	}
	
	static void mathod(int i) {
		System.out.println("method(int i) 호출");
	}
	
	static void mathod(char c, int i) { // getter : 갯타
		System.out.println("method(char c, int i) 호출");
	}
	
	static void mathod(int i, char c) { // getter : 갯타
		System.out.println("method(int i, char c) 호출");
	}
	
	// 오버로드는 이름만 같고 다른 함수이다
	// ======================================================
	
	/*	
	static int mathod() { // 리턴값이 다른것은 오버로드와 관련이 없다
		System.out.println("method() 호출");
		return1; // 리턴값은 함수가 끝나고 실행되는 출구이기 때문에 다른 함수인지 구분을 못 한다
	}
	
	static void mathod(int i1, char c) { // 위에 함수와 가인수만 다르다 가상인수 i1이 다른것은 에러
		System.out.println("method(int i, char c) 호출");
	}
	*/
	
	
	// 가변인수 - 인수에 변화를 줄 수 있다 나도 사용하고 다른 이도 편하게 사용할 수 있다
	static int displaySum(int...num) {
		int sum = 0;
		
		// num.length은 배열일 때 사용했다 ...num도 배열과 사용법이 같다
		for (int i = 0; i < num.length; i++) {
			sum = sum + num[i];
		}
		return sum;
	} // displaySum 함수
	
	// 일반 인수 + 가변인수 (가변인수만 써야하는 건 아니다)
	// 일반 인수를 다 적은 후 마지막 인수로 가변인수를 선언한다 왜? 컴파일은 왼쪽에서부터 된다
	// (int...num, int i)  일때 어디까지가 가변인수인지 모른다
	// 가변인수는 하나의 메소드에 하나만 쓸 수 있다
	static int disp(String str, int...num) {
		int sum = 0;
		for (int i = 0; i < num.length; i++) {
			sum = sum + num[i];
		}
		System.out.println("str = " + str);
		System.out.println("sum = " + sum);
		return sum;
	} // disp 함수
	
	
}
