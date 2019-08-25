package dto;

import java.io.Serializable;

public class AdminChartDto implements Serializable {
	private static final long serialVersionUID = 3887468880408900865L;
	private int name;
	private int y;
	private String str;
	private int num;
	
	public AdminChartDto() {
	}

	public AdminChartDto(int y) {
		super();
		this.y = y;
	}

	public AdminChartDto(int name, int y) {
		super();
		this.name = name;
		this.y = y;
	}

	public AdminChartDto(String str, int num) {
		super();
		this.str = str;
		this.num = num;
	}

	public int getName() {
		return name;
	}

	public void setName(int name) {
		this.name = name;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public String getStr() {
		return str;
	}

	public void setStr(String str) {
		this.str = str;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "AdminChartDto [name=" + name + ", y=" + y + ", str=" + str + ", num=" + num + "]";
	}

}
