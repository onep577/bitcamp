package java03;

public class exercise07 {

	public static void main(String[] args) {
		// 암호화, 복호화
		String str = "abc123";
		String result = "";
		
		// 암호화 - 값을 암호화한다
		result = alphaToSymbol(str);
		// 복호화 - 암호화한 값을 원래대로 변환
		oricode(result);

	} // main 함수

	
	// 암호화 함수
	static String alphaToSymbol(String src){
		char[] abcCode ={	// 26개 a ~ z
				'`','~','!','@','#','$','%','^','&','*',
				'(',')','-','_','+','=','|','[',']','{',
				'}',';',':',',','.','/'
		};
		// 10개			// 0   1   2   3   4   5   6   7   8   9
		char[] numCode = {'q','w','e','r','t','y','u','i','o','p'};
		
		
		String result = ""; // return으로 넘길 문자열
		
		for(int i = 0; i < src.length(); i++) { // main함수에서 넘겨받은 문자열의 길이만큼 for문 돈다
			char ch = src.charAt(i);	// ch변수에 main함수에서 넘겨받은 문자열의 한 문자를 순서대로 넣는다
			int num = (int)ch;	// ch 변수안에 하나의 문자를 아스키코드값의 숫자로 넣는다
			
			// 아스키코드값으로 바꾼 것
			// a -> 97, b -> 98, c -> 99, 1 -> 49, 2 -> 50, 3 -> 51
			// 알파벳일 경우 -> 특수기호
			if(num >= 97 && num <= 122) { // a ~ z 라면
				// 한 문자씩 ch에 넣고 다시 num에 그 문자에 해당하는 아스키 코드값을 넣었다
				// 알파벳의 경우 a ~ z까지는 97 ~ 122까지이니까
				// abcCode에서 a의 index값이 0이니까 num - 97해서 a는 0으로 세팅한다
				// a -> 0, b -> 1, c -> 2 index값이 설정되었다
				num = num - 97;	// 'a' == 0으로 셋팅하기 위해서	
				result = result + abcCode[num];
				// 리턴값 result로 암호화된 결과를 main 함수에 보내기 위해 abcCode 배열에 index값 num을 넣는다
			}
			// 알파벳이 아닐 경우 숫자일 경우 -> 영문자
			else {
				// 0 ~ 9 의 아스키코드값이 48 ~ 57이다
				num = num - 48;	// '0' == 0으로 셋팅하기 위해서
				result = result + numCode[num];
			}
		}
		System.out.println(src + "의 암호화는 " + result + "입니다");// abc123의 암호화는 `~!wer입니다
		
		return result;
	} // alphaToSymbol 암호화 함수
	
	
	
	
	
	// 복호화 함수
	static String oricode(String result) {
		String originalStr = ""; // 복호화해서 main함수에 리턴값으로 넘길 문자열
		
		// main함수에서 넘겨받은 result는 암호화된 문자열
		char[] abcCode ={	// 26개 a ~ z
				'`','~','!','@','#','$','%','^','&','*',
				'(',')','-','_','+','=','|','[',']','{',
				'}',';',':',',','.','/'
		};
		// 10개			// 0   1   2   3   4   5   6   7   8   9
		char[] numCode = {'q','w','e','r','t','y','u','i','o','p'};
		
		
		// main 함수에서 넘겨받은 암호화된 문자열의 길이만큼 for문이 돈다
		for (int i = 0; i < result.length(); i++) {
			// 암호화한 문자 result를 한 문자씩 산출한다
			char c = result.charAt(i);
			// 한 문자씩 산출한 걸 ASCII code값으로 변환
			int ascCode = (int)c;
			//System.out.println("--" + ascCode);
			// --96, --126, --33, --119, --101, --114
			//   `      ~     !      w      e      r
			
			
			
			
			// 암호화한 값이 알파벳인 경우 numCode를 보자 -- > 숫자로 복호화 시키자
			// 아스키 코드값이 97 ~ 122 면 문자는 a ~ z 이다
			// numCode에 알파벳 10개만 있는데 97 ~ 122로 조건하는 이유는 numCode 값이 모두 영문자이기 때문이다
			// 모두 영문자이니 ascCode가 영문자냐고 묻고 그 후 밑에 for문으로 numCode와 직접 대조할 수 있다
			if(ascCode >= 97 && ascCode <= 122) {
				
				int index = 0;
				// numCode를 보며 ascCode값이 암호표 몇번째 있는지 대조하자
				// 암호화하는 함수에는 비교하려는 대상 문자열(str)의 길이만큼 돌리는 for문이 하나이다
				// 복호화하는 함수에는 비교하려는 대상 문자열(result)의 길이만큼 돌리는 for문과 그 문자열을 아스키코드로
				// 바꾸고 암호코드 numCode에 대조해서 맞게 찾아야해서 numCode 길이 만큼 돌리는 for문과
				// abcCode 길이만큼 돌리는 for문 세개이다
				for (int j = 0; j < numCode.length; j++) {
					// 알파벳인 경우 numCode에서 찾기
					// 한 문자씩 산출 -> 아스키코드 값으로 변환 -> 암호표와 대조
					// abcCode와 비교할지 numCode와 비교할지를 if문으로 걸기 위해 아스키 코드값으로 바꿨다
					// 암호화된 문자열(result)의 문자 하나씩 암호표와 대조하기 위해 c == numCode 이다
					if(c == numCode[j]) {
						index = j; // c의 문자와 맞는 영문자를 찾았다는 의미 찾았으면 나가자
						break;
					}
				} // numCode를 보며 암호표 몇번째 있는지 대조하는 for문
				
				
				// 아스키 코드로 맞춰준다 // 0 ~ 9 까지가 아스키코드값 48 ~ 57 까지이다
				// 암호화된 문자열의 문자하나씩 numCode와 대조해서 맞을 때 맞는 numCode의 값을 가져오기 위해서
				// 즉, 암호화된 문자열 --> 문자 하나씩 numCode 대조 --> index + 48인 이유는 원본문자가
				// 숫자이기 때문이고 아스키코드 값으로 48 ~ 57까지여서 초기값 0 + 48 --> numCode 값 넣는다
				index = index + 48; // 2 -> "2"
				// 원본의 문자를 추가한다
				originalStr = originalStr + (char)index; // wer -> 123 복호화 끝
				//System.out.println("복호화 if문 : " + index);
				System.out.println("복호화 if문 : " + (char)index);
				System.out.println("복호화 if문 : " + originalStr);
				// 복호화 if문 : 49
				// 복호화 if문 : 1
				// 복호화 if문 : abc1
				// 복호화 if문 : 50
				// 복호화 if문 : 2
				// 복호화 if문 : abc12
				// 복호화 if문 : 51
				// 복호화 if문 : 3
				// 복호화 if문 : abc123
				// 복구된 코드 문자열은 abc123입니다
			} // numCode 복호화 if문
			
			
			
			
			// 암호화된 문자열(result) 알파벳 아닌 경우 --> 영문자
			else {
				int index = 0; // index 초기화
				for (int j = 0; j < abcCode.length; j++) {
					if( c == abcCode[j]) {
						index = j;
						break;
					}
				}
				index = index + 97;
				// 암호화된 문자열(result) 가 알파벳이 아닌 경우 즉, 특수기호인 경우 영문자 a ~ z 로 바꾼다
				// a ~ z 가 아스키 코드값으로 97 ~ 122
				// 숫자값을 문자로 강제형 변환하면 98 이 '98'이 되는게 아니라 98의 아스키 코드값 'b'가 된다
				// 문자값을 숫자로 cast 변환하면 'c'의 아스키 코드값 99 가 된다
				originalStr = originalStr + (char)index; // `~! -> abc 복호화 끝
				System.out.println((char)index);
				// a b c
				System.out.println((int)'b');
				// 98 98 98
			} // 특수기호 있는 abcCode 복호화 else문
			
			
			
			
		} // main 함수에서 넘겨받은 암호화된 문자열의 길이만큼 for문이 돈다
		System.out.println("복구된 코드 문자열은 " + originalStr + "입니다");// 복구된 코드 문자열은 abc123입니다
		
		return "";
	} // oricode 복호화 함수



} // main class
