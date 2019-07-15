package bit;

public class java11 {

	public static void main(String[] args) {
		// 과제10(java05)
		int number;
		
		number = 5;
		
		number = number << 4; // 10 20 40 80
		System.out.println("number = " + number); // number = 80 출력
		
		number = number >> 5; // 40 20 10 5 2
		System.out.println("number = " + number); // number = 2 출력
		
		number = number >>1; // 1
		System.out.println("number = " + number); // number = 1 출력

	}

}
