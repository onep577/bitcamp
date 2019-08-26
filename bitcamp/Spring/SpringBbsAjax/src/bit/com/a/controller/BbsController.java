package bit.com.a.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.model.BbsDto;
import bit.com.a.service.BbsService;

@Controller
public class BbsController {
	
	// BbsService를 생성한다
	@Autowired
	private BbsService bbsService;
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	// 게시판 글쓰기
	@RequestMapping(value = "bbsWriteAf.do", method = RequestMethod.GET)
	public String bbsWriteAf(BbsDto dto) throws Exception {
		logger.info("BbsController bbsWriteAf()");
		boolean b = bbsService.bbsWrite(dto);
		
		if(b) {
			logger.info("글쓰기 성공");			
			return "bbsList";
		}else {
			logger.info("글쓰기 실패");
			return "bbsWrite";
		}
	}
	/**/

}
