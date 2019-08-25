package dto;

import java.io.Serializable;
import java.util.Date;

public class BookingCheckDto implements Serializable {
	private static final long serialVersionUID = -5916555557467718412L;
	private String name;
	private int seq;
	private String id;
	private String wdate;
	private String visit_date;
	private String leave_date;
	private int total_price;
	private int adult_number;
	private int child_number;
	private String room_number;
	
	public BookingCheckDto() {
	}

	public BookingCheckDto(String name, int seq, String id, String wdate, String visit_date, String leave_date,
			int total_price, int adult_number, int child_number, String room_number) {
		super();
		this.name = name;
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.visit_date = visit_date;
		this.leave_date = leave_date;
		this.total_price = total_price;
		this.adult_number = adult_number;
		this.child_number = child_number;
		this.room_number = room_number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public String getVisit_date() {
		return visit_date;
	}

	public void setVisit_date(String visit_date) {
		this.visit_date = visit_date;
	}

	public String getLeave_date() {
		return leave_date;
	}

	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}

	public int getAdult_number() {
		return adult_number;
	}

	public void setAdult_number(int adult_number) {
		this.adult_number = adult_number;
	}

	public int getChild_number() {
		return child_number;
	}

	public void setChild_number(int child_number) {
		this.child_number = child_number;
	}

	public String getRoom_number() {
		return room_number;
	}

	public void setRoom_number(String room_number) {
		this.room_number = room_number;
	}

	@Override
	public String toString() {
		return "BookingCheckDto [name=" + name + ", seq=" + seq + ", id=" + id + ", wdate=" + wdate + ", visit_date="
				+ visit_date + ", leave_date=" + leave_date + ", total_price=" + total_price + ", adult_number="
				+ adult_number + ", child_number=" + child_number + ", room_number=" + room_number + "]";
	}

}
