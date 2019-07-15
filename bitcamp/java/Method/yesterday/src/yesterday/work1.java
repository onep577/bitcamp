package yesterday;

public class work1 {

	public static void main(String[] args) {
		// 두 수의 몫과 나머지를 구하라. 함수를 하나만 사용하라.
		int number1, number2;
		int result, tag[];		// 몫, 나머지
		
		tag = new int[1];
		
		number1 = 923;
		number2 = 40;
		
		result = divProcess(number1, number2, tag);
		System.out.println("몫 : " + result + " 나머지 : " + tag[0]);
		
		// swap를 할 수 있는 함수를 제작하라.
		int _number[] = new int[2];
		_number[0] = number1;
		_number[1] = number2;
		
		System.out.println("_number[0] = " + _number[0]);
		System.out.println("_number[1] = " + _number[1]);
	}
	
	// num1, num2 은 들어가는 값 t[] 들어가고 나오는 값
	static int divProcess(int num1, int num2, int t[]) {
		int re;
		re = num1 / num2; // 몫
		t[0] = num1 % num2;
		
		return re;
	}
	
	// swap은 흔한 이름이다 왠만해선 피하거나 앞에 my 등 내 함수를 구분하자
	static void swap() {
		
	}
	
	

}
