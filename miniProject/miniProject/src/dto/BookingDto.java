package dto;

import java.io.Serializable;
import java.util.Date;

public class BookingDto implements Serializable {
	
	private int seq;
	private String id;
	private Date wdate;
	private String visit_date;
	private String leave_date;
	private int total_price;
	private int adult_number;
	private int child_number;
	private String room_number;
	
	public BookingDto() {
		// TODO Auto-generated constructor stub
	}
	
	

	public BookingDto(int seq, String id, Date wdate, String visit_date, String leave_date, int total_price,
			int adult_number, int child_number, String room_number) {
		super();
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
	
	public BookingDto(String visit_date, String leave_date, int adult_number, int child_number) {
		super();
		this.visit_date = visit_date;
		this.leave_date = leave_date;
		this.adult_number = adult_number;
		this.child_number = child_number;
	}

	


	public BookingDto(String id, String visit_date, String leave_date, int total_price, int adult_number,
			int child_number, String room_number) {
		super();
		this.id = id;
		this.visit_date = visit_date;
		this.leave_date = leave_date;
		this.total_price = total_price;
		this.adult_number = adult_number;
		this.child_number = child_number;
		this.room_number = room_number;
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

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
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
		return "BookingDto [seq=" + seq + ", id=" + id + ", wdate=" + wdate + ", visit_date=" + visit_date
				+ ", leave_date=" + leave_date + ", total_price=" + total_price + ", adult_number=" + adult_number
				+ ", child_number=" + child_number + ", room_number=" + room_number + "]";
	}
	
	
	
	
	
	
}
