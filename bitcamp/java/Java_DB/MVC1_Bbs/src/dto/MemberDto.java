package dto;

import java.io.Serializable;

/*
DROP TABLE MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
	ID VARCHAR2(20) PRIMARY KEY,
	PWD VARCHAR2(50) NOT NULL,
	-- view에서 막아줘야지 DB까지 오면 안된다
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) UNIQUE,
	AUTH NUMBER(1) NOT NULL
	-- 우리가 구분하기 위해 존재하는 컬럼. 유저는 AUTH 값을 넣지 않는다
);

SELECT * FROM MEMBER;
*/
public class MemberDto implements Serializable {
	private String id;
	private String pwd;
	private String name;
	private String email; // 유니크 써보려고
	private int auth; // 사용자 : 3, 관리자 : 1
	
	public MemberDto() {
	}

	public MemberDto(String id, String pwd, String name, String email, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.auth = auth;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", auth=" + auth + "]";
	}

}
