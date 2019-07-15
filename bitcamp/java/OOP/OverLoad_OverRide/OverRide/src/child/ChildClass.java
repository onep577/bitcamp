package child;

import sup.SuperClass;

public class ChildClass extends SuperClass {
	
	public ChildClass() {
		System.out.println("ChildClass ChildClass() 기본 생성자");
	}
	
	public ChildClass(int number) {
		//super(number);
		System.out.println("ChildClass ChildClass(int number) int 생성자");
	}
	
	public void overRideMethod() { // Over Ride
		//super.overRideMethod(); // super class method
		System.out.println("ChildClass overRideMethod() 부모도 자식도 가지고 있다");
	}
	
	public void function() {
		System.out.println("ChildClass function() 자식만 가지고 있다");
	}

}
