package operator2;

public class mainClass {

	public static void main(String[] args) {
		// 논리연산자 == true/false
		/*
		   &&	: AND	그리고
		   ||	: OR	또는
		   !	: NOT	
		   if 제어문과 같이 사용하는 편임
		   a = b 대입
		   a > b
		   a < b
		   a >= b
		   a == b
		 */
		
		int number = 5;

		System.out.println(number == 5); // true
		System.out.println(number > 5); // false
		System.out.println(number >= 5); // true
		System.out.println(number <= 5); // true
		
		System.out.println(number > 0 && number < 10); // &&는 그리고이다 둘 다 참이어야 참 true
		System.out.println(number < 0 && number < 10); // &&는 그리고이다 둘 다 참이어야 참 false
		
		System.out.println(number < 0 || number < 10); // ||는 둘 중 하나라도 참이면 참 true
		System.out.println(number != 6); // true
		
		System.out.println(!(number < 0 && number > 10)); // !false라서 true
		System.out.println(!(number >= 0 || number <= 10)); // !true라서 false

	}

}
