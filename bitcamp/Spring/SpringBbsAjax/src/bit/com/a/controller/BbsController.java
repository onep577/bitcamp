package bit.com.a.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.model.BbsMemberDto;
import bit.com.a.service.BbsService;

@Controller
public class BbsController {
	
	// BbsService를 생성한다
	@Autowired
	private BbsService bbsService;
	
	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	// 로그인 페이지로 이동만
	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		return "login";
	}
	
	// 회원가입 페이지로 이동만
	@RequestMapping(value = "account.do", method = RequestMethod.GET)
	public String account() {
		return "account";
	}
	
	// 회원가입 페이지에서 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "idCheck.do",
					produces = "application/String; charset=utf-8",
					method = RequestMethod.GET)
	public String idCheck(String id) throws Exception{
		logger.info("BbsController idCheck() : " + id);
		
		boolean b = bbsService.idCheck(id);
		String str = "";
		
		if(b) {
			str = "아이디로 사용 불가능합니다";		
			logger.info("idCheck" + new Date() + str);
			
		}else {
			str = "아이디로 사용 가능합니다";
			logger.info("idCheck" + new Date() + str);
		}
		
		return str;
	}
	
	// 회원가입 페이지에서 회원가입 클릭
	@RequestMapping(value = "accountAf.do", method = RequestMethod.POST)
	public String accountAf(BbsMemberDto dto) {
		
		logger.info("BbsController accountAf : " + dto.toString());
		boolean b = bbsService.account(dto);
		
		if(b) {
			logger.info("회원가입 성공");
			return "login";
		}else {
			logger.info("회원가입 실패");
			return "account";
		}
	}
	
	// 로그인 페이지에서 
	@RequestMapping(value = "bbsList.do", method = RequestMethod.GET)
	public String bbsList() {
		return "bbsList";
	}

	// 게시판 글쓰기로 이동만
	@RequestMapping(value = "bbsWrite.do", method = RequestMethod.GET)
	public String bbsWrite() {
		return "bbsWrite";
	}

}
