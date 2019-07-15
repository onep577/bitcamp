package scanner;

import java.util.Scanner;

public class java04 {

	public static void main(String[] args) {
		
		// 과제4(java04)
		Scanner scan = new Scanner(System.in);
		
		String name,man,phone,address;
		int age;
		double height;
		
		System.out.print("name = ");
		name = scan.next();
		System.out.print("age = ");
		age = scan.nextInt();
		System.out.print("man = ");
		man = scan.next();
		System.out.print("phone = ");
		phone = scan.next();
		System.out.print("height = ");
		height = scan.nextDouble();
		System.out.print("address = ");
		address = scan.next();
		
		System.out.print("이름 = " + name + "\n나이 = " + age + "\n성별 = " + man + "\n전화번호 = " + phone + "\n키 = " + height + "\n주소 = " + address);

	}

}
