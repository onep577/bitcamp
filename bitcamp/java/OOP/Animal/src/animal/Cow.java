package animal;

public class Cow extends Animal {
	
	public Cow(String name) {
		super(name);
	}
	
	public void print() { // Over Ride
		//super.print();
		System.out.println("황소입니다");
		
	}

}
