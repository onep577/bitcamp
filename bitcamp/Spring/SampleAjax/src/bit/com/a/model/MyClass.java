package bit.com.a.model;

import java.io.Serializable;

public class MyClass implements Serializable {
	private int number;
	private String name;
	
	public MyClass() {
	}

	public MyClass(int number, String name) {
		super();
		this.number = number;
		this.name = name;
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

	@Override
	public String toString() {
		return "MyClass [number=" + number + ", name=" + name + "]";
	}

}
