package bit.com.a.model;

import java.io.Serializable;

public class CalendarParam implements Serializable {
	private String id;
	private String yyyydd;
	private String year;
	private String month;
	private String date;
	private String hour;
	private String minute;
	
	public CalendarParam() {
	}

	public CalendarParam(String id, String yyyydd) {
		super();
		this.id = id;
		this.yyyydd = yyyydd;
	}

	public CalendarParam(String id, String yyyydd, String year, String month, String date, String hour, String minute) {
		super();
		this.id = id;
		this.yyyydd = yyyydd;
		this.year = year;
		this.month = month;
		this.date = date;
		this.hour = hour;
		this.minute = minute;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getYyyydd() {
		return yyyydd;
	}

	public void setYyyydd(String yyyydd) {
		this.yyyydd = yyyydd;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minute) {
		this.minute = minute;
	}

	@Override
	public String toString() {
		return "CalendarParam [id=" + id + ", yyyydd=" + yyyydd + ", year=" + year + ", month=" + month + ", date="
				+ date + ", hour=" + hour + ", minute=" + minute + "]";
	}

}
