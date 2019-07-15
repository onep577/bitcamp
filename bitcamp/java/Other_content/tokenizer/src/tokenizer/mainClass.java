package tokenizer;

import java.io.StreamCorruptedException;
import java.util.StringTokenizer;

public class mainClass {

	public static void main(String[] args) {
		
		String str = "홍길동--2001/03/14-서울시"; // - 기호를 토큰이라고 한다
		
		String split[] = str.split("-");
		// split이란 배열에 str 문자열에서 - 기호를 뺀 문자열을 넣어준다
		// split의 길이는 4
		for (int i = 0; i < split.length; i++) { // 4
			System.out.println("split[" + i + "] = " + split[i]);
		}
		
		
		StringTokenizer st = new StringTokenizer(str, "-");
		// str 문자열을 - 이걸로 자르겠다
		
		int len = st.countTokens(); // 자르고 넘긴 문자열의 개수 즉, 배열이 몇개인가요?
		System.out.println("len = " + len); // 3
		
		// nextToken 은 0 번째 데이터 값을 리턴해주고 다음으로 넘어간다
		String s = st.nextToken(); // s로 들어간건 0번째 문자열
		System.out.println(s); // 홍길동
		s = st.nextToken(); // s로 들어간건 2번째 문자열
		System.out.println(s); // 2001/03/14
		s = st.nextToken(); // s로 들어간건 3번째 문자열
		System.out.println(s); //서울시
		
		// split 은 String에 소속 Tokenizer는 독립적이다
		/*
		 	Tokenizer와 split의 차이점
		 	split : 빈문자열도 취급
		 	StringTokenizer : 빈문자열은 무시한다
		 	예) 회원가입시 필수가 아니면 기입하지 않아도 된다 이럴때 토크나이저를 사용하기도 한다
		*/

	} // main 함수

}
