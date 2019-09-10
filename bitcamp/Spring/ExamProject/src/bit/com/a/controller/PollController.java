package bit.com.a.controller;

import java.io.File;
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

import bit.com.a.model.PollBean;
import bit.com.a.model.PollDto;
import bit.com.a.model.Student;
import bit.com.a.service.PollService;
import bit.com.a.util.FUpUtil;

@Controller
public class PollController {
	
	@Autowired
	PollService pollService;
	
	private static final Logger logger = LoggerFactory.getLogger(PollController.class);
		
	// 투표
	@RequestMapping(value = "polllist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String polllist(Model model, HttpServletRequest req) throws Exception{
		model.addAttribute("doc_title", "투표 목록");
		
		// 리스트로 들어갈 때 투표했으면 결과창으로 안했으면 투표창으로 보내기 위해 session이 필요하다
		// 왜? voter dto에 session id가 있으면 결과창으로 보낼 수 있다
		String id = ((Student)req.getSession().getAttribute("login")).getId();
		
		logger.info("session : " + ((Student)req.getSession().getAttribute("login")).toString());
		
		// list 투표를 했는지 체크
		List<PollDto> list = pollService.getPollAllList(id);
		logger.info("list : " + list.toString());
		
		model.addAttribute("plists", list);
		
		return "polllist.tiles";
	}
	
	// 투표 만들기 이동만
	@RequestMapping(value = "pollmake.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pollmake(Model model) throws Exception {
		model.addAttribute("doc_title", "투표 만들기");
		logger.info("pollmake");
		
		return "pollmake.tiles";
	}
	
	// 투표 만들기
	@RequestMapping(value = "pollmakeAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pollmakeAf(PollBean pbean,
			@RequestParam(value = "fileload", required = false) MultipartFile fileload,
			@RequestParam("file") MultipartFile[] multiFiles, HttpServletRequest req ) throws Exception {

		logger.info(multiFiles.toString());
		logger.info("pollmakeAf : " + pbean.toString());
		
		System.out.println("길이 : " +pbean.getItemcount());
		
		String question[] = pbean.getQuestion().split(",");
		String question_sub[] = pbean.getQuestion_sub().split(",");
		String pollsub1[] = pbean.getPollsub1().split(",");
		String pollsub2[] = pbean.getPollsub2().split(",");
		String pollsub3[] = pbean.getPollsub3().split(",");
		String pollsub4[] = pbean.getPollsub4().split(",");
		String answer[] = pbean.getAnswer().split(",");
		
		for(int i = 0; i < Integer.parseInt(pbean.getItemcount()); i++) {
			logger.info("pollmakeAf : " + pbean.getQuestion());
			pollService.makePoll(new PollBean(pbean.getTitle(),
					question[i],
					question_sub[i],
					pbean.getItemcount(),
					pollsub1[i],
					pollsub2[i],
					pollsub3[i],
					pollsub4[i],
					answer[i],
					pbean.getTeacher(),
					pbean.getSdate(),
					pbean.getEdate()));
		}		
		
		return "redirect:/polllist.do";
	}
	
	// 투표하기 페이지로 이동
	/*
	@RequestMapping(value = "polldetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String polldetail(Model model, PollDto poll) throws Exception {
		logger.info("polldetail()");
		model.addAttribute("doc_title", "투표 내용");
		
		PollDto dto = pollService.getPoll(poll);
		List<PollSubDto> list = pollService.getPollSubList(poll);
		
		logger.info("질문 : " + dto.getQuestion());
		for (PollSubDto p : list) {
			logger.info(""+p);
		}
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "polldetail.tiles";
	}
	/**/
	
	// 투표하기
	/*
	@RequestMapping(value = "polling.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String polling(Voter voter, Model model) throws Exception {
		logger.info("polling()");
		
		pollService.polling(voter);
		
		return "redirect:/polllist.do";
	}
	/**/
	
	// 투표 결과 페이지로 이동
	/*
	@RequestMapping(value = "pollresult.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pollresult(PollDto poll, Model model) throws Exception {
		logger.info("pollresult()");
		model.addAttribute("doc_title", "투표 결과");
		
		PollDto dto = pollService.getPoll(poll);
		List<PollSubDto> list = pollService.getPollSubList(poll);
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "pollresult.tiles";
	}
	/**/

}


