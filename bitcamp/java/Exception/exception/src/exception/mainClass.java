package exception;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	Exception : 예외 != 에러 -> 개발자용
		 	// 에러가 아니다 멈추는 게 아니라 쭉 가는데 예외 즉, 경고를 알려준다
		 	
		 	baseball -> 1 ~ 10 -> 'A' == 65
		 	random find -> 1 ~ 100 -> 'B' == 66
		 	
		 	number format 10 -> 'a' == 97
		 	array index [5] -> [0] ~ [4] 실수로 5번째에 접근했다 범위 exception 예외
		 	class not find // 특정 클래스를 부르고 싶은데 없을 때
		 	file not found // 파일을 못 찾겠다 개발자가 읽어 오려는 file이 없을 때
		 	
		 	형식
		 	
		 	// try : 노력하다, 시도하다
		 	try{
		 		// 예외가 발생할 가능성이 있는 코드
		 	}catch(예외클래스1 e{
		 		// 예외 메시지를 발생
		 	}catch(예외클래스2 e{
		 		// 예외 메시지를 발생
		 	}catch(예외클래스3 e{
		 		// 예외 메시지를 발생
		 	}finally{
		 		// 예외가 발생하든 안하든 무조건 실행
		 		// 되돌림 (undo)
		 		// rollback
		 		// DB 데이터를 가져올때 꼭 finally를 해야한다??
		 	}
		 	
		*/
		
		int arr[] = { 11, 22, 33};
		
		System.out.println("프로그램 시작");
		
		try {
			for (int i = 0; i < 4; i++) {
				System.out.println(arr[i]);
			}
			System.out.println("for문 탈출 부분");
			
			return;
		}catch(ArrayIndexOutOfBoundsException e) {
			// try 안에서 exception 발생했을 때 여기로 온다
			System.out.println("배열의 범위를 벗어 났습니다");
			// 배열의 범위를 벗어 났습니다 출력
			e.printStackTrace();
			// java.lang.ArrayIndexOutOfBoundsException: 3
			// at exception.mainClass.main(mainClass.java:44) 발생
			System.out.println(e.getMessage());
			// 3 출력
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}finally {
			System.out.println("finally 부분"); // 반드시 거쳐서 나간다 뒷처리한다
		}
		
		System.out.println("프로그램 끝");
		/**/
		
		try {
			callFunc();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		function();
		
	} // main 함수

	
	
	// static void callFunc() {
	// static void callFunc() throws IndexOutOfBoundsException{
	// throws IndexOutOfBoundsException
	// 이 함수내에서 익셉션이 발생할 소지가 있다 사용자용이 아니라 개발자용이다
	static void callFunc() throws Exception{
		// exception만 있을때는 부르는 함수에 마우스커서를 가져가서 surround with try/catch
		int num[] = { 11, 22, 33 };
		
		
	//	try {
			for (int i = 0; i < 4; i++) {
				System.out.println(num[i]);
			}
	//	}catch(IndexOutOfBoundsException e) {
	//		e.printStackTrace();
	//	}
		
	} // callFunc()
	
	
	
	static void function() {
		System.out.println("function() 시작");
		return;
		//System.out.println("function() 끝");
	} // function()

	
	
} // main class
