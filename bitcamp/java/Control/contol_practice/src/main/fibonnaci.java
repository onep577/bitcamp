package java02;

public class fibonnaci {

	public static void main(String[] args) {
		// fibonnaci 수열 피보나치 수열 -> 30회까지
		// 0 1로 시작       
		// 0 1 1 2 3 5 8 13 21 34 55
		
		int arr_num[] = new int[30];
		int a, b, c, w;
		
		a = 0;
		b = 1;
		
		arr_num[0] = a;
		arr_num[1] = b;
		
		w = 0;
		while(w < 28) {
			
			c = a + b;	// c는 배열에 담는 수, 직전 수 + 총합 수
			arr_num[w + 2] = c;

			//System.out.println("a = " + a);
			//System.out.println("b = " + b);
			//System.out.println("c = " + c);
			
			a = b;		// a는 직전 수가 될 수, a에 b라는 직전 수를 넣는다
			b = c;		// b는 총합 수가 될 수, b에 c라는 총합 수를 넣는다
			
			w++;
		}
		
		for(int i = 0; i < arr_num.length; i++) {
			System.out.println("arr_num[" + i + "] = " + arr_num[i]);
		}
		
		
		
	}
}