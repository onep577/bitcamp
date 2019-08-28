package com.aopex;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class mainClass {

	public static void main(String[] args) {
		
		// java에서 xml 실행시
		AbstractApplicationContext ctx
			= new GenericXmlApplicationContext("bean.xml");
		
		// bean.xml에서 생성된 객체를 취득한다
		// bean.xml에서 <bean id="myCat" class="com.aopex.Cat">
		Cat mycat = ctx.getBean("myCat", Cat.class);
		
		mycat.catInfo();
		
		// console는 name이 찍히지는 않는다
		mycat.getName();
		
		Cat youcat = new Cat("강아지", 12, "하얀");
		// console에 찍히지만 설정하지 않았기 때문에 다른 객체로 생각해서 aop가 안 찍힌다
		youcat.catInfo();

	}

}
