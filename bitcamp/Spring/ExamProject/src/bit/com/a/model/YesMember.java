package bit.com.a.model;

import java.io.Serializable;

public class YesMember implements Serializable {
	private String message;
	
	public YesMember() {
	}

	public YesMember(String message) {
		super();
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "YesMember [message=" + message + "]";
	}

}
