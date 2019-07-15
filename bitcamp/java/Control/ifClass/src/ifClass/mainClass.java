package ifClass;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	제어문
		 	
		 	종류 :
		 		조건문
		 		if
		 		
		 		if else
		 		
		 		if
		 		else if
		 		else
		 		
		 		switch
		 		
		 		
		 		
		 		loop(반복문)
		 		for
		 		
		 		while
		 		
		 		do while
		 		
		 		
		 		
		 		반복 제어문
		 		break
		 		continue
		*/
		
		// 조건문
		/*
		 형식 :
		 	if( 조건 ) {   조건 == 논리연산(true/false) a > 0 && a <= 10
		 		// 처리
		 	}
		 	
		 	if( 조건 ) // 하나만 있을 때 {} 블록괄호 생략 가능
		 		System.out.println("hello");
		*/
		
		int number;
		
		number = 1;
		
		if(number > 0 ) { // 참
			System.out.println("number는 0보다 큽니다");
		}
		
		if(number == 1 ) { // 참          = 대입연산자, == 조건연산자
			System.out.println("변수 number의 값은 1입니다");
		}
				
		if(number >= 10 ) { // 거짓
			System.out.println("number는 10보다 크거나 같습니다"); // 출력 안된다
		}
				
		if(true) { // 참
			System.out.println("true 입니다");
		}
		
		boolean b = false;
		
		if(b == false) { // 참
			System.out.println("b == false 입니다");
		}
		
		if(b != true) { // 참
			System.out.println("b != ture 입니다");
		}
		
		if(b) { // b == true 냐는 물음
			System.out.println("b == true 입니다"); // 출력 안된다
		}
		
		if(!b) { // b == false 냐는 물음
			System.out.println("b == false 입니다");
		}
		
		if(number > 0 && number <= 10) {
			System.out.println("number는 0보다 크고 10보다 작거나 같습니다");
		}
		
		if(number < 30 || number > 49) {
			System.out.println("number는 30보다 작거나 49보다 큽니다");
		}
		
		
		
		// if else
		/*		 		
		 	if( 조건1 ){
		 		// 조건1이 true 처리
		 	} else {
		 		// 조건1이 false 처리
		 	}
		*/
		if(number > 10) {
			System.out.println("number는 10보다 큽니다"); // 출력 안된다
		} else {
			System.out.println("number는 10보다 작거나 같습니다");
		}
		
		
		// 조건 분기
		/*
		 	if( 조건1 ){
		 		조건1이 true면 처리
		 	} else if( 조건2 ){
		 		조건2가 true면 처리
		 	} else if( 조건3 ){
		 		조건3가 true면 처리
		 	} else{
		 		조건이 다 성립되지 않았을 때 처리 생략가능
		 	}
		*/
		
		int age = 23;
		
		if(age < 20) { // 조건 처리를 어디서부터 할지 잘 생각 < 50 로 시작하면 20~40대는 안 나온다
			System.out.println("당신은 미성년자 입니다");
		} else if(age < 30) {
			System.out.println("당신은 20대 입니다");
		} else if(age < 40) {
			System.out.println("당신은 30대 입니다");			
		} else if(age < 50) {
			System.out.println("당신은 40대 입니다");			
		} else {
			System.out.println("당신은 50세 이상입니다");
		}
		
		
		if(age >= 50 && age < 60) { // 이렇게도 쓸 수 있다
		}
		else if(age > 0 && age < 20) {			
		}
		else if(age >= 20 && age < 30) {			
		}
		else if(age >= 30 && age < 40) {					
		}
		else {			
		}
		
		
		
		// if문 안의 if문
		int count = 95;
		
		if(count >= 90) {
			if(count >= 95) {
				System.out.println("A+입니다");
			}else {
				System.out.println("A입니다");
			}
		}		
		
		
		
	}

}
