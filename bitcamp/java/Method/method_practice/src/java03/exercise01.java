package java03;

public class exercise01 {
	// 두 점 (x, y)와 (x1, y1)간의 거리를 구한다

	public static void main(String[] args) {
		int x, y, x1, y1;
		x = 1;
		y = 1;
		x1 = 2;
		y1 = 2;
		
		
		double dd = getDistance(x,y,x1,y1);
		System.out.println("두 점의 거리 : " + dd);

	}
	
	// 루트 ( (y1-y)제곱 + (x1-x)제곱 )
	// math 함수에 루트와 제곱승이 있다
	static double getDistance(int x, int y, int x1, int y1) {
		double value = Math.pow((x1-x), 2) + Math.pow((y1-y), 2);
		System.out.println(value);

		value = Math.sqrt(value);
		// sqrt 는 무거운 함수 하나는 괜찮지만 100개 200개 쓰면 굉장히 무거워진다
		// root == 0.5승, 1/2승
		
		return value;
	}
}
