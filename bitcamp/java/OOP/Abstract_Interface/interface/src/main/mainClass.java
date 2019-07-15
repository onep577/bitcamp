package main;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	interface : 추상 메소드만을 포함하고 있다 (쓰임이 많다)
		 				abstract를 붙이지 않는다
		 				
		 				interface 자체만으로는 생성할 수 없다
		 				항상 상속 받은 후에 생성이 가능하다
		 				java는 다중 상속이 불가능하다 하지만 interface는 다중 상속 가능하다
		 				변수와 일반 메소드는 추가할 수 없다
		 	
		 	부모 class	: method를 무조건 정의
		 		|
		 		| - 자식클래스1
		 		| - 자식클래스2
		 		| - 자식클래스3
		 		
		 	interface
		 		|
		 		| - 자식클래스1
		 		| - 자식클래스2
		 		| - 자식클래스3
		 		
		 	원의 넓이 : 반지름 * 반지름 * 3.14;
		 	직사간형 : 가로 * 세로;
		 	삼각형 : 가로 * 세로 * 1/2;
		 				
		*/
		//Ainterface ai = new Ainterface(); // Ainterface는 interface이다. 자체 생성할 수 없다
		
		Aclass ac = new Aclass(); // Aclass는 Ainterface를 상속받은 클래스이다. 생성 가능하다
		ac.method(); // Ainterface에서 method를 정의만 했고 Ainterface를 상속받은
		// Aclass에서 메소드 method()를 오버라이드해서 ac로 호출했다. 정의된걸 사용했다
		
		Ainterface ai = new Aclass(); // Ainterface로 new는 할 수 없지만 상속받은 Aclass를
		// new 하는건 가능하다
		
		
		System.out.println("==============================");
		AAclass aac = new AAclass(); // Ainterface, AAinterface 다중 상속
		aac.method(); // Ainterface 메소드를 호출했다
		aac.func(); // AAinterface 메소드를 호출했다
		System.out.println("==============================");

		
		
		
		//////////////////////////////
		// Ainterface에 method 있고, AAinterface에 func 있다
		Ainterface ai1 = new AAclass();
		AAinterface ai2 = new AAclass();
		Ainterface ai3 = new Aclass();
		// Ainterface는 둘 다 상속했기 때문에 둘 다 생성 가능하다 하지만 이렇게 쓰지 말고!!!
		// 상속받은 클래스와 객체 interface를 동일한 interface로만 쓰자!!!

		ai1.method();
		//ai1.func();	// 에러 AAclass는 Ainterface와 AAinterface 둘 다 상속 받았지만
						//Ainterface에 func 메소드가 없다
		//ai2.method(); // 에러 AAclass는 Ainterface와 AAinterface 둘 다 상속 받았지만
						//AAinterface에 method 메소드가 없다
		ai2.func();
		ai3.method();
		//ai3.func();	// 에러  Ainterface와 Aclass 둘 다 func 메소드가 없다
		////////////////////////////// 비추천한다
		
		
		
		
		Ainterface a1 = new Aclass();
		Ainterface a2 = new A1class();
		// interface에선 상속받은 클래스와 동일한 클래스인게 좋다
		

	}

}
