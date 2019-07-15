package main;

import java.util.Scanner;

public class sortClass {
	// 클래스 멤버 변수 : 내부에서 접근 가능
	private int number[];
	private int updown;

	

	public void init() {
		updown = 0;
	}
	
	
	
	public void numberInput(){
		Scanner scan = new Scanner(System.in);
		
		System.out.print("몇번 입력받겠습니까? : ");
		int count = scan.nextInt(); // 정렬하고 싶은 숫자의 개수
		
		// 배열을 정렬할 숫자에 맞게 확보
		number = new int[count];
		
		// 숫자의 개수에 맞게 숫자들을 입력 받는다
		for (int i = 0; i < number.length; i++) {
			System.out.print( (i+1) + "번째 수 : ");
			number[i] = scan.nextInt();
		}
		
		// 올림/내림
		System.out.print("올림(1)/내림(2) : ");
		this.updown = scan.nextInt();
		
	} // numberInput 함수
	

	
	//sortingNumber
	public void sortingNumber() {
		for(int i = 0; i < number.length - 1; i++) {
			// i는 길이-1,  j는 i+1
			// 인데스 번호가 1 2 3 4 5 라면
			// i는 1 ~ 4 값을 j는 2 ~ 5 값 과 대조하기 때문이다
			
			if(updown == 1) { // updown이 올림(1) 이라면?
				for (int j = i + 1; j < number.length; j++) {
					if(number[i] > number[j]) { // 오름차순
						swap(i, j);
					}
				}
			}else if(updown == 2){ // updown이 내림(2) 이라면?
				for (int j = i + 1; j < number.length; j++) {
					if(number[i] < number[j]) { // 내림차순
						swap(i, j);
					}
				}
			} // if, else if
		} // for
		
	} // sorting 함수
	

	
	//swap
	//swap은 main에서 호출할 일이 없어서 private으로 할 때도 있다
	private void swap(int i, int j) {
		int temp;
		
		temp = number[i];
		number[i] = number[j];
		number[j] = temp;
	}

	
	
	//allPrint
	public void allPrint() {
		String ud = "";
		if(updown == 1) ud = "올림";
		else			ud = "내림";
		System.out.println("모두 출력, " + ud + "차순 정렬입니다");
		
		for(int i = 0; i < number.length; i++) {
			System.out.println("number[" + i + "] = " + number[i]);
		}
	} // allPrint 함수


	
}
