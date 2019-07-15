package study3;

public class mainClass2 {

	public static void main(String[] args) {
		/*
		 	&	AND				1 1 -> 1
		 	|	OR				1 0, 1 1 -> 1
		 	^	XOR				1 0, 0 1 -> 1
		 	<< left shift	*2		0001 0010
		 	>> right shift  /2		1000 0100
		 	~	0 -> 1, 1 -> 0
		*/
		int number = 5;			// 0101
		
		number = number << 4;	// 0101 0000
		number = number >> 5;	// 0000 0010 뒤에 1이 사라진다
		
		int num1, num2;
		
		num1 = 128;				// 1000 0000	-> 0x80
		num2 = 56;				// 0011 1000	-> 0x38
		
		num2 = ~(num1 ^ num2);
		// 1000 0000
		// 0011 1000
		// 1011 1000
		// 0100 0111
		System.out.println("num2 = " + num2);
		
		/*
		Scanner sc = new Scanner(System.in);
		
		int inNumber;
		String numName;
		
		System.out.print("숫자입력 : ");
		inNumber = sc.nextInt();
		
		numName = (inNumber > 0)?"양수":"음수";
		System.out.println(numName + "입니다");
		*/
		
		int r;
		// 범위 : 0 ~ 99 개수 : 1개
		r = (int)(Math.random() * 100); // cast 변환
		System.out.println("r = " + r);
		
		// 범위 : 11, 12, 13, 14, 15 개수 : 1개
		r = (int)(Math.random() * 5) + 11; // 0 ~ 4
		System.out.println("r = " + r);
		
		// 범위 : 3, 7, 9, 13, 15 개수 : 1개
		//int array[] = new int[5];
		// System.out.println(array[0]); // 0부터 4번까지 다 0 나온다
		
		int array2[] = {3 ,7 ,9 ,13 ,15};
		r = (int)(Math.random() * 5); // 0 ~ 4
		System.out.println(array2[r]);

	}

}
