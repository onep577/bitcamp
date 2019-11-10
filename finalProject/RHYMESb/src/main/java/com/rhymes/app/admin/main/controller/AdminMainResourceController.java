package com.rhymes.app.admin.main.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rhymes.app.admin.main.model.MainResourceDto;
import com.rhymes.app.admin.main.service.AdminMainService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j

@RequestMapping(value = "/admin/mainresource/*")
public class AdminMainResourceController {

	@Autowired AdminMainService mainService;
	
	@GetMapping("/update")
	public String update(Model model) throws Exception{
		
		MainResourceDto resource = new MainResourceDto();
		resource = mainService.getmainresource();
		
		model.addAttribute("resource", resource);
		return "resourceupdate";
	}
	
	@ResponseBody
	@GetMapping("/textupdate")
	public String textupdate(String object, String text)throws Exception {
		System.out.println("OBJECT: " + object);
		System.out.println("TEXT: " + text);
		
		MainResourceDto resource = new MainResourceDto();
		
		if(object.equals("video1_title")) {
			resource.setVideo1_title(text);
		}
		else if(object.equals("video1_content")) {
			resource.setVideo1_content(text);
		}
		else if(object.equals("video2_title")) {
			resource.setVideo2_title(text);
		}
		else if(object.equals("video2_content")) {
			resource.setVideo2_content(text);
		}
		else if(object.equals("photo1_title")) {
			resource.setPhoto1_title(text);
		}
		else if(object.equals("photo1_content")) {
			resource.setPhoto1_content(text);
		}
		else if(object.equals("photo2_title")) {
			resource.setPhoto2_title(text);
		}
		else if(object.equals("photo2_content")) {
			resource.setPhoto2_content(text);
		}
		
		boolean bool = mainService.updatemaintext(resource);
		if(bool) {
			log.info("main text 수정성공");
		}
		
		return "ㅎㅇㅎㅇ";
	}
	
	
	
	@ResponseBody
	@PostMapping("/resourceupdate")
	public String resourceupdate(HttpServletRequest req, String which, String bannertype,
		@RequestParam(value="fileload", required = false)MultipartFile fileload	
			)throws Exception {
		String msg = "";
		
		MainResourceDto dto = new MainResourceDto();
		
		String path = req.getServletContext().getRealPath("/upload/mainresource");
		String fileName = fileload.getOriginalFilename();
		String timeFileName = System.currentTimeMillis() + fileName;
		
		log.info(which);
		log.info(timeFileName);
		log.info(path);
		File file = new File(path + "/" + timeFileName);
		
		if(which.equals("banner")) {
  			dto.setMainbanner_file(timeFileName);
  			dto.setMainbanner_type(bannertype.toUpperCase());
  		}
  		if(which.equals("video1")) {
  			dto.setVideo1_file(timeFileName);
  		}
  		if(which.equals("video2")) {
  			dto.setVideo2_file(timeFileName);
  		}
  		if(which.equals("photo1")) {
  			dto.setPhoto1_file(timeFileName);
  		}
  		if(which.equals("photo2")) {
  			dto.setPhoto2_file(timeFileName);
  		}
		
  		try {
  			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
  		    
  			dto.setSeq(1);
  			boolean bool = mainService.updatemainresource(dto);
  			
  			if(bool) {
  				log.info("업데이트 성공");
  				msg = "UPDATE";
  			}else {
  				log.info("업데이트 실패");
  				msg = "FAIL";
  			}
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
		
		return msg;
	}
	
	
}
