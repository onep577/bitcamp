package main;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
        		/* 몇개를 정렬할지 배열수를 유저에게 물어보고 각 수를 입력하라고 한다 */
		
		// 선언
		int array_num;
		int user_num[];
		int updown;
		

		// input
		//user -> 몇개를 정렬 하시겠습니까?
		System.out.print("몇개를 정렬 하시겠습니까? : ");
		Scanner scan = new Scanner(System.in);
		array_num = scan.nextInt();
		
		

		//배열확보
		user_num = new int[array_num];
		//>> 입력
		for (int i = 0; i < array_num; i++) {
			System.out.print((i + 1) + "번째 수를 입력해주세요 : ");
			user_num[i] = scan.nextInt();
		}
		 	
		
		 	
		//올림/내림
		System.out.println("올림(1)/내림(2)");
		System.out.print(">>");
		updown = scan.nextInt();
		
		

		// process
		//정렬처리 sorting
		int temp;
		for(int i = 0; i < user_num.length - 1; i++) {
			for (int j = i + 1; j < user_num.length; j++) {
				
				if(updown == 1) {
					if(user_num[i] > user_num[j]) { // 오름차순
						temp = user_num[i];		// swap
						user_num[i] = user_num[j];
						user_num[j] = temp;
					}
					
				}else {
					if(user_num[i] < user_num[j]) { // 내림차순
						temp = user_num[i];		// swap
						user_num[i] = user_num[j];
						user_num[j] = temp;
					}
				} // updown if문
				
				
			} // 두번째 for문
		} // 첫번째 for문
		
		
		
		// output
		//출력
		if(updown == 1) {
			System.out.println("오름차순으로 정렬하셨습니다");
		}else {
			System.out.println("내림차순으로 정렬하셨습니다");			
		}
		
		for(int i = 0; i < user_num.length; i++) {
			System.out.println("number[" + i + "] = " + user_num[i]);
		}
		


	}
}
