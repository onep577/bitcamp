package bit.com.a.login;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	// BbsService를 생성한다
	/*
	@Autowired
	private MemberService memService;
	/**/
	
	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그인 페이지로 이동만
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() throws Exception {
		logger.info("MemberController login()");
		return "login.tiles";
	}


}

