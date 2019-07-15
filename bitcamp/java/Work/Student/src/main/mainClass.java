package main;

import java.util.Scanner;
import dao.StudentDao;
import file.FileClass;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	student : ArrayList, LinkedList
		 	
		 	baseballMember : ArrayList, HashMap
		 		타율순 : 내림차순 sort
		 		같은 타율일때? 일단 충돌 안나게끔 하자
		 		
		*/
		Scanner scan = new Scanner(System.in);
		FileClass fc = new FileClass();
		fc.dataLoad();
		StudentDao sDao = new StudentDao();
		
		while(true) {
			System.out.println("1. 학생 정보 추가");
			System.out.println("2. 학생 정보 삭제");
			System.out.println("3. 학생 정보 검색");
			System.out.println("4. 학생 정보 수정");
			System.out.println("5. 학생 정보 모두 출력");
			System.out.println("6. 학생 정보 저장");
			System.out.println("7. 프로그램 종료");
			System.out.print("입력하세요 : ");
			int n = scan.nextInt();
			
			switch(n) {
				case 1:
					sDao.insert();
					break;
				case 2:
					sDao.delete();
					break;
				case 3:
					sDao.select();
					break;
				case 4:
					sDao.update();
					break;
				case 5:
					sDao.allPrint();
					break;
				case 6:
					fc.dataSave();
					break;
				case 7:
					System.exit(0);
					break;
			}
			if(n == 7) break;
		} // while
		
		System.out.println("프로그램 종료");
		
	} // main 함수

}
