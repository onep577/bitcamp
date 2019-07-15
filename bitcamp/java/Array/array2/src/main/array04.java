package java02;

public class array04 {

	public static void main(String[] args) {
	
		
		
		// a b c
		char[] abcCode ={	// 26개
				'`','~','!','@','#','$','%','^','&','*',
				'(',')','-','_','+','=','|','[',']','{',
				'}',';',':',',','.','/'
		};
		// 10개			// 0 1 2 3 4 5 6 7 8 9
		char[] numCode = {'q','w','e','r','t','y','u','i','o','p'};
		
		String src = "abc123";
		String result = "";		// `~!wer
		
		for(int i = 0; i < src.length();i++) {
			char ch = src.charAt(i);	// src의 문자를 하나씩 가져와서 ch 변수에 하나씩 넣는다
			// charAt은 문자를 가져온다
			System.out.println("ch = " + ch); // a b c 1 2 3
			
			int num = (int)ch;	// 아스키 코드를 취득
			System.out.println("num = " + num); // 97 98 99 49 50 51
			
			// 알파벳일 경우 -> 숫자
			if(num >= 97 && num <= 122) {	// 알파벳의 아스키 코드가 97 ~ 122 까지이다
				num = num - 97;	// 'a' == 0으로 셋팅하기 위해서	
				// num은 abcCode의 index 번호가 되서 특수기호를 알 수 있다
				result = result + abcCode[num];
			}
			// 알파벳이 아닐 경우 -> 영문자
			else {							// 숫자의 아스키 코드가 48 ~ 57
				num = num - 48;	// '0' == 0으로 셋팅하기 위해서
				// num은 numCode의 index 번호가 되서 영문자를 알 수 있다
				result = result + numCode[num];
			}
		}	
		
		System.out.println(src + " 의 암호화는 " + result + " 입니다");
		// abc123 의 암호화는 `~!wer
		

	}
}
