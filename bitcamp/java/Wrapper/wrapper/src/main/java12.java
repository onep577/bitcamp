package bit;

public class java12 {

	public static void main(String[] args) {
		int num1, num2;
		
		num1 = 128;
		num2 = 56;
		
		// 16진수로 바꾼다
		/*
		 	8421 8421
		 	1000 0000
		 	16진수로 0x80
		 	
		 	8421 8421
		 	0011 1000
		 	16진수로 0x38
		*/
		
		num1 = (num1 & num2) | (num1 & num2);
		/*
		 	1000 0000
		 	0011 1000
		 	--------- AND
		 	0000 0000
		 	16진수로 0x1 -> 10진수로 1 떙!
		 	16진수로 0x0 -> 10진수로 0
		*/
		 System.out.println("num1 = " + num1); // 1 예상했었는데 바보.. 0이다
		 
		 num1 = 128;
		 num2 = 56;
		 num2 = ~(num1 ^ num2);
		/*
		 	8421 8421
		 	1000 0000
		 	0011 1000
		 	--------- XOR
		 	1011 1000
		 	16진수로 0xB8 -> 10진수로 184
		 	
		 	~(1011 1000)
		 	0100 0111
		 	16진수로 0x47 -> 10진수로 71
		*/
		 System.out.println("num2 = " + num2); // 184 예상했었는데 -185다
		 // System.out.printf("0x%x \n", num2); // 0xffffff47 출력

	}

}
