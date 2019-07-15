package child;

import parent.Parent;
// 자식클래스 만들 때 슈퍼클래스 -> 경로 -> 부모클래스명 적는다
// extends 부모클래스명 이 자동으로 생긴다

public class Child extends Parent {
	
	public Child() {
		//super(); // 부모 클래스 기본 생성자 호출
		//super(123); // 부모클래스 int 생성자 호출
		System.out.println("Child() Child() 기본생성자");
	}
	
	public Child(int num) {
		//super(num); // 부모클래스 int 생성자 호출
		System.out.println("Child() Child(int num) int생성자");
	}
	
	// Over Riding
	public void method() {
		//super.method(); // super는 오버라이딩 메소드에서도 쓰인다
		System.out.println("Child() method()");
	}

}
