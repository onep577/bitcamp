package model;

public class PriceDto {
	private int num;
	private String coffee_type;
	private int coff_short;
	private int coff_tall;
	private int coff_grande;
	
	public PriceDto() {
	}

	public PriceDto(int num, String coffee_type, int coff_short, int coff_tall, int coff_grande) {
		super();
		this.num = num;
		this.coffee_type = coffee_type;
		this.coff_short = coff_short;
		this.coff_tall = coff_tall;
		this.coff_grande = coff_grande;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getCoffee_type() {
		return coffee_type;
	}

	public void setCoffee_type(String coffee_type) {
		this.coffee_type = coffee_type;
	}

	public int getCoff_short() {
		return coff_short;
	}

	public void setCoff_short(int coff_short) {
		this.coff_short = coff_short;
	}

	public int getCoff_tall() {
		return coff_tall;
	}

	public void setCoff_tall(int coff_tall) {
		this.coff_tall = coff_tall;
	}

	public int getCoff_grande() {
		return coff_grande;
	}

	public void setCoff_grande(int coff_grande) {
		this.coff_grande = coff_grande;
	}

	@Override
	public String toString() {
		return "CoffeePriceDto [num=" + num + ", coffee_type=" + coffee_type + ", coff_short=" + coff_short
				+ ", coff_tall=" + coff_tall + ", coff_grande=" + coff_grande + "]";
	}
	
}
