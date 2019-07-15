package scanner;

public class java03 {

	public static void main(String[] args) {
		//190514_과제3(java04)
		String name1,name2,name3;
		name1 = "홍길동";
		name2 = "일지매";
		name3 = "장옥정";
		
		int age1,age2,age3;
		age1 = 20;
		age2 = 18;
		age3 = 14;
		
		boolean man1,man2;
		man1 = true;
		man2 = false;
		
		String phone1,phone2,phone3;
		phone1 = "010-111-2222";
		phone2 = "02-123-4567";
		phone3 = "02-345-7890";
		
		double height1,height2,height3;
		height1 = 175.12;
		height2 = 180.01;
		height3 = 155.78;
		
		String address1,address2,address3;
		address1 = "경기도";
		address2 = "서울";
		address3 = "부산";
		
		System.out.println("=========================================================");
		System.out.println("\\ name\tage\tman\tphone\t\theight\taddress \\");
		System.out.println("=========================================================");
		System.out.println("\\\"" + name1 + "\"\t" + age1 + "\t" + man1 + "\t" + phone1 + "\t" + height1 + "\t\"" + address1 + "\"\t\\");
		System.out.println("\\\"" + name2 + "\"\t" + age2 + "\t" + man1 + "\t" + phone2 + "\t" + height2 + "\t\"" + address2 + "\"\t\\");
		System.out.println("\\\"" + name3 + "\"\t" + age3 + "\t" + man2 + "\t" + phone3 + "\t" + height3 + "\t\"" + address3 + "\"\t\\");
		System.out.println("=========================================================");

	}

}
