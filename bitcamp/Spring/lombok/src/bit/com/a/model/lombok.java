package bit.com.a.model;

import java.io.Serializable;

@Getter
@Setter
@ToString
public class lombok implements Serializable {
	private int seq;
	private String id;
	private String pwd;
	private String name;
	
	public lombok() {}

	public lombok(int seq, String id, String pwd, String name) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	@Override
	public String toString() {
		return "lombok [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + "]";
	}

}
