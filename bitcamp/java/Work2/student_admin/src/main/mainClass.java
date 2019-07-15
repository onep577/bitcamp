package main;

import java.util.Scanner;

import dao.DaoClass;

public class mainClass {

	public static void main(String[] args) {
		// menu = front end
		
		DaoClass dao = new DaoClass();
		Scanner scan = new Scanner(System.in);
		
		// menu
		/*
		 	1. 학생정보 추가 (1명)
		 	2. 학생정보 삭제 (1명) 0 ""
		 	3. 학생정보를 검색 (1명)
		 	4. 학생정보를 수정 (1명)
		 	5. 학생정보를 모두 출력 (n명)
		*/
		
		
		while(true) {
			System.out.println("1. 학생정보 추가");
			System.out.println("2. 학생정보 삭제");
			System.out.println("3. 학생정보 검색");
			System.out.println("4. 학생정보 수정");
			System.out.println("5. 학생정보 모두 출력");
			System.out.print("입력하세요 : ");
			String number = scan.next();
			
			switch(number) {
				case "1":
					dao.insert();
					break;
				case "2":
					dao.delete();
					break;
				case "3":
					dao.select();
					break;
				case "4":
					dao.update();
					break;
				case "5":
					dao.allPrint();
					break;
				default :
					System.out.println("1 ~ 5 까지 입력해주세요");
			}
			System.out.print("끝내겠습니까? (y/n) : ");
			String str = scan.next();
			if(str.equals("y")) break;
		} // while
		System.out.println("프로그램 끝");
		

	} // main 함수

}
