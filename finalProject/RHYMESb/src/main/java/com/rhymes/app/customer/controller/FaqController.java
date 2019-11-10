package com.rhymes.app.customer.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;
import com.rhymes.app.customer.service.FaqService;

@Controller
@RequestMapping("/customercenter")
public class FaqController {

	@Autowired
	private FaqService faqService;
	
	
	@RequestMapping(value = "/faqlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqlist(Model model, CustomerParam param){
		
		model.addAttribute("doc_title", "자주하는 질문");
		model.addAttribute("doc_sub", "고객님들께서 가장 자주하시는 질문을 모두 모았습니다.");
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FaqDto> faqlist = faqService.getFaqList(param);
		
		//글의 총수 
		int totalRecordCount = faqService.getFaqCount(param);	
		model.addAttribute("faqlist", faqlist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
				
		return "faqlist.tiles";
	}
	
	
}
