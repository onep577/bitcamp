import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		// 5명 학생의 성적을 출력하는 프로그램
		String student[][] = new String[5][5];
		String title[] = { "학생번호", "학생이름", "국어점수", "영어점수", "수학점수", "총점", "평균"};
		int sum[];
		double avg[] = new double[5];
		String subject[] = new String[3];
		
		/*
		 	00			01		02		03		04
		 	10			11		12		13		14
		 	20			21		22		23		24
		 	30			31		32		33		34
		 	40			41		42		43		44
		 	
		 	classNum	name	kor		eng		math	sum		avg	
		 	
		 	1000		홍길동	87		100		57
		 	1001		임꺽정	59		92		68
		 	1002		둘리		64		78		91
		 	1003		또치		99		97		81
		 	1004		도우너	70		47		30
		 	
		 	one

		 	// 5 5	5 7
		*/
		input(student);
		sum = sum(student);
		avg = avg(sum);
		numberOne(subject, student);
		allPrint(student, sum, avg, subject, title);
	}
	
	
	
	static void input(String student[][]) { // 5명의 학생을 입력
		Scanner scan = new Scanner(System.in);
		String kor = null;
		String eng = null;
		String math = null;
		
		
		for(int i = 0; i < student[0].length; i++) { // 5
			// 구분번호
			student[i][0] = "" + 100 + i;
			
			// 이름
			System.out.print( (i+1) + "번째 학생의 이름 : ");
			student[i][1] = scan.next();
			
			// 국어
			System.out.print(student[i][1] + " 학생의 국어점수 : ");
			kor = scan.next();
			student[i][2] = kor;
			
			// 엉어
			System.out.print(student[i][1] + " 학생의 영어점수 : ");
			eng = scan.next();
			student[i][3] = eng;
			
			// 수학 - 점수 입력 받는다
			System.out.print(student[i][1] + " 학생의 수학점수 : ");
			math = scan.next();
			student[i][4] = math;
		}
		
	} // input 함수
	
	
	
	static int[] sum(String student[][]) { // 국어, 영어, 수학의 총점을 리턴
		int sum[] = new int[5];

		for(int i = 0; i < student.length; i++) { // 5
			for(int j = 2; j < student[1].length; j++) { // 3
				sum[i] = sum[i] + Integer.parseInt(student[i][j+2]);
			}
		}
		
		return sum;
		
		/*
		 	// 검색
		 		int findIndex = -1;
		 		for(int i = 0; i < ){
		 			d
		 		}
		 	// 합계
		 	 	for(int i = 2; i < student[0].length; i++){
		 	 		sum + sum + Integer.parseInt()
		 	 	}
		*/
	} // sum 함수
	
	
	
	static double[] avg(int sum[]) { // 평균
		double avg[] = new double[5];
		
		for (int i = 0; i < avg.length; i++) {
			avg[i] = (double)sum[i] / 3;
		}
		return avg;
	} // avg 함수
	
	
	
	static void numberOne(/* 과목번호와 배열 */String subject[], String student[][]) { // max 인용

		for (int i = 0; i < subject.length; i++) { // 3

			int max = Integer.parseInt(student[0][i+2]);

			for (int j = 0; j < student[0].length; j++) { // 5
				if (max <= Integer.parseInt(student[j][i+2])) {
					max = Integer.parseInt(student[j][i+2]);
					subject[i] = student[j][1];
				}
			
			} // for j

		} // for i

	} // numberOne 함수
	
	
	
// 	classNum	name	kor		eng		math	sum		avg		one
// 	
// 	1000		홍길동	87		100		57
// 	1001		임꺽정	59		92		68
// 	1002		둘리		64		78		91
// 	1003		또치		99		97		81
// 	1004		도우너	70		47		30
	
	
	static void allPrint(String student[][], int sum[], double avg[], 
			String subject[], String title[]) { // 학생의 번호, 이름, 점수 전부 다 출력

		System.out.println("============================================================");
		for (int i = 0; i < title.length; i++) { // 7
			System.out.print(title[i] + "\t");
		}
		System.out.println();
		System.out.println("------------------------------------------------------------");
		for(int i = 0; i < student.length; i++) {
			for(int j = 0; j < student.length; j++) { // 5
				System.out.print(student[i][j] + "\t"); // 5 5
			}
			System.out.print(sum[i] + "\t");
			System.out.println(avg[i] + "\t");

		}
		System.out.print("\t");
		for(int x = 0; x < subject.length; x++) { // 3
			System.out.print("\t" + subject[x]);
		}
		System.out.println();
		System.out.println("============================================================");
	
	} // allPrint 함수

} // main class

// 192.168.0.66
// 실행 -> 역슬러시 두번 아이피 주소
// 
