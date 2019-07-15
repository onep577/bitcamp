package string;

public class mainClass {

	public static void main(String[] args) {
		// String 클래스에 있는 함수(메소드)
		// concat, equals, indexOf, lastIndexOf, length, replace, split, substring
		// toUpperCase, toLowerCase, toString, trim, valueOf, contains, charAt
		// String : 문자열
		// Wrapper class	char 배열
		
		String str; // String 클래스명 == class template(형태)
					// str == 변수(Object:객체) --> instance(주체)
		
		str = "안녕하세요";
		System.out.println("str = " + str); // str = 안녕하세요
		
		String str1 = new String("하이");		// new가 붙었다! 즉, 동적할당
		System.out.println("str1 = " + str1); // str1 = 하이
		
		String str2 = "반갑습니다";
		
		String str3;
		
		// 문자열과 문자열을 합한다
		str3 = str1 + str2;
		System.out.println("str3 = " + str3); // str3 = 하이반갑습니다
		
		// concat() : 문자열을 합한다. 함수이다. 컨넥션캐치 (연결 잡다)
		String str4 = "건강하세요";
		
		
		// concat이란 함수가 str3와 str4를 합쳤다
		String str5 = str3.concat(str4);
		System.out.println("str5 = " + str5); // str5 = 하이반갑습니다건강하세요
		
		
		
		// 사용을 잘 안한다 왜? String이란 훌륭한 Wrapper 클래스가 존재하기 때문이다
		char cdata[] = {'h', 'e', 'l', 'l', 'o'};
		
		String str6 = new String(cdata);
		System.out.println("str6 = " + str6); // str6 = hello
		/**/
		
		/*
		 	class 인간
		 		기능(함수(function) == 메소드(method))	클래스에 소속되어 있는 함수를 메소드라고 한다
		 		
		 		걷는다
		 		말한다
		 		공부한다
		*/
		
		
		// equals : 문자열 비교. 참 많이 쓴다
		String str7 = "Hello";
		String str8 = "Hell";
		String stro = "o";
		
		str8 = str8 + "o";
		// str8 = str8.concat(stro);
		System.out.println("str8 = " + str8); // str8 = Hello
		// 문자열을 + 로 붙이던 concat을 쓰던 str7 == str8 은 체크 못한다
		
		
		// 문자열을 비교할 땐 equals를 꼭 쓰자!
		// 연산으로 문자열을 합한다 - str7과 str8은 다르다
		if(str7 == str8) { // 처음 Hell을 가져온다 str8 = str8 + "o"; 과 str8 = str8.concat(stro); 둘 다 체크 못한다
			// if 문 안에 str7 = str8로 넣을 수 없다 true/false로 값이 나와야한다
			// 에러코드 Type mismatch: cannot convert from String to boolean
			System.out.println("if - str7 = " + str7 + ", str8 = " + str8);
			System.out.println("연산으로 문자열을 합한다 - str7과 str8은 같다");
		}else {
			System.out.println("else - str7 = " + str7 + ", str8 = " + str8);
			System.out.println("연산으로 문자열을 합한다 - str7과 str8은 다르다");
		}
		
		// equals비교 - str7과 str8은 같다
		if(str7.equals(str8) == true) {
			// str7.equals(str8)만 써도 똑같이 작동한다 if문의 조건식에서 boolean이 들어가야 하는데
			// str7.equals(str8)이 true이기 때문이다
			System.out.println("if - str7 = " + str7 + ", str8 = " + str8);
			System.out.println("equals비교 - str7과 str8은 같다");
		}else {
			System.out.println("else - str7 = " + str7 + ", str8 = " + str8);
			System.out.println("equals비교 - str7과 str8은 다르다");
		}
		
		boolean b = str7.equals(str8); // true
		
		// equals 함수 후 boolean으로 대입 후 if문에서 확인 - str7과 str8은 같다
		if(b == true) { // 조건문에 b만 있어도 똑같이 작동한다 b가 true 즉, boolean 값이기 때문이다
			System.out.println("if - str7 = " + str7 + ", str8 = " + str8);
			System.out.println("equals 함수 후 boolean으로 대입 후 if문에서 확인 - str7과 str8은 같다");
		}else {
			System.out.println("else - str7 = " + str7 + ", str8 = " + str8);
			System.out.println("equals 함수 후 boolean으로 대입 후 if문에서 확인 - str7과 str8은 다르다");
		}
		
		
		
		
		// indexOf : 문자 검색을 위한 함수. 앞부분부터 찾는다. 찾은 문자의 index 번호를 돌려준다
		String str9 = "abcde9fgabcdefABCD";
		
		int indexNumber1 = str9.indexOf('A');
		System.out.println("indexNumber1 = " + indexNumber1); // indexNumber1 = 14
		int indexNumber2 = str9.indexOf('9');
		System.out.println("indexNumber2 = " + indexNumber2); // indexNumber2 = 5
		
		// 값을 못 찾으면 -1
		int indexNumber3 = str9.indexOf(9);
		int indexNumber4 = str9.indexOf('y');
		System.out.println("indexNumber3 = " + indexNumber3); // indexNumber3 = -1
		System.out.println("indexNumber4 = " + indexNumber4); // indexNumber4 = -1
		
		int n = str9.indexOf("a");
		System.out.println("n = " + n); // n = 0
		n = str9.indexOf("d");
		System.out.println("n = " + n); // n = 3
		
		
		// lastIndexOf : 뒤에서부터 검색
		n = str9.lastIndexOf("d");
		System.out.println("n = " + n); // n = 11
		
		
		// length == 문자열 길이
		int len = str9.length();
		System.out.println("len = " + len); // len = 18
		
		
		
		
		// replace == 수정. 참 많이 사용
		String str10 = "A*B*C*D";
		
		String repStr = str10.replace("*", "-");
		// oldChar : 수정하고 싶은 문자, newChar : 바꿀 문자
		System.out.println("repStr = " + repStr); // repStr = A-B-C-D
		
		str10 = "대..터 시설들을 ...기 시작했습니다.";
		repStr = str10.replace("..", "__");
		System.out.println("repStr = " + repStr); // repStr = 대__터 시설들을 __.기 시작했습니다.
		/**/
		
		/*
		 	split -> token을 이용해서 문자열을 자른다
		 	
		 	이름	나이	생년월일	주소
		 	홍길동-24-2001/01/13-서울시		'-' token
		 	
		 	홍길동
		 	24
		 	2001/01/03
		 	서울시
		*/
		
		
		// replace와 split은 같이 자주 사용된다
		// String 클래스에 의미없는 문자를 자르는 함수가 있다고 기억하자

		String str11 = "홍길동-24-2001/01/13-서울시";
		
		String splitStr[] = str11.split("-"); // token을 넣자
		
		System.out.println("splitStr[0] = " + splitStr[0]); // splitStr[0] = 홍길동
		System.out.println("splitStr[1] = " + splitStr[1]); // splitStr[1] = 24
		System.out.println("splitStr[2] = " + splitStr[2]); // splitStr[2] = 2001/01/13
		System.out.println("splitStr[3] = " + splitStr[3]); // splitStr[3] = 서울시
		
		
		// splitStr[0] = 홍길동
		// splitStr[1] = 24
		// splitStr[2] = 2001/01/13
		// splitStr[3] = 서울시
		for (int i = 0; i < splitStr.length; i++) {
			System.out.println("splitStr[" + i + "] = " + splitStr[i]);
		}
	
		
		// substring -> substr
		// substring보단 split을 많이 사용하지만 substring도 유용하다
		// 어느 영역부터 어느 영역까지 가져오고 싶을 때 사용, token하고는 상관없다
		String substr = str11.substring(0); // 시작 위치만 잡아주었기 때문에 문자를 다 가져온다
		System.out.println("substr = " + substr); // substr = 홍길동-24-2001/01/13-서울시
		
		substr = str11.substring(4); // 24-2001/01/13-서울시
		System.out.println("substr = " + substr); // substr = 24-2001/01/13-서울시
		
		substr = str11.substring(4, 8); // index 4번부터 7번까지 가져온다
		System.out.println("substr = " + substr); // 24-2
		
		
		
		
		// String 클래스안에 모든 문자를 대문자로 또는 모든 문자를 소문자로 바꾸는 함수가 있다
		String str12 = "abcABC";
		
		// 모든 문자 -> 대문자 toUpperCase
		String upStr = str12.toUpperCase();
		System.out.println("upStr = " + upStr); // upStr = ABCABC
		
		// 모든 문자 -> 소문자 toLowerCase
		String lowStr = str12.toLowerCase();
		System.out.println("lowStr = " + lowStr); // lowStr = abcabc
		
		// ASCII A -> 65	'a' -> 97	97 - 65 = 32
		char c = 'A';
		char cc = 'a';
		System.out.println("A = " + c + " " + (int)c); // A = A 65
		System.out.println("a = " + cc + " " + (int)cc); // a = a 97
		System.out.println("A = " + c + " " + (char)(c + 32)); // A = A a
		System.out.println("a = " + cc + " " + (char)(cc - 32)); // a = a A
		
		

		
		
		// trim 공백을 제거하는 함수(앞부분과 뒷부분)
		// 검색창에 '아이폰' '   아이폰  '을 검색하면 같은 페이지로 이동한다
		String str14 = "      java   java  java     ";
		String trimStr = str14.trim();
		System.out.println("trimStr = " + trimStr);
		// trimStr = java   java  java // 앞뒤 공백이 사라진다
		
		
		
		// valueOf	(숫자 -> 문자열, 문자열 -> 숫자)
		
		int num = 123;
		long lo = 1234L;
		double d = 123.4567;
		
		String snum = String.valueOf(num);
		String slo = String.valueOf(lo);
		String sd = String.valueOf(d);
		
		System.out.println(snum + ", " + slo + ", " + sd); // 123, 1234, 123.4567
		
		// valueOf보다 간단하다 하지만 정석은 valueOf이다
		String _snum = num + "";
		String _slo = slo + "";
		String _sd = d + "";
		
		System.out.println(_snum + ", " + _slo + ", " + _sd); // 123, 1234, 123.4567		
		
		
		
		// toString
		String str13 = "안녕하세요";
		System.out.println(str13); // 안녕하세요
		System.out.println(str13.toString()); // 안녕하세요
		
		
		
		
		
		
		// contains 탐색
		// 알고리즘(정렬, 트리, 셔플, 탐색) 꼭 기억! 4대요소
		
		String str15 = "서울시 강남구";
	
		boolean rb;
		// 문자열을 찾았습니다
		rb = str15.contains("서울"); // 문자열을 찾았습니다
		if(rb == true) {
			System.out.println("문자열을 찾았습니다");
		}else{
			System.out.println("문자열을 찾지 못했습니다");
		}
		
		
		
		
		// charAt : index 번호를 넣으면 문자를 돌려준다
		String str16 = "가나다라마";
		
		char ch = str16.charAt(2);
		System.out.println("ch = " + ch); // ch = 다
		
		
		
		/**/
		
		
		
	}
}
