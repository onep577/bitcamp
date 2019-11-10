package com.rhymes.app.store.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PqnaDto;
import com.rhymes.app.store.service.PqnaService;


import com.rhymes.app.customer.model.CustomerParam;


@Controller
@RequestMapping("/productqna")
public class PqnaController {

	@Autowired
	private PqnaService PqnaService;
	
	
	
	//상품문의 리스트
	@RequestMapping(value = "/pqnalist", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqlist(Model model, DetailParam param, Principal pcp){
		
		if(pcp != null) {
		String loginid = pcp.getName();
		model.addAttribute("loginid",loginid);
		}
		///////////////////상품문의부분////////////////
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		//System.out.println("현재p_seq"+param.getP_seq());
		List<PqnaDto> pqnalist = PqnaService.getPqnaList(param);
		
		
		model.addAttribute("pp_seq", param.getP_seq());
		//글의 총수
		int totalRecordCount = PqnaService.getPqnaCount(param);	
		model.addAttribute("pqnalist", pqnalist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		return "pqnalist.tiles";
	}
	
	

	//상품문의 글쓰기가기
	@GetMapping("/pqnawrite")
	public String pqnawrite(Model model, DetailParam param,HttpServletRequest request,Principal pcp) {
		String referer1 = request.getHeader("Referer");
		model.addAttribute("referer1", referer1);
		model.addAttribute("pqnalist", param);
		
		String id = pcp.getName();
		model.addAttribute("id",id);
		return "pqnawrite.tiles";
	}
	
	//상품문의 글작성완료
	@RequestMapping(value = "/pqnaupload", method = {RequestMethod.GET, RequestMethod.POST})
	public String qpanupload(PqnaDto pqnadto,String referer1) {
		
		PqnaService.PqnaUpload(pqnadto);
		
		 return "redirect:"+ referer1;
	}

	//상품문의 글수정가기
	@GetMapping("/pqnaupdate")
	public String pqnaupdate(int seq, Model model, HttpServletRequest request) {
		String referer1 = request.getHeader("Referer");
		model.addAttribute("referer1", referer1);
		
		PqnaDto pqnadto = PqnaService.getPqnaDetail(seq);
		model.addAttribute("pqnadto",pqnadto);
		
		return "pqnaupdate.tiles";
	}
	
	//상품문의 글수정하기
	@RequestMapping(value = "/pqnaupdateAf", method = {RequestMethod.GET, RequestMethod.POST})
	public String pqnaupdateAf(PqnaDto pqnadto,String referer1) {
		
		PqnaService.PqnaUpdateAf(pqnadto);
		
		return "redirect:"+ referer1;
	}
	
	//상품문의 삭제하기
	@GetMapping("/pqnadelete")
	public String pqnadelete(int seq, HttpServletRequest request) {
		
		String referer = request.getHeader("Referer");
		
		PqnaService.PqnaDelete(seq);
		
		return "redirect:"+ referer;
	}
		
	//상품 문의 답글 가기 
	@GetMapping(value = "/pqnaanswer")
	public String answerwrite(int seq, Model model, HttpServletRequest request, DetailParam param) {			
		String referer1 = request.getHeader("Referer");
		model.addAttribute("referer1", referer1);
		model.addAttribute("pqnalist", param);
		model.addAttribute("seq", seq);
		
		return "pqnaanswer.tiles";
	}
	//상품 문의 답글작성
	@RequestMapping(value = "/pqnaanswerAf", method= RequestMethod.POST)
	public String pqnaanswerAf(PqnaDto pqnadto,String referer1){		
		
		try {
			PqnaService.PqnaAnswer(pqnadto);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "redirect:"+ referer1;
		
	}
	
	
}
