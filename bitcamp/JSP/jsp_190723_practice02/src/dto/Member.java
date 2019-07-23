package dto;

import java.util.Arrays;

public class Member {
	private String id;
	private String pwd;
	private String[] hobby;
	private String age;
	private String etc;
	
	public Member() {
	}
	
	public Member(String id, String pwd, String[] hobby, String age, String etc) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.hobby = hobby;
		this.age = age;
		this.etc = etc;
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

	public String[] getHobby() {
		return hobby;
	}

	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", hobby=" + Arrays.toString(hobby) + ", age=" + age + ", etc="
				+ etc + "]";
	}

}
