package com.rhymes.app.common.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.rhymes.app.common.util.FUpUtil;

@Controller
public class FileManageController {
	
	/**ck에디터 파일업로드 이벤트 발생 시 처리
	 * @param model
	 * @param fileload
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ck/fileupload", method = {RequestMethod.POST, RequestMethod.GET})
	public String fileUpload(Model model,  
	        @RequestParam(value="upload", required = false) MultipartFile fileload,
	        HttpServletRequest req) {
		
		System.out.println(fileload.getOriginalFilename());
		
		JSONObject outData = new JSONObject();
		outData.put("uploaded", true);
		outData.put("url", "http://localhost/upload/store/15704428782241.jpeg");
		
		//서버에 파일을 저장할 때에는 파일명을 시간값으로 변경
	    //DB에 저장할 때에는 원본 파일명과 시간값을 모두 저장
	    //filename 취득
	    String filename = fileload.getOriginalFilename();
	    
	    //upload 경로 설정(tomcat realpath)
	    String fuploadPath = req.getServletContext().getRealPath("/upload/editor");
	 
	    //폴더 경로 설정
	    String newfilename = FUpUtil.name(filename);
	    
	    //업로드 수행	    
	    File file = new File(fuploadPath + "/" + newfilename);
	    System.out.println("http://112.169.197.59:18080/upload/store/" + newfilename);
	    try {
	        //실제 파일이 업로드 되는 부분
	        FileUtils.writeByteArrayToFile(file, fileload.getBytes() );	        
	        return "{ \"uploaded\" : true, \"url\" : \"http://112.169.197.59:18080/upload/editor/" + newfilename + "\" }";
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	    	return "{ \"uploaded\" : false, \"error\": { \"message\": \"업로드 중 에러가 발생했습니다. 다시 시도해 주세요.\" } }";
	    }
	}
}
