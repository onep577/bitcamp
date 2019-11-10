package com.rhymes.app.admin.customer.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rhymes.app.admin.customer.service.AdminNoticeService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.NoticeDto;
import com.rhymes.app.customer.util.FUpUtil;
import com.rhymes.app.customer.util.FileDelete;



@Controller
@RequestMapping("/admin/customercenter")
public class AdminNoticeController {

	@Autowired
	private AdminNoticeService noticeService;

	@RequestMapping(value = "/noticelist", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticelist(Model model, CustomerParam param){
		
		
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
				
		
		return "adminnoticelist.tiles";
	}
	
	
	@GetMapping("/noticedetail")
	public String noticedetail(int seq,Model model) {
		
		
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

		return "adminnoticedetail.tiles";
	}
	
	@GetMapping("/noticewrite")
	public String noticewrite(Model model,Principal pcp) {
	
		String id = pcp.getName();
		model.addAttribute("id",id);
		return "adminnoticewrite.tiles";
	} 
	
	//글저장 
	@RequestMapping(value = "/noticeupload", method = RequestMethod.POST)
	public String noticeupload(NoticeDto noticedto,
			@RequestParam(value = "fileload", required = false)MultipartFile fileload,
			HttpServletRequest req) {
		
		
		String filename = fileload.getOriginalFilename();	//mydata
		noticedto.setFilename(filename);
		
		// upload 
		
		String fupload = req.getServletContext().getRealPath("/upload/customer");
		
		// �뤃�뜑
		// String fupload = "d:\\tmp";
		
		System.out.println("_fupload:" + fupload);	//�뾽濡쒕뱶 �쐞移�
		
		// file
		String f = noticedto.getFilename();
		String newfilename = FUpUtil.getNewFileName(f);
		
		
		//	
		noticedto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			//
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db
			noticeService.NoticeUpload(noticedto);
			
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/admin/customercenter/noticelist";
	}
	
	//글수정가기
	@GetMapping("/noticeupdate")
	public String noticeupdate(int seq, Model model) {
		
	
		NoticeDto noticedto = noticeService.getNoticeDetail(seq);
		
		model.addAttribute("noticedto", noticedto);
		
		return "adminnoticeupdate.tiles";
	}
	
	//글수정하기
	@RequestMapping(value = "/noticeupdateAf", method = {RequestMethod.GET, RequestMethod.POST})
	public String noticeupdateAf(NoticeDto noticedto,
			@RequestParam(value = "file1", required = false)MultipartFile file1,
			HttpServletRequest req) {
		
		
		if (file1.isEmpty()) {
			
			noticeService.NoticeUpdateAf(noticedto);
		}else {
			
			String filename = file1.getOriginalFilename();	//mydata
			noticedto.setFilename(filename);
			
			// upload 
			String fupload = req.getServletContext().getRealPath("/upload/customer");
			
			
			System.out.println("_fupload:" + fupload);	//�뾽濡쒕뱶 �쐞移�
			
			// file
			String f = noticedto.getFilename();
			String newfilename = FUpUtil.getNewFileName(f);
			
			
			//	
			noticedto.setFilename(newfilename);
			
			File file = new File(fupload + "/" + newfilename);
			
			try {
				//
				FileUtils.writeByteArrayToFile(file, file1.getBytes());
				
				// db
				noticeService.NoticeUpdateAf(noticedto);
				
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		
		
		return "redirect:/admin/customercenter/noticelist";
	}
	
	
	//삭제하기
	@GetMapping("/noticedelete")
	public String noticedelete(int seq, HttpServletRequest req) {
		
		String filename = noticeService.getfilename(seq);
		String fupload = req.getServletContext().getRealPath("/upload/customer");
		FileDelete.main(fupload + "/" + filename);
		 
		
		boolean b = noticeService.NoticeDelete(seq);
		if(b) {
			return "redirect:/admin/customercenter/noticelist";
		}
		
		return "redirect:/admin/customercenter/noticelist";
	}
	
}
