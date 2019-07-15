package main;

import child.ChildClass;
import child.SubClass;
import sup.SuperClass;

public class mainClass {

	public static void main(String[] args) {
		
		SubClass sub = new SubClass(123);
		sub.method(); // 부모클래스 메소드지만 상속 받아서 호출 O
		sub.func(); // 내 거니까 호출하는 게 당연 O
		sub.overRideMethod(); // 오버라이드 O
		System.out.println("====================================");
		
		// 부모 instance		자식 class
		SuperClass sc = new SubClass();
		// 부모클래스 출력 후 자식클래스 출력
		sc.method();		// 부모클래스에 있는 메소드니까 호출 O
		//sc.func(); // 부모에 없고 자식에 있는 메소드는 부모 instance가 호출 X
		sc.overRideMethod(); // 오버라이드 메소드 라서 자식 클래스가 호출
		System.out.println("====================================");
		
		
		// func은 부모클래스에는 없어서 형변환
		// 형변환 하니까 부모클래스를 상속받은 보통 자식클래스와 다르지 않았다
		SubClass sub2 = (SubClass)sc;
		sub2.func(); // 자식 클래스 func 호출
		sub2.method(); // 부모 클래스가 호출
		sub2.overRideMethod(); // 자식 클래스가 호출
		System.out.println("====================================");
		System.out.println("sub 주소 : " + sub);
		// sub 주소 : child.SubClass@15db9742
		System.out.println("sc 주소 : " + sc);
		// sc 주소 : child.SubClass@6d06d69c
		System.out.println("sub2 주소 : " + sub2);
		//sub2 주소 : child.SubClass@6d06d69c
		/**/
		
		/*
		 	부모 클래스 A   C
		 	자식 클래스 A B
		 	
메소드  	 		sc : 부모 instance = new 자식 Class	 	sub : 자식 sub = (자식)부모 instance
C 부모만 있다			접근 O							접근 부모메소드 O
B 자식만 있다			접근 X							접근 O
A 부모도 자식도 있다		접근 자식메소드 O						접근 자식메소드 O
		*/
		
		
		
		// 부모 instance[] = new 부모 Class[];
		SuperClass arrCls[] = new SuperClass[4];
		// 생성하지 않았다!! 인스턴스만 4개 선언
		System.out.println("====================================");
		arrCls[0] = new SubClass();
		arrCls[1] = new ChildClass();
		arrCls[2] = new ChildClass();
		arrCls[3] = new SubClass();
		System.out.println("====================================");
		
		for (int i = 0; i < arrCls.length; i++) {
			arrCls[i].overRideMethod();
		}
		System.out.println("====================================");
		/**/
		
		
		
		
		
		// instanceof
		// 오버라이딩 목적 : 부모클래스 인스턴스로 관리하면서 자식클래스 메소드도 접근하기 위해서
		// 1. 부모클래스 인스턴스로 관리하다가 이 값이 어떤 자식클래스인지 찾을 때 instanceof 사용
		// 2. 관리하다가 자식클래스만 가지고 있는 메소드에 접근 할 때
		// 즉, 오버라이딩 안된 메소드에 접근할 때 사용한다
		// 오버라이딩 된 메소드는 인스턴스오브가 필요없다
		for (int i = 0; i < arrCls.length; i++) {
			
			if(arrCls[i] instanceof SubClass) {
				// SubClass라면
				SubClass s = (SubClass)arrCls[i];
				s.func();
				//s.instanceofKnow(); // 부모도 자식도 가지고 있다
				// 부모클래스에도 없고 다른 자식클래스에도 없는 나만의 메소드가 있어야한다
				// 부모 인스턴스이기 때문에 부모클래스에 있는 메소드가 호출되어
				// 어떤 자식클래스인지 모른다
				System.out.println("arrCls[" + i + "] = " + arrCls[i]);
				//arrCls[0] = child.SubClass@7852e922
				//arrCls[2] = child.ChildClass@70dea4e
			}
			else if(arrCls[i] instanceof ChildClass) {
				// ChildClass라면
				ChildClass c = (ChildClass)arrCls[i];
				c.function();
				System.out.println("arrCls[" + i + "] = " + arrCls[i]);
				//arrCls[1] = child.ChildClass@4e25154f
				//arrCls[3] = child.SubClass@5c647e05
			}
			
		}
		/**/
		
		
		
	}
}
