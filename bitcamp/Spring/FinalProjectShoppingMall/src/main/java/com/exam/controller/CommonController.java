package com.exam.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.exam.model.ExamDTO;

@Controller
@RequestMapping("/payment")
public class CommonController {
	
	@Autowired
	private SqlSession sqlSession;
	
	@GetMapping("/payment")
	public String payment(Model model) {
		
		List<ExamDTO> list = sqlSession.selectList("common.getList");		
		model.addAttribute("list", list);
		
		return "payment";
	}
	
	@GetMapping("/paymentAf")
	public String paymentAf(Model model) {
		return "paymentAf";
	}

}
