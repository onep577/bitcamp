package java03;

public class exercise06 {

	public static void main(String[] args) {
		// String 변수에 있는 문자열이 정수인지, 실수인지를 판별하는 함수를 작성하시오
		String strNumber1 = "123.4567";
		String strNumber2 = "456";
		
		Boolean booNum = doubleInt(strNumber1);
		System.out.println(booNum);
		
		Boolean booNum2 = doubleInt(strNumber2);
		System.out.println(booNum2);

	} // main 함수
	
	
	// 정수이면
	static boolean doubleInt(String str) {
		boolean b = false;
		for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i);
			System.out.println("ch = " + ch);
			
			// 5.0 으로 들어오면 실수이다 처음에 double형으로 선언했을테니까
			if(ch == '.') {
				b = true; // 실수인가? true
				break;
			}
		} // for
		
		return b;
	} // doubleInt 함수

}
