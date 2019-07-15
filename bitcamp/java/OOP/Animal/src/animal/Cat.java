package animal;

public class Cat extends Animal {
	
	public Cat(String name) {
		super(name);
	}
	
	public void print() { // Over Ride
		//super.print();
		System.out.println("고양이입니다");
		
	}
	
	public void catMethod() {
		System.out.println("무기는 발톱입니다");
	}

}
