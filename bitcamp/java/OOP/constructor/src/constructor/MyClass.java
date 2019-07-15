package constructor;

public class MyClass {
	
	/*
	 	constructor : 생성자  != 초기화		맨 처음 값 설정, 이니셜라이즈 아니다
	 	destructor : 소멸자
	 	
	 	int arr[] = { 1, 2, 3, 4, 5};
	 	배열은 같은 자료형의 묶음
	 	
	 	
	 	constructor
	 	나온 배경	 	다른 자료형의 묶음을 사용하고 싶다?
	 	목적 			배열에 초기값을 넣어주고 싶을 때를 계기로 생성자 탄생
	 	
	 	
	 	C에서는
	 	structure가 있다 (구조체)
	 	MYSTRUCT myst{
	 		int num,
	 		double d,
	 		String s
	 	};
	 	myst st = { 1, 1.5, "abc" }; 이건 C이다
	 	
	 	자바에서는
	 	// 여기에 변수 number, name이 있다고 가정한다
	 	MyClass cls = { 1, "홍길동" }; 초기화 불가능하다
	 	
	 	생성자
	 	1. 함수 -> method
	 	2. 클래스명과 같은 이름을 쓰자
	 	3. return 값이 없다
	 	4. 오버로드가 가능하다 (다수 생성 가능), 즉, 같은 이름의 메소드로써 매개변수의 자료형이나 개수로 구분을 한다
	 	5. 한 번만 호출된다. 임의의 호출이 불가능하다 임의의 호출? 인스턴스. 으로 호출 불가능하다
	 	6. initialize와 성격이 다르다  중요!!
	 	7. 생략이 가능하다
	 	8. 실행되는 시기는 객체를 생성할 때 즉, new라고 적을 때 실행된다
	 	
	 	소멸자
	 	반드시 1개 (delete)
	 	
	*/

	public MyClass(){ // 기본 생성자
		// 원래대로라면 public을 붙여주는 게 정상이다
		System.out.println("MyClass MyClass()");
	}
	
	public MyClass(int i) {
		this(); // 위에있는 기본생성자 호출  MyClass(); 대신에 이렇게 쓴다
		System.out.println("MyClass MyClass(int i)");
	}
	
	public MyClass(char c) {
		this(2); // MyClass(int i) 호출
		System.out.println("MyClass MyClass(char c)");
	}
	
	
	
}
