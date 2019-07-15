package main;

import child.Child;
import children.Children;
import parent.Parent;

public class mainClass {

	public static void main(String[] args) {
		
		new Parent(); // 이렇게만 해도 기본 생성자 호출 가능
		Parent pa1 = new Parent(); // 기본 생성자 호출
		Parent pa2 = new Parent(2); // 기본 생성자 호출, 하나 생성자 호출
		System.out.println("====================================");
		/**/
		
		
		
		
		// 부모클래스 this를 지웠다 이해하는데 헷갈릴까봐
		Child ch = new Child();
		// 부모 클래스 Number에 123을 넣는다
		// 상속 받았으니까 부모클래스 기본 생성자 호출, 자식클래스 기본 생성자 호출되야 하는데
		// super(123) 때문에 부모 int생성자 호출 -> 자식 기본생성자 호출된다
		System.out.println("====================================");
		Child ch1 = new Child(456);
		// 부모 클래스 Number에 456을 넣는다
		// 상속 받았으니까 부모클래스 기본생성자 호출, 자식클래스 int 생성자 호출되야 하는데
		// super(num)이 때문에 부모 int생성자 호출 -> 자식 int생성자 호출된다
		
		// Child 클래스 Child(int num) 생성자 호출 -> super(num) 호출 ->
		// Parent(int number) 호출 -> 부모클래스 private 멤버변수 값 넣을 수 있다
		System.out.println("====================================");
		int n = ch.getNumber();
		int n1 = ch1.getNumber();

		System.out.println("n = " + n); // n = 123
		System.out.println("n1 = " + n1); // n = 456
		System.out.println("====================================");
		// 부모클래스 private 멤버 변수까지 접근했다
		/**/
		
		
		
		
		ch.method(); // Parent() method()  Child() method()
		ch1.method(); // Parent() method()  Child() method()
		// super.method 때문에 부모 메소드도 호출된다 super가 없으면 자식 메소드만 호출된다
		System.out.println("====================================");
		Child ch2 = new Child(); // Parent Parent()  Child() Child()
		System.out.println("====================================");
		Children aa = new Children(); // Parent Parent() 출력
		// 자식 기본생성자가 없으면 부모 기본생성자만 호출된다
		/**/
		
		
		
		
		// 예) 가족 안에 아빠 엄마 나 오빠를 관리할 때
		// 예) 야구팀 안에 
		Parent p1 = new Child();
		// 부모 기본생성자 호출 -> 자식 기본생성자 호출
		System.out.println("====================================");
		Parent p2 = new Children();
		// 부모 기본생성자 호출
		System.out.println("====================================");
		// 부모클래스 인스턴스 heap영역에는 자식 클래스 용량으로 생성
		// 같은 부모로 묶어서 자식들을 관리한다

		// 엄마가 엄마, 나, 오빠를 관리한다
		p1.method(); // Child() method()
		p2.method(); // Parent() method()
		// Child에 method 있고, Children에 method 없다
		/**/
		/*
		 	부모클래스
		 	메소드 이름 A B
		 	자식클래스
		 	메소드 이름 A C
		 	
		 	* A 메소드 : 오버라이딩
		 	
		 	부모클래스 인스턴스로 접근 했을 때
		 	A - 자식클래스 A만 호출
		 	B - 부모클래스 B만 호출
		 	C - 호출 할 수 없다
		*/
		
	}
}