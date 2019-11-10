package com.rhymes.app.store.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.store.model.DetailParam;
import com.rhymes.app.store.model.PreviewDto;
import com.rhymes.app.store.service.PreviewService;
import com.rhymes.app.customer.model.CustomerParam;

@Controller
@RequestMapping("/productreview")
public class PreviewController {

	@Autowired PreviewService previewService;
	 
	//리스트가져오기
	@RequestMapping(value = "/previewlist", method = {RequestMethod.GET, RequestMethod.POST})
	public String faqlist(Model model, DetailParam param ,Principal pcp){
	
	if (pcp != null) {
		String id = pcp.getName();
		param.setId(id);
		model.addAttribute("id", id);
	}
		
		
		///////////////////상품후기부분////////////////
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<PreviewDto> previewlist = previewService.getPreviewList(param);
		
		//글의 총수
		int totalRecordCount = previewService.getPreviewCount(param);	
		model.addAttribute("previewlist", previewlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		return "previewlist.tiles";
	}
	
	@GetMapping(value="/getlikes")	//좋아요 여부
	@ResponseBody
		public String getlikes(int review_seq ,Principal pcp) {
		
		String id = pcp.getName();
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("review_seq", review_seq);
		map.put("id", id);
		
		//System.out.println(review_seq);
		//System.out.println(id);
		
		
		 boolean b = previewService.getlikes(map);
		 //System.out.println(b);
		 int num;	// ajax 리턴 변수
		 if(b) {	// 회원의 좋아요 여부 확인
			 num = 1;
		 } else {
			 num = 0;
		 }

		return num+"";
	}
	
	@GetMapping(value="/addlikes")	// 도움돼요, 추가 삭제
	@ResponseBody
		public String addlikes(int review_seq ,Principal pcp) {
		
		String id = pcp.getName();
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("review_seq", review_seq);
		map.put("id", id);
		
		 boolean b = previewService.getlikes(map);
		 int num;	// ajax 리턴 변수
		 if(b) {	// 회원의 좋아요 여부 확인
			 previewService.deletelikes(map);
			 
			 num = 0;
		 } else {
			 previewService.addlikes(map);
			
			 num = 1;
		 }

		return num+"";
	}
	
	
	@GetMapping(value="/uptotalcount")	// 좋아요 수 올리기
	@ResponseBody
		public int uptotalcount(int review_seq , DetailParam param ) {
		
		param.setSeq(review_seq);
		
		 previewService.uptotalcount(param);
		 int num = previewService.liketotalcount(param);
		
		return num;
	}
	
	@GetMapping(value="/downtotalcount")	// 좋아요 수 올리기
	@ResponseBody
		public int downtotalcount(int review_seq , DetailParam param ) {
		
		param.setSeq(review_seq);
		 previewService.downtotalcount(param);
		 int num = previewService.liketotalcount(param);
		return num;
	}
}
