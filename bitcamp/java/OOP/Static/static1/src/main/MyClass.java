package main;

public class MyClass {
	
	private int number;
	private String name;
	
	// static 메소드
	public static MyClass getInstance() {
		MyClass cls = new MyClass();
		cls.method();
		cls.function();
		return cls;
	}
	
	public void method() {
		System.out.println("MyClass method()");
	}
	
	public void function() {
		System.out.println("MyClass function()");
	}

}
