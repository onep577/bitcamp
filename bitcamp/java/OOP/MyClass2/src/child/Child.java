package child;

public class Child extends Parent {
	// extends Parent 우리 눈에 보이진 않지만 set메소드, get메소드
	// p메소드 pNumber멤버변수까지 다 상속 받았다
	
	public void fun() {
		// func 메소드는 부모에게 물려받지 않고 자식만 갖고 있다
		System.out.println("Child func()");
		
		// 부모 클래스 pNumber에 private이 붙어있다
		// pNumber = 11; // 부모 클래스에서 private이 붙으면 부모만 접근 가능하다
		// 자식이 pNumber에 값을 넣고 싶으면 set, get으로 접근하자
		setpNumber(111);
		getpNumber();
		System.out.println("set get으로 : pNumber = " + pNumber);
		
		// 부모 클래스 pNumber에 protected가 붙어있다
		pNumber = 222; // protected가 붙으면 자식클래스에서 접근 가능하다
		System.out.println("멤버변수 직접 대입으로 : pNumber = " + pNumber);
	}
}
