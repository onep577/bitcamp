package java02;

public class array2 {

	public static void main(String[] args) {
		// array2[][] -> array1[]
		int array2[][] = {
				{ 11, 12, 13, 14 },
				{ 21, 22, 23, 24 },
				{ 31, 32, 33, 34 },
		};
		
		int array1[];
		
		
		array1 = new int[array2.length * array2[0].length];
							//	3		*		4
		
		for (int i = 0; i < array2.length; i++) { // 3
			for (int j = 0; j < array2[i].length; j++) { // 4
				array1[array2[0].length * i + j] = array2[i][j];
             /*
		 		array2[0].length  *  i  +  j
		 		4*0+0 = 0	4*0+1 = 1	4*0+2 = 2	4*0+3 = 3
		 		4*1+0 = 4	4*1+1 = 5	4*1+2 = 6	4*1+3 = 7
		 		4*2+0 = 8	4*2+1 = 9	4*2+2 = 10	4*2+3 = 11
			 */
			}
		}
		
		for(int i = 0; i < array1.length; i++) {
			System.out.println("array1[" + i + "] = " + array1[i]);
		}
		


	}
}
