package com.exam.app.common.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.exam.app.common.model.TestDTO;

@Controller
@RequestMapping("/welcome")
public class CommonController {

	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/main")
	public String welcome(Model model) {
		
		List<TestDTO> list = sqlSession.selectList("common.getList");
		
		model.addAttribute("list", list);
		
		return "main/welcome";
	}
}
