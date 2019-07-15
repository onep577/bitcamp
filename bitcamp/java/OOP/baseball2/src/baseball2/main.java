package baseball2;

public class main {

	public static void main(String[] args) {
		baseball2Class bbcls = new baseball2Class();
		
		// 초기화
		bbcls.init();
		
		// random으로 3개 출력
		//bbcls.randomNumber();
		// 초기화에서 랜덤 호출해도 된다

		// 서로 대조
		bbcls.loop();

		// 결과 메시지 출력
		bbcls.result();
		
		// 다시 한번 더 하시겠습니까? 여기서 만들어 준다
		
		final int number = 1;	// 변수 -> 상수
		// 상수란? 변경할 수 없는 수
		//number = 2;
		// 에러코드 : The final local variable number cannot be assigned.
		// It must be blank and not using a compound assignment
		int num;
		num = number;
	}

}
