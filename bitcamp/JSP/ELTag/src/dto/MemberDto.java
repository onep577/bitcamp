package dto;

public class MemberDto {
	private String message;
	
	public MemberDto() {
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public String toString() {
		return "MemberDto [message=" + message + "]";
	}
	

}
