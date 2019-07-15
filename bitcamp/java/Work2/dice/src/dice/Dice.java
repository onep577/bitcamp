package dice;

public class Dice {
	// 숫자 1 ~ 6
	// random
	private int number;
	
	public void diceRandom() {
		number = (int)(Math.random() * 6) + 1;
	}
	
	public int getNumber() {
		return number;
	}

}
