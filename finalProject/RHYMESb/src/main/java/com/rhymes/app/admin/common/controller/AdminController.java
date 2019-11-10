package com.rhymes.app.admin.common.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.common.service.AdminCommonService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/admin/*")
public class AdminController {

	HttpSession session;
	
	@Autowired
	AdminCommonService adminCommonService;

	// admin main
	@GetMapping("main")
	public String newMain(HttpServletRequest req) {
		log.warn("Admin Controlelr main");
		
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String mTime = date.format (today);

		int count = adminCommonService.getAllMemberList();	// 회원 전체 count
		int newmemcount = adminCommonService.getNewMemCount(mTime);	// 오늘 가입한 회원 count

		req.getSession().setAttribute("count", count);
		req.getSession().setAttribute("newmemcount", newmemcount);
		
		return "AdminMain";
	}
	
}