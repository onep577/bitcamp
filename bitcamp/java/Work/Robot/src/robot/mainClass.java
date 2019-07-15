package robot;

public class mainClass {
	public static void main(String[] args) {
		/*
		Child c = new Child();
		System.out.println("x="+c.getX());
		*/
		
		
		/*
		Marine unit1[] = new Marine[10];	// 1
		Tank unit2[] = new Tank[5];	// 5
		Dropship unit3[] = new Dropship[3]; // 3
		
		// 200
		Unit unit[] = new Unit[6];
		unit[0] = new Marine();
		unit[1] = new Marine();
		unit[2] = new Marine();
		
		unit[3] = new Tank();		
		unit[4] = new Marine();		
		unit[5] = new Dropship();
		
		// instanceof
		for (int i = 0; i < unit.length; i++) {
			if(unit[i] instanceof Marine) {
				Marine m = (Marine)unit[i];
				m.stimPack();
			}
			else if(unit[i] instanceof Tank) {
				((Tank)unit[i]).changeMode();				
			}
			else if(unit[i] instanceof Dropship) {
				
			}
		}
		*/
		
		
		
		Robot[] arr = { new DanceRobot(), new SingRobot(), new DrawRobot()};
		
		/*
		Robot array[] = new Robot[3];
		array[0] = new DanceRobot();
		array[1] = new SingRobot();
		array[2] = new DrawRobot();
		*/
		
		for(int i=0; i< arr.length;i++) {
			arr[i].Title();
		//	mainClass.action(arr[i]);
		}
		
	}
	
	static void action(Robot robot) {
		if(robot instanceof DanceRobot) {
			DanceRobot d = (DanceRobot)robot;
			d.dance();
		}else if(robot instanceof SingRobot) {
			((SingRobot)robot).sing();
		}else if(robot instanceof DrawRobot) {
			DrawRobot d = (DrawRobot)robot;
			d.draw();
		}		
	}
	
}

class Parent {
	int x=100;
	Parent() {		// 1
		this(200);
		System.out.println("Parent Parent() 2");		
	}
	Parent(int x) {	// 2
		this.x = x;
		System.out.println("Parent Parent() 1");	
	}
	int getX() {
		return x;
	}
}

class Child extends Parent {
	int x = 3000;
	Child() {
		this(1000);
		System.out.println("Child Child() 4");
	}
	Child(int x) {
		this.x = x;
		System.out.println("Child Child() 3");
	}
}





class Unit{
	int x, y; // 현재 위치
	void move(int x, int y) { 
		/* 지정된 위치로 이동 */
		this.x = x;
		this.y = y;
	}
	void stop() { 
		/* 현재 위치에 정지 */	
		System.out.println("Unit 현재 위치에 정지");
	}
}

class Marine extends Unit{ // 보병	
	void stimPack() { 
		/* 스팀팩을 사용한다.*/
		System.out.println("Marine 스팀팩을 사용한다");
	}
}

class Tank extends Unit{ // 탱크
	void changeMode() { 
		/* 공격모드를 변환한다. */
		System.out.println("Tank 공격모드를 변환한다");
	}
}

class Dropship extends Unit{ // 수송선
	void load() { 
		/* 선택된 대상을 태운다.*/ 
		System.out.println("Dropship 선택된 대상을 태운다");
	}
	void unload() { 
		/* 선택된 대상을 내린다.*/ 
		System.out.println("Dropship 선택된 대상을 내린다");
	}
}




class Robot {
	void Title() {
	}	
}

class DanceRobot extends Robot {
	void Title() {	// Over Ride
		System.out.println("나는 댄스 로봇입니다");
		
		dance();
	}
	void dance() {
		System.out.println("춤을 춥니다.");
	}
}
class SingRobot extends Robot {
	void Title() {	// Over Ride
		System.out.println("나는 가수 로봇입니다");
		
		sing();
	}
	void sing() {
		System.out.println("노래를 합니다.");
	}
}
class DrawRobot extends Robot {
	void Title() {	// Over Ride
		System.out.println("나는 그리는 로봇입니다");
		
		draw();
	}
	void draw() {
		System.out.println("그림을 그립니다.");
	}
}
