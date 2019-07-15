package parent;

public class Parent {
	
	private int Number;
	
	public Parent() {
		//this(2); // 이 코드에서 무한루프이기 때문에 에러나지만
		// this(2) this() 둘 다 사용 가능하다
		// int 생성자 호출, 기본 생성자 호출
		System.out.println("Parent Parent() 기본생성자");
	}
	
	public Parent(int number) { // 생성자는 오버로드 가능하다
		//this(); // 기본 생성자 호출
		this.Number = number;
		System.out.println("Parent Parent(int number)  int생성자");
	}

	public int getNumber() {
		return Number;
	}

	public void setNumber(int number) {
		Number = number;
	}
	
	/*
	 	Over Ride
	 	자식클래스에서 상속 받은 메소드를 고쳐 기입하는 것
	*/
	
	public void method() {
		System.out.println("Parent() method()");
	}

}
