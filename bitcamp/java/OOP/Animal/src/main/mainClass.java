package main;

import animal.Animal;
import animal.Cat;
import animal.Cow;
import animal.Dog;

public class mainClass {

	public static void main(String[] args) {
		// 오버라이딩 강점이자 장점 : 하나의 인스턴스로 세개의 클래스를 묶어서 관리 할 수 있다
		// 오버라이딩 목적 : 복잡한 코드가 간단해진다

		//부모클래스 인스턴스 = 자식클래스 할당
		Animal animal1 = new Cat("초록이");
		//부모클래스, 자식클래스 모두 print() 메소드가 있다
		//부모클래스 인스턴스로 자식클래스 print() 메소드를 호출 : 오버라이딩
		animal1.print(); // 고양이입니다
		// System.out.println(animal1.name);
		// 부모 멤버변수를 public으로 했을 때 초록이가 출력된다
		// 자식클래스 super.print() 로도 초록이가 출력된다
		// 자식클래스 String생성자 호출 -> super(name)으로 부모 String생성자 호출 ->
		// 부모 private 멤버변수에 초록이 넣기 -> 오버라이딩 으로 자식클래스 print 메소드 출력
		
		Animal animal2 = new Dog("멍멍이");
		animal2.print(); // 멍멍이입니다
		
		Animal animal3 = new Cow("황소");
		animal3.print(); // 황소입니다
		System.out.println("===========================");
		// animal1, animal2, animal3 으로 인스턴스명이 다 다르다 당연!
		
		
		
		// 자식클래스마다 인스턴스를 만든다
		Cat cat[] = new Cat[5];
		Dog dog[] = new Dog[3];
		Cow cow[] = new Cow[2];

		// 자식클래스마다 for문을 돌린다
		// 단점 : 통합관리 X
		for (int i = 0; i < cat.length; i++) {
			cat[i] = new Cat("야옹1");
		}
		for (int i = 0; i < dog.length; i++) {
			dog[i] = new Dog("멍멍1");
		}
		for (int i = 0; i < cow.length; i++) {
			cow[i] = new Cow("음메1");
		}
		
		// 통합관리 O
		// 부모클래스에서 여러개의 자식클래스를 통합관리 할 수 있다
		Animal ani[] = new Animal[10]; // 10 마리
		ani[0] = new Dog("멍멍");
		ani[1] = new Cat("야옹");
		ani[2] = new Cat("야옹2");
		ani[3] = new Cat("야옹");
		ani[4] = new Cow("음메");
		ani[5] = new Cow("음메");
		
		for (int i = 0; i < ani.length; i++) {
			if(ani[i] != null) {
				// 10 할당 했으니 4는 null 값이다
				ani[i].print();
			}
		}
		
		Cat c = (Cat)ani[1]; // cast 변환 강제 형변환
		// 인스턴스의 주소가 부모클래스였던 ani를 자식클래스의 주소로 바꾼다
		c.catMethod(); // 숫자보다 오버라이딩에서 더 많이 쓰인다
		// 부모 인스턴스로 관리하다가 특정 하나만 꺼낼 때 cast 변환 사용하자
		/*
		 	부모클래스에 catMethod가 없다
		 	부모 인스턴스 -> 자식 인스턴스로 cast 변환 -> 자식 메소드 호출
		 */
		

	} // main 함수
}
