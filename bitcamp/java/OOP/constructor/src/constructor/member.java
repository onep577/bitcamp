package constructor;


// DTO (Data Transfer Object = DTO)		Value Object = VO
//			  변경
public class member {
	private int number;
	private String name;
	private double height;
	
	public member() {
		
	}
	
	public member(int number, String name, double height) {
		this.number = number;
		this.name = name;
		this.height = height;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	@Override
	public String toString() {
		return "member [number=" + number + ", name=" + name + ", height=" + height + "]";
	}

	
	
	
	
	
	
	
}
