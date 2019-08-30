package bit.com.a.model;

import java.io.Serializable;

public class CalendarParam implements Serializable {
	private String id;
	private String yyyydd;
	
	public CalendarParam() {
	}

	public CalendarParam(String id, String yyyydd) {
		super();
		this.id = id;
		this.yyyydd = yyyydd;
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

	@Override
	public String toString() {
		return "CalendarParam [id=" + id + ", yyyydd=" + yyyydd + "]";
	}

}
