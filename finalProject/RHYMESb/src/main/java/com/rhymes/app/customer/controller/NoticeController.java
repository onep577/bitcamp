package com.rhymes.app.customer.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.poi.hssf.record.PageBreakRecord.Break;
import org.apache.commons.io.FileDeleteStrategy;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.customer.service.NoticeService;
import com.rhymes.app.customer.util.FUpUtil;
import com.rhymes.app.customer.util.FileDelete;


 
@Controller
@RequestMapping("/customercenter")
public class NoticeController {
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	private NoticeService noticeService;
	
	@GetMapping(value = "/noticelist")
	public String noticelist(Model model, CustomerParam param){
		
		model.addAttribute("doc_title", "공지사항");
		model.addAttribute("doc_sub", "라임의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.");
		
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<NoticeDto> noticelist = noticeService.getNoticeList(param);
		
		//글의 총수
		int totalRecordCount = noticeService.getNoticeCount(param);
		model.addAttribute("noticelist", noticelist);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		// 추가
		model.addAttribute("s_category",param.getS_category());
		model.addAttribute("s_keyword",param.getS_keyword());
				
		
		return "noticelist.tiles";
	}
	
	
	@GetMapping("/noticedetail")
	public String noticedetail(int seq,Model model) {
		
		model.addAttribute("doc_title", "공지사항");
		model.addAttribute("doc_sub", "라임의 새로운 소식들과 유용한 정보들을 한곳에서 확인하세요.");
		
		
		noticeService.NoticeUpRead(seq);
		NoticeDto noticedto = noticeService.getNoticeDetail(seq);
		
		model.addAttribute("noticedto", noticedto);
		
		//이전글 가져오기
		NoticeDto beforedto = null;
			for (int i = 1; i <= 10; i++) {
					beforedto = noticeService.getNoticeDetail(seq-i);
				if (beforedto != null) {
					break;
				}	
			}
		model.addAttribute("beforedto", beforedto);
		
		//다음글 가져오기
		NoticeDto afterdto = null;
			for (int j = 1; j <= 20; j++) {
					afterdto = noticeService.getNoticeDetail(seq+j);
				if (afterdto != null) {	
					break;
				}
			}
		model.addAttribute("afterdto", afterdto);

		return "noticedetail.tiles";
	}
	
}
