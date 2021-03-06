package bit.com.a.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.model.MemberDto;
import bit.com.a.service.BitMemberService;

@Controller
public class HomeController {

	@Autowired
	private BitMemberService bitMemberService;

	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 외부에서는 login.do를 보고 들어온다
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login(Model model) {
		// model의 목적은 날려주기 위해서이다
		// 컨트롤러의 메소드이다 myHello 이름이 달라도 된다 하지만 대부분 맞춘다
		logger.info("HomeController login " + new Date());

		// 가고 싶은 파일의 파일명이다 myHello.jsp
		return "login";
	}

	// 외부에서는 account.do를 보고 들어온다
	@RequestMapping(value = "account.do", method = RequestMethod.GET)
	public String account(Model model) {
		logger.info("HomeController account " + new Date());

		// 가고 싶은 파일의 파일명이다 account.jsp
		return "account";
	}

	// 회원가입
	@RequestMapping(value = "accountAf.do", method = RequestMethod.POST)
	public String accountAf(MemberDto dto, Model model, HttpServletRequest req) throws Exception {
		// model은 짐싸는 용도, req 는 세션에 접근하는 용도

		logger.info("회원가입 페이지" + new Date());
		boolean b = bitMemberService.addmember(dto);

		if (b) {
			logger.info("회원가입 성공");
			return "login";
		} else {
			logger.info("회원가입 실패");
			return "account";
		}

	}

	// 로그인
	@RequestMapping(value = "loginAf.do", method = RequestMethod.GET)
	public String loginAf(MemberDto dto, Model model, HttpServletRequest req) throws Exception {

		logger.info("로그인 페이지" + new Date());
		boolean b = bitMemberService.loginCheck(dto);

		if (b) {
			logger.info("로그인 성공");
			return "loginAf";
		} else {
			logger.info("로그인 실패");
			return "login";
		}

	}

}
