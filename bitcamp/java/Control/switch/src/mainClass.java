
public class mainClass {

	public static void main(String[] args) {
		/*
		 	switch : 조건 명시
		 			값이 명확 (범위X)
		 	형식:
		 	switch( 대상이 되는 변수 )
		 	{
		 		case 값1(value):
		 			처리
		 			break;
		 		case 값2(value):
		 			처리
		 			break;
		 		default:	== else
		 			break // 의미없지만 붙이는 경우를 심심치 않게 볼 수 있다
		 	}
		*/
		
		
		int number = 1;
		
		switch(number) {
		
			case 1:		// number == 1인가요?
				System.out.println("number는 1입니다"); //처리
				break;	// 탈출
			case 2:
				System.out.println("number는 2입니다"); //처리
				break;
			default:	// else
				break;
		}
		
		/*
		switch(number == 1) {
			// 에러코드 Cannot switch on a value of type boolean.
			// Only convertible int values, strings or enum variables are permitted		
		}
		*/
		
		/*
		switch(number > 0 && number < 10) {
		case number > 0 && number < 10:
			// 에러코드 Cannot switch on a value of type boolean.
			// Only convertible int values, strings or enum variables are permitted		
		}
		*/
		
		if(number == 1) {
			
		}else if(number == 2) {
			
		}else {
			
		}
		
		
		char c = '가';
		
		switch(c) {
			case '가':
				System.out.println("c = '가'입니다" + c);
				break;
		}
		
		// switch문 안에 실수와 boolean 사용할 수 없다
		double d = 123.4567;
		/*
		switch(d) {
			case 123.4567:
				break;
		}
		*/
		if(d == 123.4567) {
		}
		
		String str = "abc";
		
		switch( str ) {
			case "Abc":
				break;
			case "abc":
				System.out.println("str == \"abc\"");
				break;
		}
		
		
		// 바로 아래 if문 보다 바로 아래 switch문이 더 빠르다
		// 속도를 요하는 프로그램에서 바로 아래 switch문을 쓸 수 있다
		if(number > 0 && number < 10) {
			
		}else if(number > 10 && number < 20) {
			
		}else if(number > 20 && number < 30) {
			
		}
		
		
		switch(number) {
			case 1:
				break;
			case 2:
				break;
			case 3:
				break;
		}

	
	
	
	}

}
