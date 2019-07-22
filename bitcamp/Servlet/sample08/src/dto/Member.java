package dto;

public class Member {
	
	private String id;
	private String pwd;
	
	public Member() {
	}

	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + "]";
	}

}
