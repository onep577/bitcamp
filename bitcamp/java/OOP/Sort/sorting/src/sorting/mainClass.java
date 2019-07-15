package sorting;

import java.util.Scanner;

public class mainClass {

	public static void main(String[] args) {
		int numArr[];	// 정렬을 할 숫자의 배열
		int updown[] = new int[1];	// 올림(1)/내림(2)
		
		//numArr[] = numberInput(updown); // 에러난다
		numArr = numberInput(updown);
		// 동적할당이 메인에 없고 지역함수에 있으면 제대로 넘어오지 않는다
		
		
		
		//numArr = numberInput(updown);
		//System.out.println(numArr);
		//[I@7d4991ad
		//System.out.println(numberInput(updown)); // 리턴값이 numArr배열인데 왜 주소가 다르지?
		//[I@28d93b30
		//System.out.println("--" + updown);
		//--[I@1b6d3586
		//for (int i = 0; i < numArr.length; i++) {
		//	System.out.print(numArr[i]);
		//}
		// updown adress 할당
		// 리턴받는 건 첫번째 함수뿐
		// numberInput (인수로 올림/내림 을 넘겨받고 리턴값으로 배열 넘겨받는다)
			// 몇개의 숫자를 입력받을 것인가? 
			// 개수만큼 숫자들 입력
			// 올림/내림
		
		
		
		sorting(numArr, updown[0]); // updown[0] value할당 하나의 값을 넘긴다
		// sorting(인수로 배열 넘겨받고 올림/내림을 세팅만)
			// swap
		
		
		
		result(numArr, updown[0]);
		// result(인수로 배열 넘겨받고 출력으로 올림/내림 출력)
	} // main 함수
	
	
	static int[] numberInput(int updown[]) {
		Scanner scan = new Scanner(System.in);
		int count;		// 정렬하고 싶은 숫자의 개수
		int numArr[];	// main에서 numArr 배열과 같은 배열인 이유는?
						// numArr 배열을 리턴하기 때문에 매개변수에 numArr이 없어도 된다
		
		System.out.print("몇번 입력받겠습니까? : ");
		count = scan.nextInt();
		
		// 배열을 정렬할 숫자에 맞게 확보
		numArr = new int[count];
		
		//System.out.println("input" + numArr);
		//input[I@7d4991ad
		//input[I@28d93b30
		
		// 숫자의 개수에 맞게 숫자들을 입력 받는다
		for (int i = 0; i < numArr.length; i++) {
			System.out.print( (i+1) + "번째 수 : ");
			numArr[i] = scan.nextInt();
		}
		
		// 올림/내림
		System.out.print("올림(1)/내림(2) : ");
		updown[0] = scan.nextInt();
		
		return numArr;
	} // numberInput 함수
	
	
	// numberInput, sorting 두 함수에서 매개변수 updown를 int와 int[]로 다르게 받은 이유는?
	// numberInput 함수에서는 값을 변경 시키기 위해 배열로 받았고
	// sorting 함수에서는 값을 변경시키지 않고 여기 함수에서 쓰기만 하니까 배열로 안 받고 값만 받았다
	static void sorting(int numArr[], int updown) {
		for(int i = 0; i < numArr.length - 1; i++) {
			// i는 길이-1,  j는 i+1
			// 인데스 번호가 1 2 3 4 5 라면
			// i는 1 ~ 4 값을 j는 2 ~ 5 값 과 대조하기 때문이다
			
			if(updown == 1) { // updown이 올림(1) 이라면?
				for (int j = i + 1; j < numArr.length; j++) {
					if(numArr[i] > numArr[j]) { // 오름차순
						swap(numArr, i, j);
					}
				}
			}else if(updown == 2){ // updown이 내림(2) 이라면?
				for (int j = i + 1; j < numArr.length; j++) {
					if(numArr[i] < numArr[j]) { // 내림차순
						swap(numArr, i, j);
					}
				}
			} // if, else if
			
		} // for
		
	} // sorting 함수
	
	
	// swap
	static void swap(int numArr[], int i, int j) {
		int temp;
		
		temp = numArr[i];
		numArr[i] = numArr[j];
		numArr[j] = temp;
	}
	
	
	static void result(int numArr[], int updown) {
		String ud = "";
		if(updown == 1) ud = "올림";
		else			ud = "내림";
		System.out.println(ud + "차순 정렬입니다");
		
		for(int i = 0; i < numArr.length; i++) {
			System.out.println("numArr[" + i + "] = " + numArr[i]);
		}
	} // result 함수
	

}
