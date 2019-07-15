
public class mainClass {
	public static void main(String[] args) {
		// final
		final int number = 1; // 변수 -> 상수 : 변할 수 없는 수
	}
}

// final이 있는 클래스는 상속 할 수 없다 final이 있는 메소드 오버라이드 할 수 없다 
// final이 있는 변수는 고정 값이다
/*final*/ class SuperClass {
	// 마지막 최후의 클래스 상속할 수 없는 클래스
	
	public final void method() { // over ride 금지
		
	}
	
}

class ChildClass extends SuperClass{
	
	//public final void method() { // over ride
		// 에러코드 : Cannot override the final method from SuperClass
	//}
}