package com.rhymes.app.member.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.web.csrf.CsrfToken;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rhymes.app.admin.event.controller.AdminEventController;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.service.MemberService;
import com.rhymes.app.member.service.impl.KakaoAPI;
import com.rhymes.app.member.util.Coolsms;
import com.rhymes.app.member.util.RhymesMailling;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping(value = "/member/*")
public class MemberController {

	@Autowired
	private MemberService memService;
	@Autowired
	private KakaoAPI kakao;

	/*
	 * NaverLoginBO private NaverLoginBO naverLoginBO; private String apiResult =
	 * null;
	 * 
	 * @Autowired private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
	 * this.naverLoginBO = naverLoginBO; }
	 */

	HttpSession session;

	// 회원가입 선택 창
	@GetMapping("/regiMain")
	public String regimain() {
		return "rhyregimain";
	}

	// 일반회원 회원가입 창
	@GetMapping("/regimember")
	public String regimember() {
		return "rhyregimember";
	}

	// 사업자 회원가입 창
	@GetMapping("/regiseller")
	public String regiseller() {
		return "rhyregiseller";
	}

	// id체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getIDCheck")
	public String getIDCheck(MemberDTO mem, HttpServletRequest req) {

		String userid = (String) req.getParameter("id");

		mem.setUserid(userid);

		int count = memService.getIDCheck(mem);

		String msg = "";
		if (count > 0) {
			msg = "YES";
		} else {
			msg = "NO";
		}

		return msg;
	}

	// 일반회원가입
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addmem")
	public String addmem(MemBean bean, HttpServletRequest req) {

		boolean b = memService.getAddmem(bean);	// 공통, 추가, 권한, 쿠폰 insert
		
		return "rhyregisuc";
	}

	// 사업자회원가입(공통)
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addseller")
	public String addseller(HttpServletRequest req, SellerCRnumDTO crdto, Model model) {

		req.getSession().setAttribute("crdto", crdto);

		model.addAttribute("crdto", crdto);

		return "rhyregisellerdetail";
	}

	// 사업자회원가입(사업자 추가정보)
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/addsellerdetail")
	public String addsellerdetail(HttpServletRequest req, MemberDTO mem, SellerBean sellerbean, Model model) {

		memService.getAddSeller(sellerbean, mem); // 사업자 회원가입
		
		model.addAttribute("auth", mem.getAuthList());
		model.addAttribute("auth", "ROLE_SELLER");
		return "rhyregisuc";
	}

	// 사업자 번호조회 api
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getCRCheck99999999")
	public String getCRCheckAPI(HttpServletRequest req, SellerCRnumDTO crdto) {

		int crnum1 = Integer.parseInt(req.getParameter("_c_num1"));
		int crnum2 = Integer.parseInt(req.getParameter("_c_num2"));
		int crnum3 = Integer.parseInt(req.getParameter("_c_num3"));
		BufferedReader br = null;
		String result = "";
		String msg = "";
		try {
			String urlstr = "http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?ldong_addr_mgpl_dg_cd=41&ldong_addr_mgpl_sggu_cd=117&ldong_addr_mgpl_sggu_emd_cd=101&wkpl_nm=삼성전자&bzowr_rgst_no=124815&pageNo=10&startPage=10&numOfRows=1&pageSize=1&serviceKey=vDwpNyDDSgPT9K58OQdG1rHmcKsy7tI%2BTDCcS6vdn1lOvzUZsoAETPrlBcpCdVmIlGH51ZtyvZxjtnMl8SNbDA%3D%3D";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

			String line;
			while ((line = br.readLine()) != null) {
				result = result + line + "\n";
			}
		} catch (Exception e) {
			log.warn("실패메시지: "+e.getMessage());
		}

		if (result == "<OpenAPI_ServiceResponse>" + "<cmmMsgHeader>" + "<errMsg>SERVICE ERROR</errMsg>"
				+ "<returnAuthMsg>SERVICE_ACCESS_DENIED_ERROR</returnAuthMsg>"
				+ "<returnReasonCode>20</returnReasonCode>" + "</cmmMsgHeader>" + "</OpenAPI_ServiceResponse>") {
			msg = "NO";
		}

		return result;
	}

	// 사업자번호 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getCRCheck")
	public String getCRCheck(HttpServletRequest req, SellerCRnumDTO crdto) {

		int crnum1 = Integer.parseInt(req.getParameter("_c_num1"));
		int crnum2 = Integer.parseInt(req.getParameter("_c_num2"));
		int crnum3 = Integer.parseInt(req.getParameter("_c_num3"));

		crdto.setCrnum1(crnum1);
		crdto.setCrnum2(crnum2);
		crdto.setCrnum3(crnum3);

		// 사업자테이블에 있는지, 우리사이트에 등록된 사업자인지 확인
		int count = memService.getCRCYN(crdto); // 이미 등록되어있는지 확인

		String crname = "";
		String msg = "";

		if (count != 0) { // 라임즈에 등록되어있는 사업자번호
			msg = "1";
		} else {

			crname = memService.getCRCheck(crdto); // 사업자번호명단에 있는지 확인

			if (crname == "" || crname == null) {
				msg = "NO";
			} else {
				msg = crname;
			}

		}

		return msg;
	}

	// 사업자 회원가입 이메일 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getEmailCheck")
	public String getEmailCheck(HttpServletRequest req) {
		
		String e1 = (String) req.getParameter("e1");
		String e2 = (String) req.getParameter("e2");
		String userEmail = e1 + "@" + e2;

		boolean b = memService.getEmailCheck_C(userEmail);
		boolean c = memService.getEmailCheck_P(userEmail);
		
		if(b||c) {
			return "no";
		}else {
			String code = "";
			code = (String) req.getParameter("code");
			
			RhymesMailling.sendMail(RhymesMailling.getAuthorizationCode(code), userEmail);
			
			String msg = code;
			
			return msg;
		}
	}

	// 이메일 체크
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getEmailCheck2")
	public String getEmailCheck2(HttpServletRequest req) {

		String useremail = (String) req.getParameter("useremail");

		String code = "";
		code = (String) req.getParameter("code");

		RhymesMailling.sendMail(RhymesMailling.getAuthorizationCode(code), useremail);

		String msg = code;

		return msg;
	}

	// 전화번호 인증
	@ResponseBody
	@RequestMapping(value = "/sendSms.do", method = RequestMethod.GET)
	public String sendSms(HttpServletRequest request) throws Exception {

		String api_key = "NCS4ZFTWNHGBIKUM";
		String api_secret = "TPH57XEIXFFDAUXJV3EBNDDS633YNFG2";

		Coolsms coolsms = new Coolsms(api_key, api_secret);

		HashMap<String, String> set = new HashMap<String, String>();

		set.put("to", (String) request.getParameter("to")); // 받는 사람
		set.put("from", "01083256825"); // 발신번호
		set.put("text", "비마켓 인증번호 [" + (String) request.getParameter("text") + "]"); // 문자내용
		set.put("type", "sms"); // 문자 타입
		System.out.println( (String) request.getParameter("text"));
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기

		if ((boolean) result.get("status") == true) {
			// 메시지 보내기 성공 및 전송결과 출력
			log.warn("msg전송 성공");

		} else {
			// 메시지 보내기 실패
			log.warn("msg전송 실패");
		}

		return "suc";
	}

	// id찾기 view이동
	@GetMapping("/getfindid")
	public String findid() {
		return "rhyfindid";
	}

	// id찾기
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getFindID")
	public String getFindID(MemBean mbean, Model model) {

		String foundId = memService.getFindID(mbean);
		String userid = foundId; // 이메일로 아이디를 보낼 때 사용

		String msg = "";
		String founduserid = "";
		if (foundId.equals("N")) { // 일치하는 아이디 없음
			msg = "N";
			return "redirect:/member/getfindid";
		} else {
			msg = foundId.substring(0, foundId.length() - 3);
			founduserid = msg + "***";
		}

		model.addAttribute("founduserid", founduserid);
		model.addAttribute("userid", userid);
		model.addAttribute("useremail", mbean.getUseremail());

		return "rhyfindAf";
	}

	// id이메일로 보내기
	@GetMapping("/getFindIDEmail")
	public String getFindIDEmail(P_MemberDTO pmem, Model model) {

		String useremail = pmem.getUseremail();
		String userid = pmem.getUserid();

		RhymesMailling.sendMailId(RhymesMailling.getAuthorizationid(userid), useremail);
		
		model.addAttribute("text", "회원님의 이메일로 id를 보냈습니다.");
		
		return "rhyfindsuc";
	}

	// 사업자 아이디 찾기
	@RequestMapping(method = { RequestMethod.POST, RequestMethod.GET }, path = "/getFindID_seller")
	public String getfindid_seller(SellerBean sbean, Model model) {

		SellerDTO sdto = memService.getfindid_seller(sbean);

		String msg = "";
		String sellerid = "";

		if (sdto.getId() == "" || sdto.getId() == null) {
			return "rhyfindid";
		} else {

			msg = sdto.getId().substring(0, sdto.getId().length() - 3);
			sellerid = msg + "***";

			model.addAttribute("foundsellerid", sellerid); // id***
			model.addAttribute("sellerid", sdto.getId()); // 사업자 아이디
			model.addAttribute("selleremail", sdto.getIc_email()); // 사업자 이메일
			return "rhyfindsellefAf";

		}

	}

	// 사업자 id 이메일로 보내기
	@GetMapping("/getFindIDEmail_seller")
	public String getFindIDEmail_seller(SellerDTO sdto, Model model) {

		String ic_email = sdto.getIc_email();
		String id = sdto.getId();

		RhymesMailling.sendMailId(RhymesMailling.getAuthorizationid(id), ic_email);

		model.addAttribute("text", "회원님의 이메일로 id를 보냈습니다.");

		return "rhyfindsuc";
	}

	// 사업자 비밀번호 찾기
	@GetMapping("/getFindPw_seller")
	public String getFindPw_seller(SellerBean sbean, Model model) {

		boolean b = memService.getfindpw_seller(sbean);

		if (b) {
			model.addAttribute("userid", sbean.getUserid());
			return "rhyfindpw";
		} else {
			return "rhypwreset";
		}

	}

	// 비밀번호 찾기
	@GetMapping("/getfindpw")
	public String getfindpw() {
		return "rhyfindpw";
	}

	@GetMapping("/getFindPWtel")
	public String getFindPWtel(P_MemberDTO pmem, Model model) {
		
		String userid = memService.getusertel(pmem);
		
		if (!userid.equals(pmem.getUserid())) {
			return "rhyfindpw";
		} else {
			model.addAttribute("userid", userid);
			return "rhypwreset";
		}

	}

	// 비밀번호 수정
	@GetMapping("/userpwreset")
	public String userpwreset(MemberDTO mem, HttpServletRequest req, Model model) {

		memService.getuserpwreset(mem);
		model.addAttribute("text", "비밀번호가 성공적으로 변경되었습니다.");

		return "rhyfindsuc";

	}

	// 카카오 회원가입
	@RequestMapping(value = "/member/kakaoLogin", produces = "application/json", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, HttpServletRequest req, HttpSession session,
			Model model, MemBean mbean) {

		CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(req);

		String access_Token = kakao.getAccessToken(code);
		HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);

		mbean.setUserid((String) userInfo.get("email"));
		mbean.setUsername((String) userInfo.get("nickname"));
		
		boolean b = memService.getkakaouser(mbean); /* select해서 찾은이메일이 없다면 밑에 실행 */
		
		
		
		if (b) {	// rhymes회원일 경우
			req.getSession().setAttribute("userloginid", (String) userInfo.get("nickname"));

			model.addAttribute("username", (String) userInfo.get("email"));
			model.addAttribute("password", (String) userInfo.get("nickname"));
			model.addAttribute("_csrf", token);
//			model.addAttribute("_csrf", CsrfToken.class.getName());
			
			return "kakaologinsuc";
		} else if (userInfo.get("email") != null) {		// rhymes회원이 아닐경우, 회원가입 시 email정보제공을 체크 했을 때
			req.getSession().setAttribute("userloginid", (String) userInfo.get("nickname"));

			String useremail = (String) userInfo.get("email");
			String username = (String) userInfo.get("nickname");
			String userpw = (String) userInfo.get("nickname"); // 비밀번호 대용

			mbean.setUseremail(useremail);
			mbean.setUsername(username);
			mbean.setUserpw(userpw);

			memService.getkakaoregi(mbean); // email, 이름, pw를 넣음, sns로그인구분

			model.addAttribute("username", (String) userInfo.get("email"));
			model.addAttribute("password", (String) userInfo.get("nickname"));
			model.addAttribute("_csrf", token);
			
			// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
//			session.setAttribute("email", userInfo.get("email"));
//			session.setAttribute("access_Token", access_Token);
//			model.addAttribute("userInfo", userInfo);

			return "kakaologinsuc";

		} else {	// rhymes회원이 아니고, 회원가입 시 email추가정보 제공을 누르지 않았을 때 (/kakaoregiAf로 넘어감(추가정보입력을 위해))

			String username = (String) userInfo.get("nickname");
			String userpw = (String) userInfo.get("nickname"); // 비밀번호 대용

			mbean.setUsername(username);
			mbean.setUsername(userpw);

			model.addAttribute("username", username);
			model.addAttribute("userpw", userpw);

			return "kakaoLoginadd";
		}
		/*
		 * else { return "login"; }
		 */

	}

	// 카카오 추가정보 입력 후 로그인 
	@GetMapping("/kakaoregiAf")
	public String kakaoregiAf(MemBean mbean, HttpServletRequest req, Model model) {

		memService.getkakaoregi(mbean);
//		model.addAttribute("text", "비밀번호가 성공적으로 변경되었습니다.");

		CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(req);

		model.addAttribute("username", mbean.getUseremail());
		model.addAttribute("password", mbean.getUserpw());
		model.addAttribute("_csrf", token);
		req.getSession().setAttribute("userloginid", mbean.getUserpw());
		return "kakaologinsuc";

	}
	

	// 로그아웃	------사용안함------------------------------------------------
	@GetMapping("/kakaoLogout")
	public String logout(HttpSession session) {
		kakao.kakaoLogout((String) session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("userId");
		return "main/welcome";
	} //---------------------------------------------------------------------
	
	// 네이버 callback
	@GetMapping("/callback")
	public String navercallback(HttpSession session) {
		return "navercallback";
	}
	
	
	/**
	 * apiResult json 구조 {"resultcode":"00", "message":"success",
	 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"shinn0608@naver.com","name":"\uc2e0\ubc94\ud638"}}
	 **/
	// 네이버 회원가입
	@GetMapping("/loginPostNaver")
	public String loginPOSTNaver(Model model, HttpSession session, MemBean mbean, HttpServletRequest req) {

		CsrfToken token = new HttpSessionCsrfTokenRepository().loadToken(req);
		
		boolean b = memService.getNaveruser(mbean);
		req.getSession().setAttribute("userloginid", mbean.getUsername());
		if(b) {
			model.addAttribute("username", mbean.getUseremail());
			model.addAttribute("password", mbean.getUsername());
			model.addAttribute("_csrf", token);
			
			return "kakaologinsuc";
		}
		
		memService.getNaverRegi(mbean);
		model.addAttribute("username", mbean.getUseremail());
		model.addAttribute("password", mbean.getUsername());
		model.addAttribute("_csrf", token);
		
		return "kakaologinsuc";
	}

	
	
	
	
	
	
	
	
	
	
	




}
