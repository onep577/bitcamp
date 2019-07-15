package capsul;

public class MyClass {
	// 캡슐화 class 내부에서 사용할 변수를 묶음
	
	private int number;		// private == 개인적인
	String name;

	// setter 와 getter로 은닉성
	// 우리 마음대로 밖에서 제어 할 수 있는 것
	// 세팅만 할 수도 있고, 얻기만 할 수도 있다

	// 은닉성 : 변수를 외부와의 접근을 제어
	// this == instance의 주소
	public void setNumber(int number) {	// setter
		// 외부에서 setter를 통해 값을 세팅할 수 있다
		//number = number;
		// 멤버변수도 number 가인수도 number 이다 구분을 어떻게 하지?
		// 구분자가 필요할 때 앞에 this를 쓴다
		this.number = number;
	}
	
	public int getNumber() {		// getter
		// 외부에서 getter를 통해 값을 가져갈 수 있다
		return number;
	}
	
	public MyClass getInstance() {
		// 내부 설계에서 this로 접근하면 자기 자신
		return this;
	}

	
}
