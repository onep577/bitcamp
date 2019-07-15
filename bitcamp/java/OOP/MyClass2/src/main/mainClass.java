package main;

import child.Child;
import child.Parent;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	상속성이란?
		 	부모 클래스에 있는 모든 특성을 하위(자식) 클래스에 상속(계승) 하는 것
		 	다중 상속 불가능하다 (C++에서는 다중 상속 가능하다)
		*/
		Child ch = new Child();
		ch.pMethod(); // 자식 클래스의 변수로 부모 클래스로 접근했다
		
		
		ch.setpNumber(123);
		System.out.println(ch.getpNumber());
		// 자식클래스의 변수가 부모클래스 set메소드 호출 -> 부모클래스 안에서 멤버변수 pNumber에 값을 넣었다
		// 자식클래스의 변수가 부모클래스 get메소드 호출
		
		
		Parent pa = new Parent();
		pa.pMethod();
		System.out.println("==================================");
		ch.fun();
		// pa.func(); // 부모 인스턴스는 부모클래스에 없고 자식클래스에만 생성된 메소드에는 접근 못 한다


		System.out.println("==================================");
		// 부모클래스 pNumber에 protected가 붙어있다
		// pa.pNumber = 13; // 에러난다 패키지가 같다면 에러 안난다
		pa.pMethod();
		pa.setpNumber(456);
		System.out.println(pa.getpNumber());
	}

}
