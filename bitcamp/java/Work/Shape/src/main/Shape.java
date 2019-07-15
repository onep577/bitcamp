package main;

public abstract class Shape {
	Point p;
	
	public Shape() {
		this(new Point(0, 0));
	}

	public Shape(Point p) { // shape(new Point(23, 45));
		this.p = p; // 멤버변수 p에 매개변수 p를 대입한다
	}
	
	abstract double calcArea(); // 도형의 면적을 계산해서 반환하는 메소드
	
	public Point getPosition() {
		return p;
	}
	
	public void setPosition(Point p) {
		this.p = p;
	}

}
