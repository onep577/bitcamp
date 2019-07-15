package sup;

public class SuperClass {
//public class SuperClass extends Object {
	// 자바클래스에서 기본적으로 상속받는 클래스가 있다
	// extends Object 는 눈에 보이지 않아도 상속받고 있다
	
	private int number;
	
	public SuperClass() {		
		System.out.println("SuperClass SuperClass() 기본 생성자");
	}
	
	public SuperClass(int number) {
		System.out.println("SuperClass SuperClass(int number) int 생성자");
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}
	
	public void method() {
		System.out.println("SuperClass method() 부모만 가지고 있다");
	}
	
	public void overRideMethod() {
		System.out.println("SuperClass overRideMethod() 부모도 자식도 가지고 있다");
	}
	
//	public void instanceofKnow() {
//		System.out.println("SuperClass instanceofKnow() 부모도 자식도 가지고 있다");
//	}

}
