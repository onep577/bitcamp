
public class mainClass {

	public static void main(String[] args) {
		/*
		  	abstract : 추상 (쓰임은 적다)
		  	완전체는 아닌 선언만 되어있는 메소드를 포함하고 있는 클래스
		  	
		  	추상 메소드 + 일반 메소드 = 추상 클래스
		  	선언만 되어있는 메소드
		  	
		  	생성은 불가능하다. 어떻게하면 생성할 수 있나? 상속 받은 후에 생성이 가능해진다
		  	
		  	public int method(char c, int i)	-> prototype
		  	
		 */
		
		// AbstractClass acls = new AbstractClass(); // 자체 생성 불가능하다
		
		MyClass cls = new MyClass(); // MyClass는 abstractClass를 상속받은 클래스이다
		cls.abstractMethod(); // MyClass의 메소드를 호출했다
		cls.method(); // AbstractClass의 메소드를 호출했다
		
		AbstractClass acls = new MyClass(); // 이렇게는 생성 가능하다
		acls.abstractMethod(); // MyClass의 메소드를 호출했다
		acls.method(); // AbstractClass의 메소드를 호출했다
		
		
		
		
		Robot ro1 = new DanceRobot();
		Robot ro2 = new DrawRobot();
		Robot ro3 = new SingRobot();
		
		ro1.Title(); // 나는 댄스 로봇입니다
		ro2.Title(); // 나는 그리는 로봇입니다
		ro3.Title(); // 나는 가수 로봇입니다
		
		AbstractClass aac = new AbstractClass() {
			@Override
			public void abstractMethod() {
				System.out.println("AbstractClass aac abstractMethod");
			}
		}; // ??
		
		aac.abstractMethod(); // 정의만 된 abstractMethod()를 오바라이드 해서 호출했다

	} // main 함수
}



abstract class Robot {
	// 상속 받은 클래스에서 정의해라!
	abstract void Title();
	// 기본 기능
}

class DanceRobot extends Robot {
	void Title() {	// Over Ride
		System.out.println("나는 댄스 로봇입니다");		
	}
	void dance() {
		System.out.println("춤을 춥니다.");
	}
}
class SingRobot extends Robot {
	void Title() {	// Over Ride
		System.out.println("나는 가수 로봇입니다");		
	}
	void sing() {
		System.out.println("노래를 합니다.");
	}
}
class DrawRobot extends Robot {
	void Title() {	// Over Ride
		System.out.println("나는 그리는 로봇입니다");		
	}
	void draw() {
		System.out.println("그림을 그립니다.");
	}
}


