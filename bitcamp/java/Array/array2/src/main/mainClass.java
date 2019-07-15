package array2;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	배열
		 	array : 같은 자료형 변수 묶음
		 	관리 : index number	0 ~ n-1
		 	
		 	자료형 배열변수명[] = new 자료형[배열갯수];
		 	
		 	int arr[] = new int[5];
		 	int arr[] = { 1, 2, 3, 4, 5 };
		 	arr[0] = 11;

		 			3 4
		 	int arr2[][] = {
		 		{ 1, 2, 3, 4 },
		 		{ 5, 6, 7, 8 },
		 		{ 9, 10, 11, 12 }
		 	};
		 	
		 	int arr2[][] = new int[3][4];
		 	
		 	pointer == array
		 	
		 	int *p == int p[];
		 	int **p == int p[][];
		 	
		 	p[0][1] = 2;
		 	*(*(p + 0) + 1) = 2;
		*/
		
		int arr2[][] = {		// [행][열]	== [3][4]
				{ 1, 2, 3, 4 },
				{ 5, 6, 7, 8 },
				{ 9, 10, 11, 12 }
		};

		System.out.println(arr2[0][0]); // 1
		System.out.println(arr2[1][2]); // 7
		
		int array2[][] = new int[2][3];
		
		array2[0][0] = 11;
		array2[0][1] = 12;
		array2[0][2] = 13;
		
		array2[1][0] = 21;
		array2[1][1] = 22;
		array2[1][2] = 23;
		
		System.out.println("array2.length = " + array2.length);
		// array2.length = 2
		System.out.println("array2[0].length = " + array2[0].length);
		// array2[0].length = 3
		System.out.println("array2[1].length = " + array2[1].length);
		// array2[1].length = 3
		
		for (int i = 0; i < array2.length; i++) { // 2
			for (int j = 0; j < array2[0].length; j++) { // 3
				System.out.print("array2[" + i + "][" + j + "] = " + array2[i][j] + ", ");				
			}
			System.out.println();
		}
		/*
		 array2[0][0] = 11, array2[0][1] = 12, array2[0][2] = 13, 
		 array2[1][0] = 21, array2[1][1] = 22, array2[1][2] = 23, 
		*/
		
		
		
		int _arr2[][] = {		// [행][열]	== [3][6]
				{ 1, 2, 3, 4 },
				{ 5, 6, 7, 8, 9 },
				{ 9, 10, 11, 12, 13, 14 }
		};
		System.out.println(_arr2.length); // 3
		System.out.println(_arr2[0].length); // 4
		System.out.println(_arr2[1].length); // 5
		System.out.println(_arr2[2].length);// 6
		
		
		// 국어, 영어, 수학 점수를 입력 -> 출력 (학생5명)
		
		// 선언
		int student[][] = new int[5][3];
		String title[] = { "국어", "수학", "영어" };
		
		Scanner scan = new Scanner(System.in);
		
		for(int i = 0; i < student.length; i++) { // 5
			//System.out.print( (i + 1) + "번째 학생의 ");
			for(int j = 0; j < student[0].length; j++) { // 3
				System.out.print( (i + 1) + "번째 학생의 " + title[j] + "점수 : ");
				student[i][j] = scan.nextInt();
			}
		}
		
		for(int i = 0; i < student.length; i++) { // 5
			System.out.print( (i + 1) + "번째 학생의 ");
			for(int j = 0; j < student[0].length; j++) { // 3
				System.out.print(title[j] + ": " + student[i][j]);
			}
			System.out.println();
		}
		
		
		
		

	}

}
