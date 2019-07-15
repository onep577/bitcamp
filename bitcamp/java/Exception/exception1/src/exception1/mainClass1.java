package exception1;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class mainClass1 {

	public static void main(String[] args) {
		// NullPointerException => new를 안해줘서 발생
		
		String str = null;
		
		try {
			System.out.println(str.length());
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		System.out.println("프로그램 실행중...");
		/*
		 	java.lang.NullPointerException
					at exception1.mainClass1.main(mainClass1.java:15)
			프로그램 실행중...
		*/
		// 이렇게 출력된다 익셉션은 에러가 나서 멈추는 게 아니라 경고가 나오고 계속 실행된다
		
		
		
		// ArrayIndexOutOfBoundsException
		// 많이 하는 실수
		int arr[] = { 1, 2, 3 };
		
		try {
			System.out.println(arr[3]);
		}catch(ArrayIndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		/* java.lang.NullPointerException
					at exception1.mainClass1.main(mainClass1.java:15)
			프로그램 실행중...
			java.lang.ArrayIndexOutOfBoundsException: 3
					at exception1.mainClass1.main(mainClass1.java:31)
		*/
		
		
		
		// FileNotFoundException
		File file = new File("c:\\xxxxx");
		FileInputStream is;
		
		try {
			is = new FileInputStream(file);
		}catch(FileNotFoundException e) {
			e.printStackTrace();
		}
		/*
		 	java.lang.NullPointerException
					at exception1.mainClass1.main(mainClass1.java:15)
			프로그램 실행중...
			java.lang.ArrayIndexOutOfBoundsException: 3
					at exception1.mainClass1.main(mainClass1.java:31)
			java.io.FileNotFoundException: c:\xxxxx (지정된 파일을 찾을 수 없습니다)
					at java.io.FileInputStream.open0(Native Method)
					at java.io.FileInputStream.open(Unknown Source)
					at java.io.FileInputStream.<init>(Unknown Source)
					at exception1.mainClass1.main(mainClass1.java:48)
		*/
		
		
		
		// StringIndexOutOfBoundsException
		String str1 = "java";
		
		try {
			System.out.println(str1.charAt(4));
		}catch(StringIndexOutOfBoundsException e) {
			e.printStackTrace();
		}
		/*
		 	java.lang.NullPointerException
					at exception1.mainClass1.main(mainClass1.java:15)
			프로그램 실행중...
			java.lang.ArrayIndexOutOfBoundsException: 3
					at exception1.mainClass1.main(mainClass1.java:31)
			java.io.FileNotFoundException: c:\xxxxx (지정된 파일을 찾을 수 없습니다)
					at java.io.FileInputStream.open0(Native Method)
					at java.io.FileInputStream.open(Unknown Source)
					at java.io.FileInputStream.<init>(Unknown Source)
					at exception1.mainClass1.main(mainClass1.java:48)
			java.lang.StringIndexOutOfBoundsException: String index out of range: 4
					at java.lang.String.charAt(Unknown Source)
					at exception1.mainClass1.main(mainClass1.java:71)
		*/
		
		
		
		// NumberFormatException		1 -> 'a'
		int i;
		
		try {
			i = Integer.parseInt("11a2");
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		/*
		 	java.lang.NullPointerException
					at exception1.mainClass1.main(mainClass1.java:15)
			프로그램 실행중...
			java.lang.ArrayIndexOutOfBoundsException: 3
					at exception1.mainClass1.main(mainClass1.java:31)
			java.io.FileNotFoundException: c:\xxxxx (지정된 파일을 찾을 수 없습니다)
					at java.io.FileInputStream.open0(Native Method)
					at java.io.FileInputStream.open(Unknown Source)
					at java.io.FileInputStream.<init>(Unknown Source)
					at exception1.mainClass1.main(mainClass1.java:48)
			java.lang.StringIndexOutOfBoundsException: String index out of range: 4
					at java.lang.String.charAt(Unknown Source)
					at exception1.mainClass1.main(mainClass1.java:71)
			java.lang.NumberFormatException: For input string: "11a2"
					at java.lang.NumberFormatException.forInputString(Unknown Source)
					at java.lang.Integer.parseInt(Unknown Source)
					at java.lang.Integer.parseInt(Unknown Source)
					at exception1.mainClass1.main(mainClass1.java:97)

		*/
		
		
	} // main 함수

}
