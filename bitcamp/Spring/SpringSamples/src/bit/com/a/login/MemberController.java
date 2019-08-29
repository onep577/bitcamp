package bit.com.a.login;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.model.MemberDto;
import bit.com.a.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memService;
	
	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	// 로그인 페이지로 이동만
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() throws Exception {
		logger.info("MemberController login()");
		return "login.tiles";
	}
	
	// 회원가입 페이지로 이동만
	@RequestMapping(value = "account.do", method = RequestMethod.GET)
	public String account() throws Exception {
		logger.info("MemberController account()");
		return "account.tiles";
	}
	
	// 회원가입 페이지에서 아이디 체크
	@ResponseBody
	@RequestMapping(value = "idcheck.do", method = RequestMethod.POST)
	public String idcheck(MemberDto mem) throws Exception {
		logger.info("MemberController idcheck()");
		
		boolean b = memService.idCheck(mem.getId());
		
		String msg = "";
		if(b) {
			msg = "YES";
		}else {
			msg = "NO";
		}
		
		return msg;
	}

	// 회원가입 페이지에서 회원가입
	@RequestMapping(value = "accountAf.do", method = RequestMethod.POST)
	public String accountAf(MemberDto mem) throws Exception {
		logger.info("MemberController accountAf()");
		
		boolean b = memService.account(mem);
		
		if(b) {
			return "redirect:/login.do";
		}else {
			return "redirect:/account.do";
		}
	}

	// 로그인 페이지에서 로그인 성공하면 게시판으로 실패하면 로그인 창으로
	@RequestMapping(value = "loginAf.do",
					produces = "application/String; charset=utf-8",
					method = RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req) throws Exception {
		logger.info("MemberController loginAf() : " + dto.getId() + ", " + dto.getPwd());
		boolean b = memService.loginAf(dto);
		
		if(b) {
			logger.info("MemberController loginAf() 로그인 성공");
			
			// session 저장
			req.getSession().setAttribute("userId", dto.getId());
			req.getSession().setMaxInactiveInterval(60 * 60 * 2); // 2시간이다
			
			logger.info("MemberController session id : " + dto.toString());
			return "redirect:/bbsList.do";
		}else {
			logger.info("MemberController loginAf() 로그인 실패");
			return "redirect:/login.do";
		}
	}
	
	// 세션이 null값일 때 로그아웃
	@RequestMapping(value = "logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) throws Exception {
		logger.info("MemberController logout()");
		
		req.getSession().invalidate();
		
		return "logout.tiles";
	}
	
}

