package bit.com.a.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.model.BbsDto;
import bit.com.a.service.BbsService;

@Controller
public class BbsController {
	
	// BbsService를 생성한다
	@Autowired
	private BbsService bbsService;
	
	private static final Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	// 게시판으로 이동만
	@RequestMapping(value = "bbsList.do", method = RequestMethod.GET)
	public String bbsList(Model model, HttpSession session) throws Exception {
		logger.info("BbsController bbsList()");
		logger.info("session id : " + session.getAttribute("userId"));
		List<BbsDto> list = bbsService.bbsList();
		
		model.addAttribute("list", list);
		
		return "bbsList.tiles";
	}
	
	// 게시판 글쓰기로 이동만
	@RequestMapping(value = "bbsWrite.do", method = RequestMethod.GET)
	public String bbsWrite() throws Exception {
		return "bbsWrite.tiles";
	}
	
	// 게시판 글쓰기
	@RequestMapping(value = "bbsWriteAf.do", method = RequestMethod.GET)
	public String bbsWriteAf(BbsDto dto) throws Exception {
		logger.info("BbsController bbsWriteAf()");
		logger.info("dto : " + dto.toString());
		boolean b = bbsService.bbsWrite(dto);
		
		if(b) {
			logger.info("글쓰기 성공");
			return "redirect:/bbsList.do";
		}else {
			logger.info("글쓰기 실패");
			return "bbsWrite.tiles";
		}
	}
	
	// 해당 글 선택하면 조회수 증가하고 detail로 이동
	@RequestMapping(value = "bbsDetail.do", method = RequestMethod.GET)
	public String bbsDetail(Model model, int seq) throws Exception {
		logger.info("BbsController bbsDetail() seq : " + seq);
		boolean b = bbsService.bbsReadCount(seq);
		BbsDto dto = bbsService.getBbs(seq);

		logger.info("BbsController bbsDetail() readcount : " + b);
		logger.info("BbsController bbsDetail() dto : " + dto.toString());
		model.addAttribute("dto", dto);
		
		return "bbsDetail.tiles";
	}
	
	// 게시글 삭제
	@RequestMapping(value = "bbsDelete.do", method = RequestMethod.GET)
	public String bbsDelete(int seq) throws Exception {
		logger.info("BbsController bbsDelete() seq" + seq);
		boolean b = bbsService.bbsDelete(seq);
		
		if(b) {
			logger.info("BbsController " + b);
		}
		
		return "redirect:/bbsList.do";
	}

	// 게시글 수정하기로 이동만
	@RequestMapping(value = "bbsUpdate.do", method = RequestMethod.GET)
	public String bbsUpdate(Model model, int seq) throws Exception {
		logger.info("BbsController bbsUpdate() seq : " + seq);
		BbsDto dto = bbsService.getBbs(seq);
		
		model.addAttribute("dto", dto);
		
		return "bbsUpdate.tiles";
	}

	// 게시글 수정
	@RequestMapping(value = "bbsUpdateAf.do", method = RequestMethod.GET)
	public String bbsUpdateAf(BbsDto dto) throws Exception {
		logger.info("BbsController bbsUpdateAf() dto : " + dto.toString());

		boolean b = bbsService.bbsUpdate(dto);
		logger.info("BbsController bbsUpdateAf() : " + b);
		
		return "redirect:/bbsList.do";
	}

	// 댓글로 이동만
	@RequestMapping(value = "bbsAnswer.do", method = RequestMethod.GET)
	public String bbsAnswer(Model model, int seq) throws Exception {
		logger.info("BbsController bbsAnswer() seq : " + seq);
		
		BbsDto dto = bbsService.getBbs(seq);
		model.addAttribute("dto", dto);
		
		return "bbsAnswer.tiles";
	}
	
	// 댓글 쓰기
	@RequestMapping(value = "bbsAnswerAf.do", method = RequestMethod.GET)
	public String bbsAnswerAf(Model model, BbsDto dto) throws Exception {
		logger.info("BbsController bbsAnswer() dto : " + dto.toString());
		
		boolean b = bbsService.answer(dto);
		
		if(b) {
			logger.info("BbsController bbsAnswer() : " + b);
		}
		
		return "redirect:/bbsList.do";
	}


}
