package com.rhymes.app.admin.customer.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rhymes.app.admin.customer.service.AdminFaqService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.FaqDto;
import com.rhymes.app.customer.service.FaqService;

@Controller
@RequestMapping("/admin/customercenter")
public class AdminFaqController {
	
	@Autowired
	private AdminFaqService faqService;
	
	@RequestMapping(value = "/faqlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqlist(Model model, CustomerParam param){
		
	
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
				
		return "adminfaqlist.tiles";
	}
	
	//글쓰기가기
	@GetMapping("/faqwrite")
	public String faqwrite(Model model, Principal pcp) {
		
		String id = pcp.getName();
		model.addAttribute("id",id);
		return "adminfaqwrite.tiles";
	}
	
	//글작성완료
	@GetMapping("/faqupload")
	public String faqupload(FaqDto faqdto) {
		
		faqService.FaqUpload(faqdto);
		
		return "redirect:/admin/customercenter/faqlist";
	}
	
	//글수정가기
	@GetMapping("/faqupdate")
	public String faqupdate(int seq, Model model) {
			
		FaqDto faqdto = faqService.getFaqDetail(seq);
		model.addAttribute("faqdto",faqdto);
		
		return "adminfaqupdate.tiles";
	}
	
	//글수정하기
	@GetMapping("/faqupdateAf")
	public String faqupdateAf(FaqDto faqdto) {
		
		faqService.FaqUpdateAf(faqdto);
		
		return "redirect:/admin/customercenter/faqlist";
	}
	
	//삭제하기
	@GetMapping("/faqdelete")
	public String faqdelete(int seq) {
		
		
		faqService.FaqDelete(seq);
		
		return "redirect:/admin/customercenter/faqlist";
	}
	

}
