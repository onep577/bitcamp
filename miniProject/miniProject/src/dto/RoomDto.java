package dto;

import java.io.Serializable;

/*
-- 방정보 테이블
CREATE TABLE ROOM(
	ROOM_NUMBER		VARCHAR2(20) PRIMARY KEY,
	PRICE			VARCHAR2(20) NOT NULL,
	GRADE			VARCHAR2(20) NOT NULL
)
*/
public class RoomDto implements Serializable{
	
	private String room_number;
	private int price;
	private String grade;
	
	public RoomDto() {
		// TODO Auto-generated constructor stub
	}

	public RoomDto(String room_number, int price, String grade) {
		super();
		this.room_number = room_number;
		this.price = price;
		this.grade = grade;
	}

	public String getRoom_number() {
		return room_number;
	}

	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	@Override
	public String toString() {
		return "RoomDto [room_number=" + room_number + ", price=" + price + ", grade=" + grade + "]";
	}
	
	
	

}
