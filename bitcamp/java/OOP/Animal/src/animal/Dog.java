package animal;

public class Dog extends Animal {
	
	public Dog(String name) {
		super(name);
	}
	
	public void print() { // Over Ride
		//super.print();
		System.out.println("멍멍이입니다");
		
	}

}
