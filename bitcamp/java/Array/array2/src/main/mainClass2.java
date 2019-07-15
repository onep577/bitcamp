package array1;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	Array(배열) : 같은 자료형 변수의 묶음 (변수의 확장판) 굉장히 중요!
		 	
		 	배열과 변수는 같은 목적 - 관리의 목적
		 	
		 	int num1, ... num10
		 	
		 	자료형 배열변수[] = new 자료형[배열갯수];
		 	자료형 []배열변수 = new 자료형[배열갯수];
		 	자료형[] 배열변수 = new 자료형[배열갯수];
		 	
		 	배열변수[0] = 자료형 데이터
		 	배열변수[1] = 자료형 데이터
		 			:
		 	배열변수[배열갯수 - 1] = 자료형 데이터
		 	
		 	배열변수[index번호]
		*/
		
		
		// int Array[] = new int[10]; // [0] ~ [9]
		int[] Array = new int[10];
		// int []Array = new int[10];
		
		Array[0] = 10; // 변수명은 같으니 구분자는 인덱스 명이다
		Array[1] = 11;
		Array[2] = Array[1]; // 11
		Array[3] = 13;
		Array[4] = 14;
		Array[5] = 15;
		Array[6] = 16;
		Array[7] = 17;
		Array[8] = 18;
		Array[9] = 19;
		
		System.out.println("Array[0] = " + Array[0]); // Array[0] = 10
		System.out.println("Array[9] = " + Array[9]); // Array[9] = 19
		
		char cArray[]; // 배열변수
		cArray = new char[5]; // 할당
		cArray[0] = '안';
		cArray[1] = '녕';
		cArray[2] = '하';
		cArray[3] = '세';
		cArray[4] = '요';
		// cArray[5] = '아'; // Exception(예외) 에러
		// Exception in thread "main" java.lang.ArrayIndexOutOfBoundsException: 5
		
		
		String sArray[] = {"hello", "hi", "good"}; // 배열 초기화 가능
		// 동적할당이 자동으로 되었다    0       1      2
		
		System.out.println("sArray[2] = " + sArray[2]); // sArray[2] = good 출력
		
		String sArr[]; //initialize(초기화) - init 초기화는 선언할때만 가능하다

        // 두 줄 다 에러난다 
		// sArr = {"hello", "hi", "good"}; 
		// sArr[] = {"hello", "hi", "good"};
		sArr = new String[]{"hello", "hi", "good"}; // 에러 안난다
		
		
		
		
		// Array Length(길이)
		System.out.println("배열 길이 : " + Array.length); // 배열 길이 : 10 출력
		System.out.println("배열 길이 : " + cArray.length); // 배열 길이 : 5 출력
		System.out.println("배열 길이 : " + sArray.length); // 배열 길이 : 3 출력
		
		
		
		// 배열 복제
		String aliasArray[] = sArray; // aliasArray와 sArray가 같아진다
		System.out.println("aliasArray[0] = " + aliasArray[0]); // aliasArray[0] = hello 출력
		
		aliasArray[1] = "안녕"; // aliasArray만 바뀌는 게 아니라 원본 데이터도 바뀐다
		System.out.println("sArray[1] = " + sArray[1]); // sArray[1] = 안녕 출력
		
		
		int number1[] = {11, 12, 13};
		int number2[] = {21, 22, 23};
		
		int num1[] = number1; // num1과 number1이 같아진다
		int num2[] = number2; // num2과 number2이 같아진다
		
		System.out.println("num1 : " + num1[0] + " " + num1[1] + " " + num1[2]);
		// num1 : 11 12 13 출력
		System.out.println("num2 : " + num2[0] + " " + num2[1] + " " + num2[2]);
		// num2 : 21 22 23 출력
		
		int temp[];
		temp = num1;
		num1 = num2;
		num2 = temp;
		
		System.out.println("num1 : " + num1[0] + " " + num1[1] + " " + num1[2]);
		// num1 : 21 22 23 출력
		System.out.println("num2 : " + num2[0] + " " + num2[1] + " " + num2[2]);
		// num2 : 11 12 13 출력
		
		/*
		int temp;
		temp = number1[0];
		number1[0] = number2[0];
		number2[0] = temp;
		*/
	}

}
