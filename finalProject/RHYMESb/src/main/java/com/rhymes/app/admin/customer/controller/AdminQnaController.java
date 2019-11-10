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

import com.rhymes.app.admin.customer.service.AdminQnaService;
import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;
import com.rhymes.app.customer.util.FUpUtil;
import com.rhymes.app.customer.util.FileDelete;

@Controller
@RequestMapping("/admin/customercenter")
public class AdminQnaController {

	@Autowired
	private AdminQnaService qnaService;
	
	//qna list
	@RequestMapping(value = "/qnalist", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnalist(Model model, CustomerParam param) {
		
		//페이징
		int sn = param.getPageNumber();	//0 1 2
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20
		
		param.setStart(start);
		param.setEnd(end);
		
		List<QnaDto> qnalist = qnaService.getQnaList(param);
		
		//글의 총수
		int totalRecordCount = qnaService.getQnaCount(param);

		model.addAttribute("qnalist", qnalist);
		
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category",param.getS_category());
		
		return "adminqnalist.tiles";
	}
	
	//qnadetail
	@GetMapping("/qnadetail")
	public String qnadetail(int seq,Model model) {
			
		QnaDto qnadto = qnaService.getQnaDetail(seq);
		
		model.addAttribute("qna", qnadto);

		return "adminqnadetail.tiles";
	}
	
	
	//글수정가기
	@GetMapping("/qnaupdate")
	public String qnaupdate(int seq, Model model) {
	
		QnaDto qnadto = qnaService.getQnaDetail(seq);
		
		model.addAttribute("qna", qnadto);
		
		return "adminqnaupdate.tiles";
	}
	
	//글수정하기
	@RequestMapping(value = "/qnaupdateAf", method = {RequestMethod.GET, RequestMethod.POST})
	public String qnaupdateAf(QnaDto qnadto,
			@RequestParam(value = "file1", required = false)MultipartFile file1,
			HttpServletRequest req) {
		
		
		if (file1.isEmpty()) {
			
			qnaService.QnaUpdateAf(qnadto);
		}else {
			
			String filename = file1.getOriginalFilename();	//mydata
			qnadto.setFilename(filename);
			
			// upload 
			String fupload = req.getServletContext().getRealPath("/upload/customer");
			
			
			System.out.println("_fupload:" + fupload);	//�뾽濡쒕뱶 �쐞移�
			
			// file
			String f = qnadto.getFilename();
			String newfilename = FUpUtil.getNewFileName(f);
			
			
			//	
			qnadto.setFilename(newfilename);
			
			File file = new File(fupload + "/" + newfilename);
			
			try {
				//
				FileUtils.writeByteArrayToFile(file, file1.getBytes());
				
				// db
				qnaService.QnaUpdateAf(qnadto);
				
				
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		
		
		return "redirect:/admin/customercenter/qnalist";
	}
	
	
	//삭제하기
	@GetMapping("/qnadelete")
	public String qnadelete(int seq,int step,int ref, HttpServletRequest req) {
	
		String filename = qnaService.getfilename(seq);
		String fupload = req.getServletContext().getRealPath("/upload/customer");
		FileDelete.main(fupload + "/" + filename);
		
		if(step==0) {
			qnaService.QnaParentDelete(ref);
		}else {
			qnaService.QnaDelete(seq);
		}
		
		return "redirect:/admin/customercenter/qnalist";
	}
	
	//답글 가기 
	@GetMapping(value = "/qnaanswer")
	public String bbwrite(int seq, Model model, Principal pcp) {			
	
		String id = pcp.getName();
		model.addAttribute("id",id);
		model.addAttribute("seq", seq);
		
		return "adminqnaanswer.tiles";
	}
	//답글작성
	@RequestMapping(value = "/qnaanswerAf", method= RequestMethod.POST)
	public String qnaanswerAf(QnaDto dto,
			@RequestParam(value = "fileload", required = false)MultipartFile fileload,
			HttpServletRequest req){		
		
		String filename = fileload.getOriginalFilename();	//mydata
		dto.setFilename(filename);
		
		// upload 
		String fupload = req.getServletContext().getRealPath("/upload/customer");
		
		
		// String fupload = "d:\\tmp";
		System.out.println("_fupload:" + fupload);	
		
		// file
		String f = dto.getFilename();
		String newfilename = FUpUtil.getNewFileName(f);
		
		//	
		dto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		// db 
		try {
			boolean b = qnaService.QnaAnswer(dto);
			if(b) {

				return "redirect:/admin/customercenter/qnalist";
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/admin/customercenter/qnalist";
		
	}
	
}
