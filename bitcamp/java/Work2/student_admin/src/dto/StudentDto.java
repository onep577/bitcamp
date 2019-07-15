package dto;

// Data Transfer Object -> 개별데이터
// 멤버변수, 기본 생성자, 생성자, getter, setter, toString  이것이 Dto 이다
public class StudentDto {
	
	private int number;
	private String name;
	private int lang;
	private int eng;
	private int math;
	
	// 클래스를 만들 때 기본 생성자는 깔고 가자
	public StudentDto() {
		
	}

	public StudentDto(int number, String name, int lang, int eng, int math) {
		this.number = number;
		this.name = name;
		this.lang = lang;
		this.eng = eng;
		this.math = math;
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLang() {
		return lang;
	}

	public void setLang(int lang) {
		this.lang = lang;
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
	
	//public void setChapCount(int lang, int eng, int math) {
		// this.lang = lang; this.eng = eng; this.math = math;
		// 같은 매개변수를 가진 국어, 영어, 수학을 모으기도 한다
		// 즉, dto는 규격화 되어있지 않다! 알아보기 편하면 이렇게도 자유이다
	//}

	// toString 이 반드시 필요한것은 아니다 출력해서 확인하는 용도이다
	@Override
	public String toString() {
		return "StudentDto [number=" + number + ", name=" + name + ","
				+ " lang=" + lang + ", eng=" + eng + ", math=" + math + "]";
	}

}
