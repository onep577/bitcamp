package dto;

import java.io.Serializable;

/*
CREATE TABLE MemberDto(
	ID VARCHAR2(50) PRIMARY KEY,
	PWD VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) NOT NULL
)
*/
public class MemberDto implements Serializable {
	
	private String id;
	private String pwd;
	private String email;
	
	public MemberDto() {
	}

	public MemberDto(String id, String pwd, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", email=" + email + "]";
	}

}
