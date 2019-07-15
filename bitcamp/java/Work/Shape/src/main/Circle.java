package main;

public class Circle extends Shape {
	
	private double r; // 반지름
	
	public Circle() {
		super();
	}
	
	public Circle(int x, int y, double r) {
		this(new Point(x, y), r);
	}
	
	public Circle(Point p, double r) {
		super(p);
		this.r = r;
	}

	@Override
	double calcArea() {
		return (r * r * Math.PI);
	}

}
