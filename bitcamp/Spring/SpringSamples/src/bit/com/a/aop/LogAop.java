package bit.com.a.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.util.StopWatch;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

@Aspect
public class LogAop {
	
	// controller안에 websocket이 있는데 websocket과 aop가 충돌나면 안된다 !!!!!
	// 패킷을 같이 넣으면 안된다
	
	// annotation이 xml보다 더 편한 이유는 @만 붙여주면 끝인데 xml은 코드를 길게 써야한다
	//@Around("within(bit.com.a.controller.*) or within(bit.com.a.daoImpl.*)")
	@Around("within(bit.com.a.controller.*)")
	public Object loggerAop(ProceedingJoinPoint joinpoint) throws Throwable {
		
		String signatureAtr = joinpoint.getSignature().toShortString();
		
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		// request 취득
		HttpServletRequest request 
			= ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();

		if(request != null) {
			HttpSession session = request.getSession();
			
			String userId = (String)session.getAttribute("userId");
			
			if(userId == null) {
				return "redirect:/logout.do";
			}
			
		}else {
			System.out.println("request == null");
		}
		
		Object obj = joinpoint.proceed();
		stopWatch.stop();
		
		// 실행 전 처리
		System.out.println("loggerAOP" + signatureAtr + " 메소드가 실행되었습니다" + stopWatch.getTotalTimeMillis());
		
		return obj;
		
	} // loggerAop 함수

}
