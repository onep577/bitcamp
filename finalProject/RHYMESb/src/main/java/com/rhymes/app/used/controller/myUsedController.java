package com.rhymes.app.used.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.Service.MyUsedService;
import com.rhymes.app.used.Service.UsedService;
import com.rhymes.app.used.model.MyUsedParam;
import com.rhymes.app.used.model.NotesDto;
import com.rhymes.app.used.model.NotesRecvParam;
import com.rhymes.app.used.model.NotesSendParam;
import com.rhymes.app.used.model.ProductsDto;

@RequestMapping(value = "mypage/*")
@Controller
public class myUsedController {

	@Autowired
	MyUsedService MyusedService;

	@Autowired
	UsedService usedService;

	@GetMapping(value = "/notes") // 쪽지 메인 View
	public String getNotesList(Model model, Principal prc, NotesRecvParam rparam, NotesSendParam sparam,
			@RequestParam(value = "tapcount", defaultValue = "0") int tapcount) {

		P_MemberDTO dto = usedService.getMemberDto(prc.getName()); // 회원 정보를 얻는다
		sparam.setId(dto.getUserid());
		rparam.setId(dto.getUserid());

		int rtotalRecordCount = MyusedService.getRecvNotesCount(rparam); // 받은쪽지함 페이징을 위한 갯수
		int stotalRecordCount = MyusedService.getSendNotesCount(sparam); // 보낸쪽지함 페이징을 위한 갯수

		int r_sn = rparam.getR_pageNumber(); // 0 , 1, 2
		int r_start = r_sn * rparam.getR_recordCountPerPage() + 1; // 0 -> 1 , 1 - > 11 1 11
		int r_end = (r_sn + 1) * rparam.getR_recordCountPerPage(); // 0 - > 10, 1 - > 20 10 20

		rparam.setR_start(r_start);
		rparam.setR_end(r_end);

		int s_sn = sparam.getS_pageNumber(); // 0 , 1, 2
		int s_start = s_sn * sparam.getS_recordCountPerPage() + 1; // 0 -> 1 , 1 - > 11 1 11
		int s_end = (s_sn + 1) * sparam.getS_recordCountPerPage(); // 0 - > 10, 1 - > 20 10 20

		sparam.setS_start(s_start);
		sparam.setS_end(s_end);

		model.addAttribute("dto", dto);

		// 받은거..
		List<NotesDto> rlist = MyusedService.getrecvnotes(rparam); // 회원 정보로 쪽지목록을 얻는다
		model.addAttribute("rlist", rlist);
		model.addAttribute("r_select", rparam.getR_select());
		model.addAttribute("r_keyword", rparam.getR_keyword());

		model.addAttribute("r_pageNumber", r_sn); // 현재 페이지 넘버
		model.addAttribute("r_pageCountPerScreen", 10);
		model.addAttribute("r_recordCountPerPage", rparam.getR_recordCountPerPage());
		model.addAttribute("r_totalRecordCount", rtotalRecordCount);

		// 보낸거..
		List<NotesDto> slist = MyusedService.getsendnotes(sparam); // 회원 정보로 쪽지목록을 얻는다
		model.addAttribute("slist", slist);
		model.addAttribute("s_select", sparam.getS_select());
		model.addAttribute("s_keyword", sparam.getS_keyword());

		model.addAttribute("tapcount", tapcount);

		model.addAttribute("s_pageNumber", s_sn); // 현재 페이지 넘버
		model.addAttribute("s_pageCountPerScreen", 10);
		model.addAttribute("s_recordCountPerPage", sparam.getS_recordCountPerPage());
		model.addAttribute("s_totalRecordCount", stotalRecordCount);

		return "member/mypage/notes";

	}

	@GetMapping(value = "/notesdetail") // 쪽지 내용 보기
	public String notesdetail(Model model, Principal prc, String seq) {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("seq", seq);
		map.put("loginid", prc.getName());

		NotesDto ndto = MyusedService.getnotesdetail(map);

		model.addAttribute("dto", ndto);

		return "notesdetail.tiles";
	}

	@GetMapping(value = "/noteswrite") // 쪽지 보내기 팝업띄우기
	public String NotesWrite(Model model, Principal prc) {

		return "notesWrite.tiles";
	}

	@GetMapping(value = "/noteswriteAf") // 쪽지가 DB에 저장되는 부분
	public String NotesWriteAf(Model model, Principal prc, NotesDto ndto, boolean save) {

		if (save) {
			ndto.setSend_del("N");
		} else {
			ndto.setSend_del("Y");

		}

		boolean b = MyusedService.sendnotes(ndto);

		if (b) {

		} else {

		}

		return "redirect:/notes";
	}

	@GetMapping(value = "/json") // 쪽지 보내기 자동 검색
	@ResponseBody
	public List<String> json(String value, Principal prc) throws Exception {

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("value", value);
		map.put("id", prc.getName());

		List<String> member = MyusedService.getMemberid(map);

		return member;
	}

	@GetMapping(value = "/idcheck") // 쪽재 보내기 자동 검색
	@ResponseBody
	public String idcheck(String id) {

		int n = MyusedService.idcheck(id);

		return n + "";
	}

	@GetMapping(value = "/notesdelete") // 쪽지 삭제
	public String notesdelete(NotesDto ndto, Principal prc, HttpServletRequest req,
			@RequestParam(value = "rchbox") List<String> seq) {
		ndto.setRecv_id(prc.getName());

		for (int i = 0; i < seq.size(); i++) {
			int n = Integer.parseInt(seq.get(i));
			ndto.setSeq(n);
			System.out.println(ndto.toString());
			boolean b = MyusedService.notesdelete(ndto);
		}

		return "redirect:/mypage/notes";
	}

	@GetMapping(value = "/notesdelete2") // 쪽지 삭제2
	public String notesdelete2(NotesDto ndto, @RequestParam(value = "schbox") List<String> seq, Principal prc) {
		ndto.setSend_id(prc.getName());

		for (int i = 0; i < seq.size(); i++) {
			int n = Integer.parseInt(seq.get(i));
			ndto.setSeq(n);
			System.out.println(ndto.toString());
			boolean b = MyusedService.notesdelete2(ndto);
		}

		return "redirect:/mypage/notes";
	}

	@GetMapping(value = "/notesanswer") // 쪽지 답장
	public String notesanswer(NotesDto ndto, Model model) {

		model.addAttribute("dto", ndto);

		return "notesanswer.tiles";
	}

	@GetMapping(value = "/subscribe")
	@ResponseBody
	public String subscribe(String subscribe, String id) { // 쪽지 수신여부

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("subscribe", subscribe);
		map.put("id", id);

		boolean b = MyusedService.getsubscribe(map); // 수신 여부 확인

		int num; // ajax 리턴 변수
		if (b) { // 회원의 좋아요 여부 확인
			MyusedService.deletesubscribe(map); // 수신거부 취소
			num = 0;
		} else {
			MyusedService.addsubscribe(map); // 수신거부 설정
			num = 1;
		}

		return num + "";
	}

	@GetMapping(value = "/myused") // 내 판매목록 보기
	public String myused(Model model, Principal prc, MyUsedParam mparam) {
		String id = prc.getName();
		mparam.setId(id);

		System.out.println(mparam.toString());

		int totalRecordCount = MyusedService.MyusedCount(mparam);
		// pageNumber 취득
		int sn = mparam.getPageNumber(); // 0 , 1, 2
		int start = sn * mparam.getRecordCountPerPage() + 1; // 0 -> 1 , 1 - > 11 1 11
		int end = (sn + 1) * mparam.getRecordCountPerPage(); // 0 - > 10, 1 - > 20 10 20

		mparam.setStart(start);
		mparam.setEnd(end);

		System.out.println(mparam.toString());
		List<ProductsDto> plist = MyusedService.getMyUsedList(mparam);
		model.addAttribute("plist", plist);
		model.addAttribute("select", mparam.getSelect());

		model.addAttribute("keyword", mparam.getKeyword());

		model.addAttribute("pageNumber", sn); // 현재 페이지 넘버
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", mparam.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		return "member/mypage/myused";
	}

	@GetMapping(value = "/updatedivision") // 판매 상태 변경
	public String updatedivision(Model model, ProductsDto pDto) {

		System.out.println(pDto.getSeq() + " " + pDto.getDivision());
		boolean b = MyusedService.updatedivision(pDto);

		return "redirect:/mypage/myused";
	}
}
