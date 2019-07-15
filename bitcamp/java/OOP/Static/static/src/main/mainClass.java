package main;

import my.MyClass;

public class mainClass {

	public static void main(String[] args) {
		/*
		MyClass cls = new MyClass();
		
		cls.setNumber(123);
		cls.method(); // MyClass method() 출력
		cls.method(); // MyClass method() 출력
		cls.method(); // MyClass method() 출력
		/**/
		/*
		 	static : 정적 != 동적
		 	값을 유지
		 	
		 	세 개의 메소드가 호출되었지만 프로그램을 종료할 때까지 메모리 세 개가 다 유지되어 있다
		 	프로그램 시작시에 memory 올라감으로 계속 유지 된다
		 	global variable
		 	(전역)
		*/
		
		
		
		/*
		MyClass.st_number = 111;
		// static 변수에 값을 넣을 땐 앞에 인스턴스가 아닌 클래스 명이 온다
		
		MyClass cls = new MyClass();
		System.out.println(cls.st_number); // 111
		System.out.println(MyClass.st_number); // 111
		
		MyClass cls1 = new MyClass();
		cls1.st_number = 222;

		System.out.println(MyClass.st_number); // 222
		// static 변수는 Class명. 으로 접근한다
		System.out.println(cls.st_number); // 222
		System.out.println(cls1.st_number); // 222
		// static 변수는 객체가 몇개이든 메모리 공간은 하나이다
		/**/
		
		
		/*
		 	static 변수는 static 메모리에 잡힌다
		 	global 변수는 Heap 메모리에 잡힌다
		 	local 변수는 stack 메모리에 잡힌다
		*/
		
		// st_number 생성 -> static
		MyClass cls2 = new MyClass(); // number 생성 -> Heap
		
		cls2.function(); // num 생성 -> stack
		cls2.function(); // static에 올라갔다 내렸갔다 생성되고 삭제되고
		cls2.function();
		// 로컬변수는 함수가 호출될 때 멤버변수는 객체가 생성될 때 정적 변수는 프로그램 시작할 때 생성
		System.out.println("=====================================");
		
		
		
		MyClass cls3 = new MyClass();
		cls3.function();
		System.out.println(cls3); // my.MyClass@15db9742   my패키지에  MyClass클래스
		// heap 영역에 들어가 있는 주소 == this == 메모리에 들어있는 주소값
		
		
		MyClass.st_method(); // 메소드에서 this를 못 쓴다 this 란? 객체가 생성된 주소
		/**/
	}

}
