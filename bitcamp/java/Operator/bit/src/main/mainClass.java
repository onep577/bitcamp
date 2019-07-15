package bit;

public class mainClass {

	public static void main(String[] args) {
		// bit 연산 == 고급연산자
		/*
		 	bit : 0/1 (0과 1로 연산처리)
		 	&	AND
		 	|	OR
		 	^	XOR
		 	<<	left shift
		 	>>	right shift
		 	~	반전
		*/
		
		
		
		// AND
		int number;
		//number = 0xa;
		//System.out.println("number = " + number); // 10 출력
		
		number = 0x71 & 0xb5; // 대문자 소문자 둘 다 사용가능
		/*
		 	8421 8421
		 	
		 	0111 0001
		 	1011 0101
		 	-----------AND 연산
		 	0011 0001 -> 16진수로 0x31 -> 10진수로 49
		 */
		System.out.println("number = " + number); // 49 출력
		System.out.printf("0x%x \n", number); // 0x31출력, %x는 16진수로 출력
		
		
		
		// OR
		number = 0x71 | 0xb5;
		/*
		 	8421 8421
		 	
		 	0111 0001
		 	1011 0101
		 	-----------OR 연산
		 	1111 0101 -> 16진수로 0xF5-> 10진수로 245
		*/
		System.out.println("number = " + number); // 245 출력
		System.out.printf("0x%x \n", number); // 0xf5출력, %x는 16진수로 출력
		
		
				
		// XOR
		/*
	 		8421 8421
	 	
	 		0111 0001
	 		1011 0101
	 		-----------XOR 연산
	 		1100 0100 -> 16진수로 0xC4 -> 10진수로 196
	 */
		number = 0x71 ^ 0xb5;
		System.out.println("number = " + number); // 195출력
		System.out.printf("0x%x \n", number); // 0xc4출력, print는 f로 해야된다
		
		
		
		// left shift
		/* 왼쪽으로 한칸 민다 즉, 곱하기 2한 결과 그냥 x2하면 되지만 몇천개하면 속도가 달라진다 로우레벨은 속도 때문에 사용
		 	0001	-> 1
		 	0010	-> 2
		 	0100	-> 4
		 	1000	-> 8
		 */
		
		// 계산하면 0100이다 그럼 앞에 0은 ?
		// number = 0111 -> 앞에 0이 있으면 8진수이다 출력은 8진수가 10진수로 계산되어 나온다
		number = 0x1 << 2; // 0001 << 2 -> 0100이다
		System.out.println("number = " + number); // 4출력
		
		
		
		// right shift
		number = 0x8 >> 2;
		System.out.println("right shift number = " + number); // 2출력
		
		
		
		// ~	0 -> 1 1 -> 0 (반전)
		/*
		 	0101 0101 -> 1010 1010
		*/
		
		byte by;

		number = ~0x55;
		System.out.printf("0x%x \n", number);
		// 0xffffffaa출력 16진수로 썼을 때 2칸짜리가 8bit 1byte
		by = ~0x55;
		System.out.printf("0x%x \n", by); // 0xaa출력
		
		
		
		// 삼항 연산자 (제어문과 비슷, 사용 빈도수가 높다)
		/*
		 	value = (조건) ? 값1 : 값2
		 	조건 참 = 값1
		 	조건 거짓 = 값2
		*/
		int num = 5;
		
		char c = ( num > 0 )?'Y':'N';
		System.out.println("c = " + c); // Y출력
		
		int n = ( num != -1 )?100:200;
		System.out.println("n = " + n); // 100출력
		
		String str = ( num <= 0 )?"0보다 작거나 같다":"0보다 크다";
		System.out.println("str = " + str); // 0보다 크다
		
		
		
		
		

	}

}
