package wrapper;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	wrapper class
		 	일반 자료형(char, int, double)을 클래스화 한 것
		 	
		 	일반 자료형		wrapper class
		 	boolean		Boolean
		 	
		 	byte		Byte
		 	short		Short
		 	int			Integer --------
		 	long		Long
		 	
		 	float		Float
		 	double		Double ---------
		 	
		 	char		Character
		 	char[]		String ---------
		 	
		 	String
		 	숫자 ==> 문자열
		 	String.valueOf('1') -> "1"
		 	String.valueOf(12) -> "12"
		 	String.valueOf(12.345) -> "12.345"
		 	
		 	12 + "";
		 	12.345 + "";
		*/
		
		// Integer == int
		int i = 12;
		Integer iObj = 34;
		Integer _iObj = new Integer( i );
		System.out.println("_iObj = " + _iObj); // _iObj = 12
		
		int num = iObj.intValue();
		System.out.println("num = " + num); // num = 34
		
		int _num = iObj;
		System.out.println("_num = " + _num); // _num = 34
		
		
		// 숫자 -> 문자열	toString()
		String nstr = iObj.toString();	// 34 -> "34"
		nstr = iObj + "";
		
		
		// 문자열 -> 숫자	많이 사용
		String numStr = "234";
		// String numStr = "234a";
		// 쌍따옴표 안에는 전부다 숫자여야 한다
		// java.lang.NumberFormatException: For input string: "234a"
		int number = Integer.parseInt(numStr); // 아주 많이 사용
		System.out.println(number + 11); // 245
		
		// 실수
		Double d = 234.5678;
		Double d1 = new Double( 345.6789 );
		System.out.println("d1 = " + d1); // d1 = 345.6789 숫자이다
		double dd = d;
		
		// 실수 -> 문자열
		String sd = d.toString();
		sd = d + "";
		
		// 문자열 -> 실수
		String dStrNum = "56.78";
		double d2 = Double.parseDouble(dStrNum);
		
		System.out.println("d2 = " + (d2 + 11)); // d2 = 67.78
		
		
	}

}
