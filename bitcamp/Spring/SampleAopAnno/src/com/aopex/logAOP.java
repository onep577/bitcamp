package com.aopex;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

// 감시자 : 변화가 오면 캐치한다
@Aspect
public class logAOP {
	
	// 이 패키지 안에 들어있는 메소드가 호출되면 loggerAop함수를 무조건 호출한다
	// xml방식에서 <aop:config>안에 있는 코드만 지우고 이걸 썼다
	@Around("within(com.aopex.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		// 우리가 설정한 범위내에서 포인터에 변화가 오면 무조건 들어온다
		// Cat.java에 어떤 함수가 호출되든 실행된다
		
		// signatureStr가 이름으로 바꿔졌다
		String signatureStr = joinpoint.getSignature().toShortString();
		
		// Cat.java에서 어떤 함수도 호출되기 전이다
		System.out.println(signatureStr + "시작");
		
		try {
			Object obj = joinpoint.proceed();
			// 어떤 기능이 실행되었는지 object를 리턴
			
			return obj;
		} finally {
			System.out.println("실행 후 : " + System.currentTimeMillis());
			
			// Cat.java에서 어떤 함수라도 호출 후이다
			System.out.println(signatureStr + "종료");
		}
			
	} // loggerAop 함수

}
