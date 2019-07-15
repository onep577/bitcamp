package game;

import java.util.Scanner;

import dice.Dice;

public class gamePlay {
	private int coin = 20;
	private int batting;
	private int inputNumber;
	
	Dice dice1 = new Dice();
	Dice dice2 = new Dice();
	// dice1, dice2 는 멤버변수이다
	
	
	public void init() {
		dice1.diceRandom();
		dice2.diceRandom();
		
		System.out.println("dice1 : " + dice1.getNumber());
		System.out.println("dice2 : " + dice2.getNumber());
	} // init 함수
	
	

	public void input() {
		Scanner sc = new Scanner(System.in);
		
		// batting
		System.out.println("배팅할 코인 : ");
		batting = sc.nextInt();
		
		coin = coin - batting;
		
		// dice number
		while(true) {
			System.out.println("두개 주사위의 합");
			inputNumber = sc.nextInt();
			if(inputNumber > 2 && inputNumber < 12 
					&& inputNumber != 2 && inputNumber != 12) {
				break;
			}
			System.out.println("잘 못 입력하셨습니다. 다시 입력해 주십시오");
		} // while
		
	} // input 함수
	
	
	
	public void finding() {
		int dNum1 = dice1.getNumber();
		int dNum2 = dice2.getNumber();
		
		int sum = dNum1 + dNum2;
		
		if(inputNumber == sum) {
			if(sum == 3 || sum == 11) {
				batting = batting * 18;
			}else if(sum == 4 || sum == 10) {
				batting = batting * 12;
			}else if(sum == 5 || sum == 9) {
				batting = batting * 9;
			}else if(sum == 6 || sum == 8) {
				batting = batting * 7;
			}else if(sum == 7) {
				batting = batting * 6;
			}
			System.out.println("축하합니다");
			coin = coin + batting;
		}
		else {
			System.out.println("아쉽습니다. 다음 기회에...");
		}
		
	} // finding 함수
	
	
	
	public void resultPrint() {
		System.out.println("주사위 1 : " + dice1.getNumber());
		System.out.println("주사위 2 : " + dice2.getNumber());

		System.out.println("합계 : " + (dice1.getNumber() + dice2.getNumber()));
		System.out.println("coin : " + coin);
	} // resultPrint 함수





}
