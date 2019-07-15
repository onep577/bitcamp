package Child;

import Parent.Parent;

public class Child extends Parent {
	int x = 3000;
	public Child() {
		this(1000);
		System.out.println("Child() x = " + x);
	}
	public Child(int x) {
		this.x = x;
		System.out.println("Child(int x) : " + this);
		System.out.println("Child(int x) x = " + x);
	}

}
