package bit;

public class java14 {

	public static void main(String[] args) {		
		int r1 = (int)(Math.random() * 100); // 0 ~ 99
		System.out.println(r1);
		
		int r2 = (int)((Math.random() * 5) + 11); // 11 ~ 15
		System.out.println(r2);
		
		int[] array = {3, 7, 9, 13, 15};
		int r3 = (int)(Math.random() * 5); // 0 ~ 4
		System.out.println(array[r3]);

	}

}
