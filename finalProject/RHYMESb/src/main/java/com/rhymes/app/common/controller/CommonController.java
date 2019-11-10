package com.rhymes.app.common.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.common.service.CommonService;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.service.impl.KakaoAPI;

@Controller
@RequestMapping("/welcome")
public class CommonController {

	@Autowired
	private SqlSession sqlSession;
	@Autowired
	private CommonService memService;
	@Autowired
	private KakaoAPI kakao;
	
	@GetMapping("/main")
	public String welcome(Model model) {
		
		List<MemberDTO> list = sqlSession.selectList("common.getList");
		
		model.addAttribute("list", list);
		
		return "welcome";
	}

	@RequestMapping("/welcome/main")
	public String welcomeMain() {
		return "welcome/main";
	}
	
	
}
