package exercise1;

import student.Student;

public class mainClass {

	public static void main(String[] args) {
		
		Student s = new Student();
		//s.name 은 은닉성에 위배되었다 s.setName은 은닉성이다
		/*
		s.name = "홍길동";
		s.ban = 1;
		s.no = 1;
		s.kor = 100;
		s.eng = 60;
		s.math = 76;
		*/
		s.setName("홍길동");
		s.setBan(1);
		s.setNo(1);
		s.setKor(100);
		s.setEng(60);
		s.setMath(76);
		/*
		System.out.println("이름 : " + s.name);
		System.out.println("총점 : " + s.getTotal(s.kor,s.eng,s.math));
		System.out.println("평균 : " + s.getAverage());
		*/
		System.out.println("이름 : " + s.getName());
		System.out.println("총점 : " + s.getTotal(s.getKor(), s.getEng(), s.getMath()));
		System.out.println("평균 : " + s.getAverage());
		
	}

}


