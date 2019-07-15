package my;

public class MyClass {
	private int number; // member variable
	
	public static int st_number; // static 변수
	// MyClass에 의존하지 않고 독립적이다 혼자 논다
	// static 프로드램 전체 흐름을 보고 싶을 때 사용한다
	// 각각의 메소드에  어떤 메소드이다 static 변수++ 하고 실행하면 프로그램 순서가 보인다
	
	public static int num;
	// static은 프로그램 실행하면 무조건 잡힌다 생성 안해도 잡힌다
	
	public int getNumber() { // member method
		return number;
	}
	
	public void setNumber(int number) {
		this.number = number;
	}
	
	
	
	public void method() {
		int i; // stack에 잡히고 == auto 자동으로 삭제된다
		// local(지역) variable
		System.out.println("MyClass method()");

		MyClass.st_number = 222; // 에러 안난다
		st_number = 333; // MyClass는 우리 지붕이다 있어도 되고 없어도 된다
		// 앞에 st을 붙인 이유는 static을 표시하기 위해서 붙였다
		
		int num; // num 은 전역도 있고 지역도 있다 그러면 지역변수를 우선 쓴다
		// 이렇게 쓰면 안된다!!!
		
	} // method 함수
	
	
	
	public void function() {
		int num = 0;
		num++; // local 변수
		number++; //member 변수
		MyClass.st_number++; // static 변수
		
		System.out.println("num = " + num);
		System.out.println("number = " + number);
		System.out.println("st_number = " + MyClass.st_number);
	} // function 함수
	
	
	// static 메소드에서는 static 변수는 접근 가능하지만 멤버변수는 접근 불가능하다
	public static void st_method() {
		System.out.println("MyClass st_method");
		//number = 12; // 에러난다
		// static 메소드에서 멤버변수로 접근 불가능하다
		st_number = 234; // 에러 안난다
		// static 메소드에서 static 변수로 접근 가능하다
	}
	
	
	
} // MyClass 클래스
