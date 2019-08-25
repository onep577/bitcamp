package dto;

import java.io.Serializable;

public class AdminTodayBookingDto implements Serializable {
	private static final long serialVersionUID = 4332569288967676195L;
	private String id;
	private String name;
	private String grade;
	private int adult_number;
	private int child_number;
	private String room_number;
	private String visit_date;
	private String leave_date;
	
	public AdminTodayBookingDto() {
	}

	public AdminTodayBookingDto(String id, String name, String grade, int adult_number, int child_number, String room_number,
			String visit_date, String leave_date) {
		super();
		this.id = id;
		this.name = name;
		this.grade = grade;
		this.adult_number = adult_number;
		this.child_number = child_number;
		this.room_number = room_number;
		this.visit_date = visit_date;
		this.leave_date = leave_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
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

	@Override
	public String toString() {
		return "TodayBookingDto [id=" + id + ", name=" + name + ", grade=" + grade + ", adult_number=" + adult_number
				+ ", child_number=" + child_number + ", room_number=" + room_number + ", visit_date=" + visit_date
				+ ", leave_date=" + leave_date + "]";
	}
	

}
