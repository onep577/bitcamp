package bit.com.a.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.model.MemberDto;
import bit.com.a.model.YesMember;
import bit.com.a.model.Youtube;
import bit.com.a.model.YoutubeSave;
import bit.com.a.service.YoutubeService;
import bit.com.a.util.YoutubeParser;

@Controller
public class YoutubeController {
	
	// 생성이 되면서 불러온다
	@Autowired
	private YoutubeParser YoutubeParser;
	
	@Autowired
	private YoutubeService youtubeService;
	
	// 검색
	@RequestMapping(value = "youtube.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String youtube(String s_keyword, Model model) throws Exception {
		// s_keywork는 검색어이다
		
		if(s_keyword != null && !s_keyword.equals("")) {
			//System.out.println("검색어가 있다");
			ArrayList<Youtube> getTitles = YoutubeParser.getTitles(s_keyword);
			
			model.addAttribute("youlist", getTitles);
			model.addAttribute("s_keyword", s_keyword);
		}
		return "youtube.tiles";
	}
	
	// 유튜브 저장
	@ResponseBody
	@RequestMapping(value = "youtubesave.do", method = {RequestMethod.GET, RequestMethod.POST})
	public YoutubeSave youtubesave(YoutubeSave you) throws Exception {
		
		// DB 추가
		boolean b = youtubeService.writeYoutube(you);
		YoutubeSave ysave = youtubeService.getYoutube(you);
		
		return ysave;
	}

	// 유튜브 전체 다 가져오기
	@RequestMapping(value = "youtubelist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String youtubelist(HttpServletRequest req, Model model) throws Exception {
		model.addAttribute("doc_title", "Youtube 목록");
		
		String id = ((MemberDto)req.getSession().getAttribute("login")).getId();
		
		YoutubeSave you = new YoutubeSave();
		you.setId(id);
		
		// 유튜브 전체 다 가져오기
		List<YoutubeSave> getTitles = youtubeService.getYoutubeList(you);
		
		model.addAttribute("youlist", getTitles);
		
		return "youtubelist.tiles";
	}
	

}
