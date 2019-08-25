package dto;

import java.io.Serializable;

public class AdminTotalChartDto implements Serializable {
	private static final long serialVersionUID = 5051357704464494955L;
	private String month;
	private int price;
	
	public AdminTotalChartDto() {
	}

	public AdminTotalChartDto(String month, int price) {
		super();
		this.month = month;
		this.price = price;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "AdminTotalChartDto [month=" + month + ", price=" + price + "]";
	}

}
