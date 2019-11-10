package com.rhymes.app.common.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.rhymes.app.admin.main.model.MainResourceDto;
import com.rhymes.app.admin.main.service.AdminMainService;
import com.rhymes.app.store.model.ProductDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	@Autowired AdminMainService mainService;
	
	@GetMapping(value = "")
	public String mainPage(Principal prc, HttpSession session, Model model)throws Exception {
		log.info("mainpage");
		ProductDto womenproduct = new ProductDto();
		ProductDto menproduct = new ProductDto();
		List<ProductDto> womenbest = new ArrayList<ProductDto>();	
		List<ProductDto> menbest = new ArrayList<ProductDto>();
		
		womenproduct.setC1_name("WOMEN");
		womenbest = mainService.getbestitem(womenproduct);
		menproduct.setC1_name("MEN");
		menbest = mainService.getbestitem(menproduct);
		
		MainResourceDto dto = new MainResourceDto();
		dto = mainService.getmainresource();
		
		model.addAttribute("menbest", menbest);
		model.addAttribute("womenbest", womenbest);
		model.addAttribute("dto", dto);
		
		return "main";
	}

} 





