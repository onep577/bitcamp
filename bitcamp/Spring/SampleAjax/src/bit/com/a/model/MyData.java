package bit.com.a.model;

import java.io.Serializable;

public class MyData implements Serializable {
	private String name;
	private String tel;
	private String email;
	private String birth;
	
	public MyData() {
	}

	public MyData(String name, String tel, String email, String birth) {
		super();
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.birth = birth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "MyData [name=" + name + ", tel=" + tel + ", email=" + email + ", birth=" + birth + "]";
	}

}
