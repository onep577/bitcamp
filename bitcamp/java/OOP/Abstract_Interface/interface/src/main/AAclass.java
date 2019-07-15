package main;

public class AAclass implements Ainterface, AAinterface {
	// interface는 다중 상속 가능하다
	
	@Override
	public void func() {
		System.out.println("AAclass func()");
		
	}
	
	@Override
	public void method() {
		System.out.println("AAclass method()");
		
	}

}
