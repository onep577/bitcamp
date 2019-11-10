package com.rhymes.app.used.controller;


import java.io.FileOutputStream;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.Service.UsedService;
import com.rhymes.app.used.model.BbsParam;
import com.rhymes.app.used.model.CommentsDto;
import com.rhymes.app.used.model.ProductsDto;
import com.rhymes.app.used.util.Coolsms;


@RequestMapping("/used/*")
@Controller
public class UsedController {

	@Autowired UsedService usedService;
	
	
	@GetMapping("/hello")  // 테스트
	public String test(HttpServletRequest req,Principal prc) {

		return "used/test";
	}
	
	@GetMapping("usedlist")	// 중고장터 판매목록을 불러온다
	public String usedlist(Model model,BbsParam param,Principal prc, HttpServletRequest req) {
		if(prc != null) {
			P_MemberDTO Pdto = usedService.getMemberDto(prc.getName());
			req.getSession().setAttribute("login", Pdto);
		}
		
		int totalRecordCount = usedService.getBbsCount(param);
		
		
		// pageNumber 취득
		int sn = param.getPageNumber(); // 0 , 1, 2
		int start = sn * param.getRecordCountPerPage() + 1; // 0 -> 1 , 1 - > 11		1   11
		int end = (sn + 1) * param.getRecordCountPerPage(); // 0 - > 10, 1 - > 20		10  20
		
		param.setStart(start);
		param.setEnd(end);
			
		List<ProductsDto> list = usedService.getUsedList(param);
		
		// 페이징을 위한 attribute
		
		model.addAttribute("list", list);
		model.addAttribute("select",param.getSelect());
		model.addAttribute("category",param.getCategory());
		model.addAttribute("keyword",param.getKeyword());
		
		model.addAttribute("pageNumber",sn); // 현재 페이지 넘버
		model.addAttribute("pageCountPerScreen",10);
		model.addAttribute("recordCountPerPage",param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		
		return "usedlist.tiles";
	}
	
	@GetMapping("useddetail")	// 중고상품 디테일
	public String useddetail(Model model,int seq, HttpServletRequest req) {
		boolean c = usedService.updateReadCount(seq);	// 조회수 증가
		
		ProductsDto dto = usedService.getUsedDetail(seq);		// 게시글 정보 받아오기
		dto.setLikes( usedService.getboardlikes(seq));			// 게시글의 좋아요 개수 설정
		
		
		String id = "";
		
		 if( ((P_MemberDTO)req.getSession().getAttribute("login"))  == null	) {
			 id = "";
		 }  
		 else {		// 세션에 로그인 정보가 있을 때 
			 
		    id = ((P_MemberDTO)req.getSession().getAttribute("login")).getUserid();
			 
			Map<String,Object> map = new HashMap<String, Object>();
			 
			map.put("bno", dto.getSeq());
			map.put("mname", id);
			 
			 boolean b = usedService.getlikes(map);

			 if(b) {	// 회원의 좋아요 여부 확인
				 ((P_MemberDTO)req.getSession().getAttribute("login")).setIslike(true);
			 } else {
				 ((P_MemberDTO)req.getSession().getAttribute("login")).setIslike(false);
			 }
		 }
		 
		// 사진을 , 단위로 끊어서 배열에 저장해준다. 
		 
		String str = dto.getPhoto_sys();
		String arr[] = str.split(",");
		dto.setPhoto_list(arr);

		model.addAttribute("dto", dto);
		
		return "useddetail.tiles";
	
		
	}
	
	@GetMapping(value="updateProduct")	// 중고상품 수정
	public String updateProduct(int seq,Model model) {
		
		ProductsDto dto =  usedService.getUsedDetail(seq);
		
		String str = dto.getPhoto_sys();
		String arr[] = str.split(",");
		dto.setPhoto_list(arr);
		
		String str2 = dto.getPhoto();	
		String arr2[] = str2.split(",");
		dto.setPhoto_originlist(arr2);
		
		
		model.addAttribute("dto",dto);
		
		return "usedupdate.tiles";
	}
	
	@GetMapping(value="deleteProduct")	// 제품 삭제
	public String deleteProduct(int seq,Model model) {
		
		boolean b = usedService.deleteProduct(seq);
		
		return "redirect:usedlist";
	}
	
	@GetMapping(value="/getCommentsList",produces = "application/json; charset=utf8")	// ajax로 댓글을 불러온다
	@ResponseBody
	public ResponseEntity getCommentsList(CommentsDto cDto) throws Exception{
	
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		cDto.setStart( (cDto.getRpagenumber() -1) * 10 );

		
		List<CommentsDto> clist = usedService.getComments(cDto);
		

		
		if(clist.size() > 0) {
			for(int i = 0 ; i < clist.size() ; i++) {
				HashMap hm = new HashMap();
				hm.put("seq", clist.get(i).getSeq());
				hm.put("comments", clist.get(i).getComments());
				hm.put("id", clist.get(i).getId());
				hm.put("rdate", clist.get(i).getDate());
				hm.put("ref", clist.get(i).getRef());
				hm.put("depth", clist.get(i).getDepth());
				
				hmlist.add(hm);
			}
		}
		
		JSONArray json = new JSONArray(hmlist);
		
		
		
		return new ResponseEntity(json.toString(), responseHeaders , HttpStatus.CREATED);
	};
	
	@GetMapping(value="/getCommentCount",produces = "application/json; charset=utf8") // 죄송합니다 하드코딩 댓글 append...
	@ResponseBody
	public ResponseEntity getCommentCount(CommentsDto cDto) {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		cDto.setStart( (cDto.getRpagenumber() -1 )* 10 );
		List<CommentsDto> clist = usedService.getComments(cDto);
		
		if(clist.size() > 0) {
			for(int i = 0 ; i < clist.size() ; i++) {
				HashMap hm = new HashMap();
				hm.put("seq", clist.get(i).getSeq());
				hm.put("comments", clist.get(i).getComments());
				hm.put("id", clist.get(i).getId());
				hm.put("rdate", clist.get(i).getDate());
				hm.put("ref", clist.get(i).getRef());
				hm.put("depth", clist.get(i).getDepth());
				
				hmlist.add(hm);
			}
		}
		
		JSONArray json = new JSONArray(hmlist);
		
		
		
		return new ResponseEntity(json.toString(), responseHeaders , HttpStatus.CREATED);
	}
	
	@GetMapping("/addComments")	// 댓글 작성
	@ResponseBody
	public String addComments(int parent,String comments,String userid) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		map.put("comments", comments);
		map.put("userid", userid);
		
		
		boolean b = usedService.addComments(map);
		
		
		return "suc";
	}
	
	@GetMapping("/updateComment")	// 댓글 수정
	@ResponseBody
	public String updateComment(int parent, int seq,String comments) {
		
	Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		map.put("seq", seq);
		map.put("comments", comments);
			
		boolean b = usedService.updateComment(map);
		
		
		
		return "suc";
	}
	
	@GetMapping("/insertanswer")	// 답글 작성
	@ResponseBody
	public String insertanswer(int parent, int seq, String comments, String userid, int ref) {
			
	Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		map.put("seq", seq);
		map.put("comments", comments);
		map.put("userid", userid);
		map.put("ref", ref);
		
		boolean b = usedService.insertanswer(map);
		
		
		
		return "suc";
	}
	
	@GetMapping("/deleteComment")	// 답글 삭제
	@ResponseBody
	public String deleteComment(int parent,int seq,int depth,int ref) {
	
	Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("parent", parent);
		map.put("seq", seq);
		map.put("depth",depth);
		map.put("ref", ref);
		
		boolean b = usedService.deleteComment(map);
	
		return "suc";
	}
	
	@GetMapping("popup")	// 휴대폰 인증팝업
	public String popup(Principal prc,Model model,HttpServletRequest req) {
		
		String name = prc.getName();
		P_MemberDTO Pdto = usedService.getMemberDto(name);
		
		// req.getSession().setAttribute("login", Pdto);
		
		model.addAttribute("login",Pdto);
		
		return "popup";
	}
	
	@PostMapping("popupAf")	// 인증 완료 후 도착하는 컨트롤러
	public void popupAf(String s_id, @RequestParam(required = false, defaultValue="") String postcode,
			@RequestParam(required = false, defaultValue="") String address, @RequestParam(required = false, defaultValue="") String detailaddress,
			HttpServletRequest req,Principal prc) {
		
		if(postcode.equals("") || postcode == null || address.equals("") || address == null || 
				detailaddress.equals("") || detailaddress == null) {
			boolean b  = usedService.setSellerMember(s_id);
			boolean c = usedService.insertSeller(prc.getName());
		} else {
			
			((P_MemberDTO)req.getSession().getAttribute("login")).setPostcode(postcode);
			((P_MemberDTO)req.getSession().getAttribute("login")).setAddress(address);
			((P_MemberDTO)req.getSession().getAttribute("login")).setDetailAddress(detailaddress);		// 세션에 담겨있는 정보를 수정해 줌..(일단 작업하기위해서)
			
			boolean b = usedService.setSellerMember((P_MemberDTO)req.getSession().getAttribute("login"));		// 오버라이딩해서 매개변수를 다르게 설정해주었다 (복습)
			boolean c = usedService.insertSeller(prc.getName());
		}
		
	}
	
	@GetMapping("usedwrite")	// 중고상품 글 쓰기
	public String usedwrite(HttpServletRequest req, Model model) {
		
		return "usedwrite.tiles";
	}
	
	@RequestMapping(value="usedwriteAf", method = RequestMethod.POST)	// 중고상품 글 쓰고 난 후 컨트롤러
	public String usedwriteAf(ProductsDto Pdto, MultipartHttpServletRequest mfreq,
			HttpServletRequest req) throws Exception {
		
		ProductsDto dto = new ProductsDto(0,
				Pdto.getS_id(),
				Pdto.getCategory(),
				Pdto.getTitle(),
				Pdto.getContent(),
				Pdto.getPrice(),
				Pdto.getQuantity(),
				Pdto.getPlace(),
				Pdto.getPhoto(),
				Pdto.getPhoto_sys(),
				Pdto.getDivision(),
				Pdto.getLikes());

		List<MultipartFile> list = mfreq.getFiles("files");

		int size = list.size();
		
		
		Iterator<String> files = mfreq.getFileNames();
		
		MultipartFile mpf = mfreq.getFile(files.next());
		
		String path = req.getServletContext().getRealPath("/upload/used");
		
		
		String photo = "";
		String photo_sys = "";
         
		if(list != null && size > 0) {
			for(MultipartFile mf : list) {
				String originFileName = mf.getOriginalFilename();
	            String systemFileName = System.currentTimeMillis() + originFileName;	            
   
	            photo += originFileName + ",";
	            photo_sys += systemFileName + ",";
	            
	            long fileSize = mf.getSize();
      
				FileOutputStream fs = new FileOutputStream(path + "/" + systemFileName);
				
				// System.out.println(path); // 업로드 경로
				
				fs.write(mf.getBytes());
				fs.close();

			}
		}
		dto.setPhoto(photo);
		dto.setPhoto_sys(photo_sys);
		
		boolean b = usedService.UsedWrite(dto);
		
		return "redirect:/used/usedlist";		

	}
	
	@RequestMapping(value="usedupdateAf", method = RequestMethod.POST)	// 중고상품 글쓰기 수정 
	public String usedupdateAf(ProductsDto Pdto, MultipartHttpServletRequest mfreq,
			HttpServletRequest req,String[] originfile) throws Exception {
		
		String photo = "";
		String photo_sys = "";
			
		for (int i = 0; i < originfile.length; i++) {
			photo_sys += originfile[i];
			photo_sys += ",";
		}
		
		List<MultipartFile> list = mfreq.getFiles("files");
		int size = list.size();
		Iterator<String> files = mfreq.getFileNames();
		MultipartFile mpf = mfreq.getFile(files.next());
		String path = req.getServletContext().getRealPath("/upload/used");
   
		if(list != null && size > 0) {
			for(MultipartFile mf : list) {
				String originFileName = mf.getOriginalFilename().trim();
	            String systemFileName = System.currentTimeMillis() + originFileName;	            
	            
				if(!mf.getOriginalFilename().equals("")) {
		            
		            photo += originFileName + ",";
		            photo_sys += systemFileName + ",";
	          
		            long fileSize = mf.getSize();
					FileOutputStream fs = new FileOutputStream(path + "/" + systemFileName);
					 fs.write(mf.getBytes());
					 fs.close();				     
				}
			}
		}
		 Pdto.setPhoto(photo);
		 Pdto.setPhoto_sys(photo_sys);
		 boolean b = usedService.UsedUpdate(Pdto);

		 return "redirect:/used/usedlist";
	}
	
	@GetMapping(value="/addlikes")	// 좋아요 추가,삭제
	@ResponseBody
		public String addlikes(int bno, String mname) {
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("bno", bno);
		map.put("mname", mname);
		
		 boolean b = usedService.getlikes(map);
		 int num;	// ajax 리턴 변수
		 
		 if(b) {	// 회원의 좋아요 여부 확인
			 usedService.deletelikes(map);
			 num = 0;
		 } else {
			 usedService.addlikes(map);
			 num = 1;
		 }

		return num+"";
	}
		
	@GetMapping(value="/likeCount")	// 각 게시글 마다 좋아요 개수 구하기
	@ResponseBody
		public String likeCount(int bno) {
		
		int count = usedService.getboardlikes(bno);
		return count+"";
	}
	
	@GetMapping(value="/getSeller")	// 셀러 여부 확인
	@ResponseBody
	public String getSeller(String s_id,Principal prc) {
		
		int count = usedService.getSellerid(s_id);
		
		return count+"";
	}
	
	@GetMapping(value="/blacklist")	// 블랙리스트, 신고하기 기능
	@ResponseBody
	public String blacklist(String str,int seq,String id,String b_id) {
		
		String count = "";
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		map.put("str",str);
		map.put("seq",seq);
		map.put("id", id);
		map.put("b_id",b_id);
		
		boolean b = usedService.setblackList(map);
		
		if(b) count = "1";
		 else count = "0"; 
		
		return count;
	}
	
	@GetMapping(value = "/SendSms")	// 문자 전송 api
	@ResponseBody
	  public String sendSms(HttpServletRequest request) throws Exception {
	
		int count = usedService.getSellerCount( (String)request.getParameter("id") );

		if(count <= 3) {

	    String api_key = "NCSJIOFN175HJZRU";
	    String api_secret = "G1OPKSUUMY3GWZTTVAFZ5BDXOAGPYRFK";
	  
	    
	    Coolsms coolsms = new Coolsms(api_key, api_secret);
	    
	    HashMap<String, String> set = new HashMap<String, String>();

	    set.put("to", (String)request.getParameter("to")); // 받는사람
	    set.put("from", "01068889859"); // 보내는사람
	    set.put("text", "안녕하세요 인증번호는 ["+(String)request.getParameter("text")+"]입니다"); // 문자내용
	    set.put("type", "sms"); // 문자 타입

	    System.out.println(set);

	    JSONObject result = coolsms.send(set); // 보내기&전송결과받기

	    if ((boolean)result.get("status") == true) {
	      // 메시지 보내기 성공 및 전송결과 출력
	      System.out.println(result.get("group_id")); // 그룹아이디
	      System.out.println(result.get("result_code")); // 결과코드
	      System.out.println(result.get("result_message")); // 결과 메시지
	      System.out.println(result.get("success_count")); // 메시지아이디
	      System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
	    } else {
	      // 메시지 보내기 실패
	      System.out.println(result.get("code")); // REST API 에러코드
	      System.out.println(result.get("message")); // 에러메시지
	    }
	    
	    return "해당 번호로 문자를 발송하였습니다 인증횟수("+count+"/3)회";
	    
	}
	    
	    
	    else {
			return "인증한도 3회를 초과하였습니다 고객센터에 문의하세요";
		}
		
	    
	  }
}


