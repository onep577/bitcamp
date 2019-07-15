package constructor;

public class mainClass {

	public static void main(String[] args) {
		MyClass cls = new MyClass();
						  // 괄호()에서 기본 생성자 호출된다
		// 호출되면서 인스턴스가 넘어간다
		new MyClass();
		// 기본 생성자를 지우면 에러난다 위에도 에러난다
		// 이것만으로도 호출 가능하다
		
		MyClass cls1 = new MyClass( 1 );
		MyClass cls2 = new MyClass( 'a' );
		
		System.out.println("===================");
		
		
		member mem = new member(1, "홍길동", 172.1); // 초기값
		System.out.println(mem.toString());
		mem.setHeight(181.2);
		//String name = mem.getName();
		System.out.println(mem.toString());
		
		
	}

}
