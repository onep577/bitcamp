package cast;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	우선순위
		 	boolean
		 	
		 	byte		1 byte
		 	short char	2 byte
		 	int			4 byte
		 	long		8 byte
		 	
		 	float		4 byte
		 	double		8 byte
		 	
		 	자동 자료형 변환, 강제 자료형 (cast)변환 중요!
		*/
		
		short sh = 1;
		int i;
		
		i = sh;		// 자동 자료형 변환 4byte에 2byte가 들어간다
		System.out.println("i = " + i); // i = 1 출력
		
		i = 25;
		sh = (short)i; // cast 변환, 이렇게 쓰지 않도록 하자
		System.out.println("sh = " + sh); // sh = 25 출력
		
		long l = 123123123123123L;
		float f;
		
		f = l; // 자동 자료형 변환 4byte에 8byte가 들어간다
		System.out.println("f = " + f); // f = 1.23123123E14 출력
		
		double d; // float 4byte double 8byte
		
		d = l;
		System.out.println("d = " + d); // d = 1.23123123123123E14 출력
		
		f = (float)d; // cast 변환 = 강제 자료형 변환, 더 큰 것을 작은 것으로 변환시킬 때 사용 할 수 있다
		
		double r;
		r = (int)(Math.random() * 10); // 랜덤값은 시간(system time)에서 얻어온다 *10을 나중에 하면 0만 나온다
		System.out.println("r = " + r);

		// 0.123e2 -> 0.123 * 10 * 10
		double dnum;
		dnum = 0.123e2; // 12.3 출력
		//double dnum = 0.123e3; // 123.0 출력
		//dnum = 0.123e1; // 1.23 출력
		System.out.println("dnum = " + dnum);

		dnum = 0.123e-2; // 마이너스 2승, 0.00123 출력
		System.out.println("dnum = " + dnum);
		
		int n1 = 3; // int 4byte float 4byte
		int n2 = 2;
		
		float f1;
		
		f1 = n1 / n2;
		System.out.println("f1 = " + f1); // 1.0 출력, n1 / n2에서 계산 끝 1.0이 f1으로 자동 형변환
		f1 = (float)n1 / n2;
		System.out.println("f1 = " + f1); // 1.5 출력, 소수점 얻고 싶을 때 강제 형변환 사용
		

	}

}
