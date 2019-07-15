package dto;

import java.io.Serializable;

/*
CREATE TABLE USERDTO()
	ID VARCHAR2(50),
	NAME VARCHAR2(50),
	AGE NUMBER(20),
	JOINDATE DATE
);

dto에 있으면 내가 보기 편하다
파일로 있으면 다른 개발자?가 보여달라고 할 때 편하다
각각 장단점이 다르다
*/

public class UserDto implements Serializable {
	// Serializable 항상 추가하자 안그럼 에러난다
	
	private String id;
	private String name;
	private int age;
	private String joindate;
	
	public UserDto() {
	}

	public UserDto(String id, String name, int age, String joindate) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.joindate = joindate;
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

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	@Override
	public String toString() {
		return "UserDto [id=" + id + ", name=" + name + ", age=" + age + ", joindate=" + joindate + "]";
	}

}
