package main;

public class Rectangle extends Shape {
	
	private int width; // 가로
	private int height; // 세로
	
	public Rectangle() {
		super();
	}
	
	public Rectangle(int width, int height) {
		this(new Point(0, 0), width, height);
	}
	
	public Rectangle(Point p, int width, int height) {
		super(p);
		this.width = width;
		this.height = height;
	}
	
	public boolean isSquare() {
		// 정사각형인지 아닌지를 알려준다
		boolean b = false;
		
		return b;
	}

	@Override
	double calcArea() {

		return (this.width * this.height);
	}

}
