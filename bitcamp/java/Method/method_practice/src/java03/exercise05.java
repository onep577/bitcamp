package java03;

public class exercise05 {

	public static void main(String[] args) {
		// 주어진 문자열이 모두 숫자로만 이루어져 있는지 확인한다
		// 모두 숫자로만 이루어져 있으면 true를 반환하고, 그렇지 않으면 false를 반환한다
		// 만일 주어진 문자열이 null or 빈 문자열 "" 이라면 false를 반환한다
		// 힌트)String 클래스의 charAt(int i) 메소드를 사용 문자열 i번째 위치한 문자를 얻을 수 있다
		
		String str = "123";
		System.out.println(str + "은 숫자입니까? " + isNumber(str));
		// int의 parseInt함수를 이용해서 숫자로 바꾼다
		int number = Integer.parseInt(str);
		System.out.println("숫자 " + number + "입니다");

		str = "1234o";
		//boolean b = isNumber(str); 리턴값을 가져와서 b에다 담는다
		System.out.println(str + "은 숫자입니까? " + isNumber(str));
		// isNumber(str) 만으로도 리턴값을 가져온다
		
	} // main 함수
	
	
	static boolean isNumber(String st){
		if(st == null || st == "") {
			return false;
		}
		boolean b = true;
		int num;
		char ch;
		
		// charAt( 0, 1, 2 )
		for(int i = 0; i < st.length(); i++) {
			ch = st.charAt(i);		
			num = (int)ch;
			
			if(num < 48 || num > 57) { // 아스키코드값 48 ~ 57은 0 ~ 10까지 이다
				b = false;
				break;
			}
		}
		
		return b;
	} // isNumber 함수

}
