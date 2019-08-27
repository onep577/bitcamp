package bit.com.a.controller;

import org.apache.catalina.tribes.MembershipService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class HelloController {
	
	// MemberService를 생성한다
	@Autowired
	private MembershipService memService;
	
	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(HelloController.class);

}

