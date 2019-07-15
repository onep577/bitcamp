package capsul;

public class mainClass {
	public static void main(String[] args) {
		/*
			캡슐화(은닉성)
			상속성
			다형성 
			
			class 내부에 있는 요소(멤버변수)를 외부와 차단
		*/
		MyClass cls = new MyClass();
		// cls.number = 1;
		
		cls.setNumber(1);
		int n = cls.getNumber();
		System.out.println("n = " + n); // 1
		
		System.out.println(cls); // capsul.MyClass@15db9742
				
		cls.name = "홍길동"; // name은 public 이니깐 사용 가능
		
		MyClass mcls = new MyClass();
		System.out.println(mcls); // capsul.MyClass@6d06d69c
		
		System.out.println(mcls.getInstance());
		// capsul.MyClass@6d06d69c
	}
}




