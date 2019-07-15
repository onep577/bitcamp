package mathod02;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	배열은 아주 중요!
		 	function
		 	매개변수 : 일반 자료형(value의 의한 할당)
		 			배열(address의 할당)
		*/
		int n = 23;
		// 'C' 원시 데이터
		function1('C', n);
		System.out.println("n = " + n);
		// function1은 리턴값을
		// function1에서 변화한 값이 n에 영향을 주지 않는다 n = 23 그대로이다
		
		int array[] = { 1, 2, 3 };
		function2(array); // 매개변수에는 []를 쓰면 안된다
		
		int array2[];
		array2 = function3();
		for(int i = 0; i < array2.length; i++) {
			System.out.println("array2[" + i + "] = " + array2[i]);
		}
		
		int num = 11;
		int numArr[] = new int[1];
		numArr[0] = 11;		
		System.out.println("함수전 num = " + num + ", numArr[0] = " + numArr[0]);
		
		// 11과 numArr자체가 넘어간다
		function4(num, numArr);
		System.out.println("함수후 num = " + num + ", numArr[0] = " + numArr[0]);
		// 주소값을 넘겨주게 되면 원본 데이터가 변경된다 (C언어의 포인터)
		
		int myArray[] = { 100, 200, 300, 400, 500 };
		// 10으로 나눈 값
		// div10() 이 함수에 값다오면 1,2,3,4,5 가 나온다
		
		
		// 둘 다 중요하다!
		// 리턴값을 넘겼다 받은 것
		div(myArray);
		for(int i = 0; i < myArray.length; i++) {
			System.out.println("div함수 : myArray[" + i + "] = " + myArray[i]);
		}
		
		// myArray 배열은 10 20 30 40 50이 되었다
		myArray = div10(myArray);
		for(int i = 0; i < myArray.length; i++) {
			System.out.println("div10함수 : myArray[" + i + "] = " + myArray[i]);
		}
		
		
	} // main 함수
	
	
	
	static void function1(char c, int i) {
		System.out.println("c = " + c + ", i = " + i);
		i = 45;
		System.out.println("i = " + i);
		// 리턴하지 않고 function1 에서만 i=45로 변환
		// 리턴값이 없는 void함수이다
	} // function1함수
	
	
	// 배열의 매개변수는 비워둬야 한다
	// arr변수 첫번째 값의 주소값을 가져온다
	static void function2(int arr[]) {
		for(int i = 0; i < arr.length; i++) {
			System.out.println("arr[" + i + "] = " + arr[i]);
		}
	} // function2함수
	
	
	// void 쓰지 않는다
	// 제일 첫번째 주소가 넘어간다 4byte, 배열(address의 할당), 레퍼런스 참조
	static int[] function3() {
		int arr[] = { 10, 20, 30 };
		return arr;
	} // function3함수
	
	
	// arr[]로 배열을 넘겨 받았다
	// 배열(address의 할당)
	// 배열로 들어가면 들어가는 값만이 아니라 들어갔다 나오는 값 즉, 리턴값이다
	// 배열로 넘겨받으면 값을 다 바꿔서 보낼 수 있다
	static void function4(int num, int arr[]) {
		num = 22;
		arr[0] = 22;
		System.out.println("함수안 num = " + num + ", numArr[0] = " + arr[0]);
	} // function4함수
	
	
	static void div(int divArray[]) {
		for(int i = 0; i < divArray.length; i++) {
			divArray[i] = divArray[i] / 10;
		}
	} // div함수
	
	
	// int 배열로 리턴된다
	static int[] div10(int divArray[]) {
		for(int i = 0; i < divArray.length; i++) {
			divArray[i] = divArray[i] / 10;
		}
		return divArray;
	} // div10함수

	
	
}
