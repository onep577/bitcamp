package student;

public class Student {
	// 멤버변수
	private String name;
	private int ban;
	private int no;
	private int kor;
	private int eng;
	private int math;
	
	// Source -> Generate Getters and Setters
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getBan() {
		return ban;
	}

	public void setBan(int ban) {
		this.ban = ban;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getMath() {
		return math;
	}

	public void setMath(int math) {
		this.math = math;
	}

	public int getTotal(int kor, int eng, int math) {
		int sum = this.kor + this.eng + this.math;
		return sum;
	}
	
	public double getAverage(){
		return (double)(kor + eng + math) / 3;
	}

}
