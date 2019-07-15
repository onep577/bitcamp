package main;

import cal.Mycal;
import myclass.MyClass;

public class mainClass {

	public static void main(String[] args) {
		/*
		 	Object Oriented Programming
		 	객체		지향		프로그래밍
		 	<-반대되는 개념-> 절차지향 : 순차적인 처리
		 	
		 	절차지향의 장점 : 처리 속도가 빠르다
		 	첫번째 작업 후 -> 두번째 작업 후 -> 세번째 작업을 한다
		 	하나 바꾸려면 유지보수가 어마어마하다
		 	
		 	객체 지향은 필요한 기능들을 뽑아서 하나의 클래스로 묶어준다
		 	여기서 필요한 변수나 메소드는 같이 하나로 묶는다 즉, 하나의 덩어리로 만든다
		 	하나의 덩어리를 객체화해서 main에서 사용하자
		 	
		*/
		
		MyClass cls = new MyClass(); // 객체를 생성하는 것
	//	MyClass 는 class template(형태) 	clas 는 객체
		// 변수(객체 object, 주체 instance)
		// instance 메모리 영역에 올라가는 실제 이름
		
		// cls = new MyClass();
		// MyClass 형태의 동적할당을 heap 영역의 주소를 cls에 연결
		
		// MyClass는 우리가 선언한 클래스의 자료형이다
		// cls는 객체 왜? 변수는 저장 영역이 하나이다 예)int i;
		// cls는 변수와 범위의 영역이 다르다
		System.out.println(cls); // 4byte
		// myclass.MyClass@15db9742
		
		// stack(자동) heap
		{
			int n; // 자동 할당되고 자동적으로 사라진다
			
			MyClass cls1 = new MyClass(); // 객체 생성
			// 블록을 빠져나가면 cls1 객체는 자동적으로 삭제
			// 누가 해준다? 가비지 컬렉터
		}
		
		cls.number = 123; // cls는 인스턴스 or 객체 : 주소만 가지고 있다
		cls.name = "홍길동";
		cls.method(); // MyClass 소속 method() 출력된다
		
		// MyClass mcls = 0; // 에러난다
		// Type mismatch: cannot convert from int to MyClass
		// 메모리를 초기화하고 비워주는 것 : null
		MyClass mcls = null; // 에러 안난다
		mcls = new MyClass();

		int i; // i == 변수
		
		/*
		 	stack			Heap				static		sys
		 	cls는 여기있다		number,name,method영역은 여기있다
		 	이걸 해주는 것은 ? new 이다
		영역은 Heap영역에 잡히고 new 동적할당을 해줘야 사용할 수 있다
		*/

		/*
		 	OOP의 3대 요소
		 	캡슐화 == 은닉성
		 	다형성
		 	상속성
		*/
	
		int number[] = new int[5];
		String name[] = new String[5];
		int lang[] = new int[5];
		
		MyClass member[] = new MyClass[5];
		// 번호, 이름, 언어를 6개로 바꾼다 대신에 MyClass[6]; 하면 끝! 간편하다
		// 객체 지향의 장점 : 각각 따로 관리 하던것을 하나의 덩어리로 관리할 수 있다
	
		String students[][] = {
				{"1001", "홍길동", "90", "100", "80"},
				{"1002", "일지매", "90", "100", "80"},	
		};
		
		
		String num1 = students[0][0];
		String num2 = students[1][0];
		
		// 객체 지향의 장점 : 가독성이 높다
		// 가독성 : 해석하기 쉽게 보이는 성질
		// 여기서 '가'는 쉬울 가 이다
		
		MyClass mycls = new MyClass();
		int num = mycls.number;
		
		
		// 객체?
		MyClass my1, my2, my3;
		my1 = new MyClass();
		my2 = new MyClass();
		my3 = new MyClass();
		// my1 과 my2 의 주소는 다르다

		my1.number = 1;
		my1.name = "김유신";
		
		my2.number = 2;
		my2.name = "계백";
		
		my3.number = 3;
		my3.name = "연개소문";
		System.out.println(my1); // myclass.MyClass@6d06d69c
		System.out.println(my2); // myclass.MyClass@7852e922
		System.out.println(my3); // myclass.MyClass@4e25154f
		
		
		Mycal cal = new Mycal();
		
		cal.input();
		cal.process();
		cal.resultPrint();
		
		
		
		
		
		
		
		
	} // main 함수

}
