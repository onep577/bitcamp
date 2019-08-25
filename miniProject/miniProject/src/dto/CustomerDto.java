package dto;

import java.io.Serializable;

/*
-- 테이블 지울 때 무결성도 같이 지워주기
DROP TABLE BOOKING
CASCADE CONSTRAINTS;


-- 고객 테이블
CREATE TABLE CUSTOMER(
	ID				VARCHAR2(20) PRIMARY KEY,
	PASSWORD		VARCHAR2(20) NOT NULL,
	NAME			VARCHAR2(20) NOT NULL,
	ADDRESS			VARCHAR2(50) NOT NULL,
	BIRTHDAY		VARCHAR2(20) NOT NULL,
	PHONE			VARCHAR2(50) NOT NULL,
	AUTH			NUMBER(1)	 NOT NULL,
	EMAIL			VARCHAR2(50),
	GRADE			VARCHAR2(10) NOT NULL,
	BOOKING_COUNT	NUMBER(20)	 NOT NULL,
	TOTAL_PAYMENT	NUMBER(20)	 NOT NULL
)

*/

public class CustomerDto implements Serializable{
	
	private String id;
	private String pwd;
	private String name;
	private String address;
	private String birthday;
	private String phone;
	private int auth;
	private String email;
	private String grade;
	private int booking_count;
	private int total_payment;
	
	public CustomerDto() {
		// TODO Auto-generated constructor stub
	}

	public CustomerDto(String id, String pwd, String name, String address, String birthday, String phone, int auth,
			String email, String grade, int booking_count, int total_payment) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
		this.birthday = birthday;
		this.phone = phone;
		this.auth = auth;
		this.email = email;
		this.grade = grade;
		this.booking_count = booking_count;
		this.total_payment = total_payment;
	}

	public CustomerDto(String id, String pwd, String name, String address, String birthday, String phone, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.address = address;
		this.birthday = birthday;
		this.phone = phone;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public int getBooking_count() {
		return booking_count;
	}

	public void setBooking_count(int booking_count) {
		this.booking_count = booking_count;
	}

	public int getTotal_payment() {
		return total_payment;
	}

	public void setTotal_payment(int total_payment) {
		this.total_payment = total_payment;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", address=" + address + ", birthday="
				+ birthday + ", phone=" + phone + ", auth=" + auth + ", email=" + email + ", grade=" + grade
				+ ", booking_count=" + booking_count + ", total_payment=" + total_payment + "]";
	}
	
	
	

}
