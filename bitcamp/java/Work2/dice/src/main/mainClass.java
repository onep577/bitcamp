package main;

import game.gamePlay;

public class mainClass {

	public static void main(String[] args) {
		gamePlay play = new gamePlay();
		
		while(true) {
			play.init();
			play.input();
			play.finding();
			play.resultPrint();
		} // while
		
	}

}
