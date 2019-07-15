package main;

import java.util.Calendar;

import vo.MemberVo;

public class mainClass {

	public static void main(String[] args) {
		/*
		MyClass mycls = new MyClass();
		mycls.method();
		mycls.function();
		*/
		
		MyClass mycls = MyClass.getInstance();
		// 어디서 본것같다? 바로 칼렌더~
		Calendar cal = Calendar.getInstance();
		// static 메소드이다 getInstance 안에 칼렌더를 생성하는 코드가 있다 우리는 못보지만
		
		
		// class array
		YouClass ycls[] = new YouClass[5]; // 배열만 생성
		// YouClass ycls0, ycls1, ycls2, ycls3, ycls4;
		// 변수만 5개 선언하였다

		// Null포인트 익셉션 나온다
		//ycls[0].setNumber(1);
		//ycls[0].method();
		
		
		for (int i = 0; i < ycls.length; i++) {
			ycls[i] = new YouClass();
			// 이제 Null포인터 익셉션 안 나온다 왜? 실제 영역을 잡았기 때문이다
		}
		ycls[0].setNumber(1); // YouClass method()
		ycls[0].method(); // number = 1
		
		// 3명의 data
		MemberVo member[] = new MemberVo[3];
		// 생성 안됐다 인스턴스만 3개 선언했다 Heap 영역
		
		for (int i = 0; i < member.length; i++) {
			member[i] = new MemberVo();
		} // Heap 영역
		
		member[0].setAge(24);
		member[0].setName("홍길동");
		
		member[1].setAge(21);
		member[1].setName("일지매");
		
		member[2].setAge(27);
		member[2].setName("임꺽정");
		
		for (int i = 0; i < member.length; i++) {
			System.out.println(member[i].toString());
		}
		
		

	}

}
