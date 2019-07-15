package child;

import sup.SuperClass;

public class SubClass extends SuperClass {
	
	public SubClass() {
		System.out.println("SubClass SubClass() 기본 생성자");
	}
	
	public SubClass(int number) {
		//super(number);
		System.out.println("SubClass SubClass(int number) int 생성자");
	}
	
	public void overRideMethod() { // Over Ride
		//super.overRideMethod(); // super class method
		System.out.println("SubClass overRideMethod() 부모도 자식도 가지고 있다");
	}
	
	public void func() {
		System.out.println("SubClass func() 자식만 가지고 있다");
	}
	
//	public void instanceofKnow() {
//		System.out.println("SuperClass instanceofKnow() 부모도 자식도 가지고 있다");
//	}

}
