package dto;

import java.io.Serializable;
/*
CREATE TABLE CUSTUSER(
	ID VARCHAR2(50) PRIMARY KEY,
	NAME VARCHAR2(50) NOT NULL,
	ADDRESS VARCHAR2(50) NOT NULL
)
*/
public class CustuserDto implements Serializable {
	
	private String id;
	private String name;
	private String address;
	
	public CustuserDto() {
	}

	public CustuserDto(String id, String name, String address) {
		super();
		this.id = id;
		this.name = name;
		this.address = address;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "CustuserDto [id=" + id + ", name=" + name + ", address=" + address + "]";
	}

}
