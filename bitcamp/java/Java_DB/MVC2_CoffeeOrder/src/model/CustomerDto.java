package model;

import java.io.Serializable;
/*
DROP TABLE CUSTOMER
CASCADE CONSTRAINTS;

CREATE TABLE CUSTOMER(
	ID VARCHAR2(20) PRIMARY KEY,
	PWD VARCHAR2(50) NOT NULL,
	-- view에서 막아줘야지 DB까지 오면 안된다
	NAME VARCHAR2(50) NOT NULL,
	AGE NUMBER(10) NOT NULL,
	AUTH NUMBER(1) NOT NULL
	-- 우리가 구분하기 위해 존재하는 컬럼. 유저는 AUTH 값을 넣지 않는다
);

SELECT * FROM CUSTOMER;
*/
public class CustomerDto implements Serializable {
	private String id;
	private String pwd;
	private String name;
	private int age;
	private int auth;
	
	public CustomerDto() {
	}

	public CustomerDto(String id, String pwd, String name, int age, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.age = age;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "CustomerDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", age=" + age + ", auth=" + auth + "]";
	}
	
}
