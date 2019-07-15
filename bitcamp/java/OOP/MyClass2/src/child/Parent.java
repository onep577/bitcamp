package child;

// 부모 클래스
public class Parent {
	
	// private 접근 지정자이다
	// private int pNumber; // private이 붙으면 자식 클래스에서 접근 불가능하다
	// protected 접근 지정자이다
	protected int pNumber; // 자식 클래스에서 접근 가능하다 하지만 외부에선 접근 불가능하다

	public int getpNumber() {
		return pNumber;
	}

	public void setpNumber(int pNumber) {
		this.pNumber = pNumber;
	}
	
	public void pMethod() {
		System.out.println("Parent pMethod()");
	}

}
