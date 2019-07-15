package operator;

public class mainClass {

	public static void main(String[] args) {
		
		/*
		  operator (기본연산자) = + - * %
		  
		  operator (고급연산자) bit연산 : & | ^ << >> ~
		  
		  operator (논리연산자) &&(AND) ||(OR) !(NOT)
		*/
		
		int num1, num2;
		int result;
		
		num1 = 17;
		num2 = 3;
		
		result = num1 + num2;
		//num1 + num2 = result 오른쪽이 왼쪽으로 쏙~ 이건 에러
		System.out.println(num1 + " + " + num2 + " = " + result);
		
		result = num1 - num2;		
		System.out.println(num1 + " - " + num2 + " = " + result);
		
		result = num1 * num2;		
		System.out.println(num1 + " * " + num2 + " = " + result);
		
		result = num1 / num2;		
		System.out.println(num1 + " / " + num2 + " = " + result);
		
		// a % b -> a를 b로 나눈 나머지
		result = num1 % num2;		
		System.out.println(num1 + " % " + num2 + " = " + result);
		
		
		
		// Random == 무작위
		double num;
		num = Math.random();
		System.out.println("num = " + num);
		int r;
		r = (int)(Math.random() * 10); // 0 ~ 9
		System.out.println("r = " + r);
		
		int inputNumber = 27 % 5 + 1; // 5의 나머지는 0 ~ 4에서 +1 은 1 ~ 5
		System.out.println("inputNumber = " + inputNumber);
		// 5개 필요하면 %5
		
		// 1 ~ 10을 받고싶다 * 10
		r = (int)(Math.random() * 10) + 1;
		// 0 ~ 9 + 1
		System.out.println("r = " + r);
		
		// 10 20 30 40 50
		r = ((int)(Math.random() * 5) + 1) * 10;
		// 0 1 2 3 4 + 1 * 10
		System.out.println("r = " + r);
		
		// 10 20 30 40 50 60 70
		r = ((int)(Math.random() * 7) + 1) * 10;
		// 0 1 2 3 4 5 6 + 1 * 10
		System.out.println("r = " + r);
		
		// -1 0 1 후진 제자리 전진
		// int x = (int)(Math.random() * 3) - 1;
		// int y = (int)(Math.random() * 3) - 1;
		
		// 주의할 점 !!
		r = 0 / 3;
		System.out.println("0 나누기 3, r = " + r);
		// %도 /도 분모가 0이면 에러! 3 나누기 0이면 0이지만 컴퓨터는 계산을 못 한다 사람이 막아주어야 한다 (제어문 때 사용)
		//r = 3 / 0;
		//System.out.println("r = " + r);
		//r = 3 % 0;
		//System.out.println("r = " + r);
		
		
		// 자기 자신을 갱신
		int n;
		n = 0;
		
		n = n + 1;
		System.out.println("n = " + n);
		
		n = n - 1;
		System.out.println("n = " + n);
		
		n += 1;
		System.out.println("n = " + n);
		
		
		// increment(증가연산자) ++ == +1, decrement(감소연산자) -- == -1
		int num3 = 0;
		num3++;
		System.out.println("num3 = " + num3);
		++num3;
		System.out.println("num3 = " + num3);
		
		num3--;
		System.out.println("num3 = " + num3);
		
		int num4;
		
		num4 = num3++;	// num3 = 2 num4 = 1
		System.out.println("num3 = " + num3);
		System.out.println("num4 = " + num4);
		num4 = ++num3;	// num3 = 3 num4 = 4
		System.out.println("num3 = " + num3);
		System.out.println("num4 = " + num4);
		num4 = (num3++); // num3 = 4 num4 = 3
		System.out.println("num3 = " + num3);
		System.out.println("num4 = " + num4);
		
		
		
		
		

	}

}
