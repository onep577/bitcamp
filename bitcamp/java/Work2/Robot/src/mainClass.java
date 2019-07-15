import sub.DanceRobot;
import sub.DrawRobot;
import sub.SingRobot;
import sup.Robot;

public class mainClass {
	/*
	 	실행결과
	 	춤을 춥니다
	 	노래를 합니다
	 	그림을 그립니다
	*/

	public static void main(String[] args) {
		Robot[] arr = { new DanceRobot(), new SingRobot(), new DrawRobot() };
		
		for (int i = 0; i < arr.length; i++) {
			arr[i].title();
			mainClass.action(arr[i]);
		}
		
	} // main 함수

	public void action(Robot arr) {
		
		if(arr instanceof DanceRobot ) {
			DanceRobot dr = (DanceRobot)arr;
			System.out.println(arr);
			dr.dance();
		}
		else if(arr instanceof SingRobot) {
			SingRobot sr = (SingRobot)arr;
			System.out.println(arr);
			sr.sing();
		}
		else if(arr instanceof DrawRobot) {
			DrawRobot dr = (DrawRobot)arr;
			System.out.println(arr);
			dr.draw();
		}
		
		
	} // action 메소드

} // main 클래스
