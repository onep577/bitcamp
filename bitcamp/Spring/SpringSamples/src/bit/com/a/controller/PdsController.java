package bit.com.a.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import bit.com.a.model.PdsDto;
import bit.com.a.service.PdsService;
import bit.com.a.util.FUpUtil;

@Controller
public class PdsController {
	
	@Autowired
	PdsService pdsService;
	
	// aop를 설정했기 때문에 안해도 된다
	// 하나라도 더 있으면 무거워진다
	private static final Logger logger = LoggerFactory.getLogger(PdsController.class);

	// 파일 전체 보기
	@RequestMapping(value = "pdslist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdslist(Model model) throws Exception {
		model.addAttribute("doc_title", "자료실 목록");
		
		List<PdsDto> list = pdsService.getPdsList();
		model.addAttribute("pdslist", list);
		
		return "pdslist.tiles";
	}
	
	// 쓰기로 이동만
	@RequestMapping(value = "pdswrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdswrite(Model model) throws Exception {
		model.addAttribute("doc_title", "자료 올리기");
		
		return "pdswrite.tiles";
	}
	
	// 파일 업로드
	@RequestMapping(value = "pdsupload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdsupload(PdsDto pdsdto,
			@RequestParam(value = "fileload", required = false)MultipartFile fileload,
			HttpServletRequest req) throws Exception {
		// spring이 좋은점이 언제든지 리퀘스트를 얻어올 수 있다
		// byte로 넘어오는 file에 대한 정보는 fileload, 제목 내용은 pdsdto
		
		// DB <- 파일명을 변경 abc.txt -> 123456.txt -> abc, 123456
		// filename 취득
		String filename = fileload.getOriginalFilename();	// mydata
		pdsdto.setFilename(filename);
		
		// upload 경로 설정. WebContent에 upload 폴더를 만든 후
		// tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
		// String fupload = "d:\\tmp";		
		System.out.println("fupload : " + fupload);		// 업로드 위치
		

		// 파일명이 겹칠 수 있기 때문에 파일명을 시간으로 변경한다
		// file명 변경	DB <- 파일명을 변경 abc.txt -> 123456.txt -> abc, 123456
		String f = pdsdto.getFilename();
		String newfilename = FUpUtil.getNewFileName(f);
		

		// 업로드
		pdsdto.setFilename(newfilename);

		
		// 경로 + 파일명
		File file = new File(fupload + "/" + newfilename);
		
		
		try {
			// 실제 파일 업로드 되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db 저장
			pdsService.uploadPds(pdsdto);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/pdslist.do";
	}
	
	// 파일 다운로드
	@RequestMapping(value = "fileDownload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String fileDownload(String filename, int seq, HttpServletRequest req, Model model) throws Exception {
		
		// download 경로
		// tomcat
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
		// String fupload = "d:\\tmp";
		
		File downloadFile = new File(fupload + "/" + filename);
		
		model.addAttribute("downloadFile", downloadFile);
		model.addAttribute("seq", seq);
		
		return "downloadView";
	}
	
	// DB의 파일명 삭제
	@RequestMapping(value = "filedel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String filedel(int seq) throws Exception {
		logger.info("filedel() 자료 삭제");
		
		boolean b = pdsService.delete(seq);
		
		if(b) {
			logger.info("자료 삭제 성공");
		}else {
			logger.info("자료 삭제 실패");
		}
		
		return "redirect:/pdslist.do";
	}
	
	// 파일 detail
	@RequestMapping(value = "pdsdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdsdetail(Model model, int seq) throws Exception {
		logger.info("pdsdetail() : 하나의 자료 보기 seq : " + seq);
		
		PdsDto pds = pdsService.getPds(seq);
		logger.info("pds : " + pds.toString());
		
		model.addAttribute("pds", pds);
		
		return "pdsdetail.tiles";
	}
	
	

}
