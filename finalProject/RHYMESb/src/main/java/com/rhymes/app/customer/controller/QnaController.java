package com.rhymes.app.customer.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.rhymes.app.customer.model.CustomerParam;
import com.rhymes.app.customer.model.QnaDto;
import com.rhymes.app.customer.model.QnaOrderDto;
import com.rhymes.app.customer.service.QnaService;
import com.rhymes.app.customer.util.FUpUtil;
import com.rhymes.app.customer.util.FileDelete;

@Controller
@RequestMapping("/customercenter")
public class QnaController {

	@Autowired
	private QnaService qnaService;
	
	//qna list
	@RequestMapping(value = "/qnalist")
	public String qnalist(Model model, CustomerParam param ,Principal pcp, HttpServletResponse resp) {
		
		model.addAttribute("doc_title", "1:1 문의");
		
		if(pcp != null) {
			String id = pcp.getName();
			param.setId(id);
		}else {
		//로그인 후 이용 가능	
			 resp.setCharacterEncoding("utf-8");
	         resp.setContentType("text/html; charset=utf-8");
	         PrintWriter out;
			try {
				out = resp.getWriter();
				out.println("<script type='text/javascript'>alert('로그인 후 이용 가능합니다'); location.href = \"/customercenter/noticelist\";</script>" );
			         out.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
	          
			//return "noticelist.tiles";
		}
		
		
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
		
		return "qnalist.tiles";
	}
	
	//qnadetail
	@GetMapping("/qnadetail")
	public String qnadetail(int seq,Model model) {
		
		model.addAttribute("doc_title", "1:1 문의");
		
		QnaDto qnadto = qnaService.getQnaDetail(seq);
		
		model.addAttribute("qna", qnadto);

		return "qnadetail.tiles";
	}
	
	//qnawrite
	@GetMapping("/qnawrite")
	public String qnawrite(Model model,Principal pcp) {
		model.addAttribute("doc_title", "1:1문의");
	
		String id = pcp.getName();
		
		List<QnaOrderDto> orderlist = qnaService.getQnaOrderList(id);
		
		model.addAttribute("id",id);
		model.addAttribute("orderlist",orderlist);
		
		return "qnawrite.tiles";
	} 
	
	//글저장 
	@RequestMapping(value = "/qnaupload", method = RequestMethod.POST)
	public String qnaupload(QnaDto qnadto,
			@RequestParam(value = "fileload", required = false)MultipartFile fileload,
			HttpServletRequest req) {
		
		String filename = fileload.getOriginalFilename();	//mydata
		qnadto.setFilename(filename);
		
		// upload 
		String fupload = req.getServletContext().getRealPath("/upload/customer");
		
		
		// String fupload = "d:\\tmp";
		//System.out.println("_fupload:" + fupload);	
		
		// file
		String f = qnadto.getFilename();
		String newfilename = FUpUtil.getNewFileName(f);
		
		//	
		qnadto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		try {
			//
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db
			qnaService.QnaUpload(qnadto);
			
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
		return "redirect:/customercenter/qnalist";
	}
	
	//글수정가기
	@GetMapping("/qnaupdate")
	public String qnaupdate(int seq, Model model) {
		
		model.addAttribute("doc_title", "1:1문의");
		
		
		QnaDto qnadto = qnaService.getQnaDetail(seq);
		
		model.addAttribute("qna", qnadto);
		
		return "qnaupdate.tiles";
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
			
			
			//System.out.println("_fupload:" + fupload);	//�뾽濡쒕뱶 �쐞移�
			
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
		
		
		
		return "redirect:/customercenter/qnalist";
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
		
		return "redirect:/customercenter/qnalist";
	}
	
}
