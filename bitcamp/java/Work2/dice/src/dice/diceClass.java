package dice;

import java.util.Scanner;

public class diceClass {
	private int r_num1;
	private int r_num2;
	private int u_plus;
	private int put;
	private int coin;
	
	
	public void init() {
		r_num1 = 0;
		r_num2 = 0;
		u_plus = 0;
		put = 0;
		coin = 20;
	}
	
	
	
	public void dice_Number() {
		 // 1 ~ 6 까지 중에서 랜덤으로 하나의 값을 받는다
		r_num1 = (int)(Math.random() * 6 + 1); // 1 ~ 6
		r_num2 = (int)(Math.random() * 6 + 1);
		System.out.println("주사위 합 : " + (r_num1 + r_num2));
	}
	
	
	
	public void user_Input() {
		Scanner scan = new Scanner(System.in);
		
		while(true) {
			System.out.print("배팅할 코인 수 : ");
			put = scan.nextInt();
			if(coin == 0 || coin < put) System.out.println("배팅할 수 없습니다");
			else break;
		}
		
		while(true) {
			System.out.println("=====================");
			System.out.println("2, 12 : 제시할 수 없음");
			System.out.println("3, 11 : 18배");
			System.out.println("4, 10 : 12배");
			System.out.println("5, 9 : 9배");
			System.out.println("6, 8 : 7배");
			System.out.println("7 : 6배");
			System.out.println("=====================");
			
			System.out.print("두 주사위의 합 : ");
			u_plus = scan.nextInt();
			
			if(u_plus == 3 || u_plus == 4 || u_plus == 5 || u_plus == 6 ||
					u_plus == 7 || u_plus == 8 || u_plus == 9 ||
							u_plus == 10 || u_plus == 11) {
				break;
			}
			else {
				System.out.println("3 ~ 11까지 정해주세요");
			}
		} // while문
	} // user_Input 함수
	
	

	public boolean process() {
		coin = coin - put;
		String strRes = "";
		int r_plus = r_num1 + r_num2;
		
		
		
		if(r_plus == u_plus){
			System.out.println("주사위 합을 맞췄습니다");
			if(r_plus == 3 || r_plus == 11) {
				strRes = coin + " + " + put + " * " + 18;
				coin = coin + put * 18;
			}
			else if(r_plus == 4 || r_plus == 10) {
				strRes = coin + " + " + put + " * " + 12;
				coin = coin + put * 12;
			}
			else if(r_plus == 5 || r_plus == 9) {
				strRes = coin + " + " + put + " * " + 9;
				coin = coin + put * 9;
			}
			else if(r_plus == 6 || r_plus == 8) {
				strRes = coin + " + " + put + " * " + 7;
				coin = coin + put * 7;
			}
			else if(r_plus == 7) {
				strRes = coin + " + " + put + " * " + 6;
				coin = coin + put * 6;
			}
		}
		
		
		else {
			System.out.println("주사위 합을 못 맞췄습니다");
			strRes = (coin+put) + " - " + put;
		}
		
		
		System.out.println("주사위 번호 : " + r_num1 + ", " + r_num2);
		System.out.println("현재까지 코인 : " + coin + " = " + strRes);

		
		if(coin == 0) {
			return false;
		}
		return true;
	} // process 함수
	
	
	
}
