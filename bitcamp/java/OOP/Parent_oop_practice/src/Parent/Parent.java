package Parent;

public class Parent {
	int x = 100;
	public Parent() {
		this(200);
		System.out.println("Parent() x = " + x);
	}
	public Parent(int x) {
		this.x = x;
		System.out.println("Parent(int x) : " + this);
		System.out.println("Parent(int x) x = " + x);
	}
	public int getX() {
		System.out.println("getX() x = " + x);
		return x;
	}
}
