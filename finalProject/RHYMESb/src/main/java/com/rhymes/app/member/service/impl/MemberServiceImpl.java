package com.rhymes.app.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.rhymes.app.admin.events.model.CouponDetailDTO;
import com.rhymes.app.common.util.MypageUtils;
import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;
import com.rhymes.app.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	


	@Autowired
	private MemberDAO memberdao;
	
	private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	// 아이디체크
	@Override
	public int getIDCheck(MemberDTO mem) {
		return memberdao.getIDCheck(mem);
	}

	// 회원가입
	@Override
	public boolean getAddmem(MemBean bean) {
		
		// 공통
		MemberDTO mem = new MemberDTO( 
										bean.getUserid().trim(), 
										passwordEncoder.encode(bean.getUserpw()));
		
		boolean b = memberdao.getAddmem(mem);
		
		// 추가
		P_MemberDTO pmem = new P_MemberDTO(
											bean.getUserid().trim(), 
											bean.getUsername(),
											bean.getPostcode(),
											bean.getAddress(),
											bean.getDetailAddress(),
											bean.getPhone(),
											bean.getUseremail(),
											bean.getGender(),
											bean.getBirth(),
											bean.getCount());
		
		// 권한
		AuthoritiesDTO amem = new AuthoritiesDTO(bean.getUserid(), bean.getAuthority());

		List<CouponDetailDTO> coupon = MypageUtils.getRandCoupsTimestampList(0,1);
		MemberCouponDTO coudto = new MemberCouponDTO();
		
		for (CouponDetailDTO cou : coupon) {
			coudto.setCoup_code(cou.getCoup_code());
		}
		coudto.setUserid(bean.getUserid());
		
		if(b) {
			memberdao.getPAddmem(pmem);
			memberdao.getAuthAddmem(amem);
			
			// 웰컴쿠폰
			memberdao.getmem_cp(coudto);	
		}

		return b;

	}


	// 사업자번호 체크
	@Override
	public String getCRCheck(SellerCRnumDTO crdto) {
		return memberdao.getCRCheck(crdto);
	}
	// 라임즈에 사업자번호가 등록되어있는지 확인
	@Override
	public int getCRCYN(SellerCRnumDTO crnum) {
		
		String cnum = crnum.getCrnum1()+"-"+crnum.getCrnum2()+"-"+crnum.getCrnum3();
		SellerDTO sdto = new SellerDTO();
		sdto.setC_num(cnum);
		return memberdao.getCRCYN(sdto);
	}

	// 사업자 회원가입
	@Override
	public void getAddSeller(SellerBean sellerbean, MemberDTO memdto) {

		// 공통
		MemberDTO mem = new MemberDTO(memdto.getUserid(), 
										passwordEncoder.encode(memdto.getUserpw()));
		
		// 사업자 추가정보
		
		// 사업자번호
		String c_num = sellerbean.getCrnum1()+"-"+sellerbean.getCrnum2()+"-"+sellerbean.getCrnum3();
		// 담당자이메일
		String ic_email = sellerbean.getIc_email1()+"@"+sellerbean.getIc_email2();
		
		SellerDTO sel = new SellerDTO(	0,
										memdto.getUserid(),
										sellerbean.getC_name(),
										c_num,
										sellerbean.getP_name(),
										sellerbean.getC_postcode(),
										sellerbean.getC_address(),
										sellerbean.getC_detailAddress(),
										sellerbean.getC_cond(),
										sellerbean.getC_type(),
										sellerbean.getIc_name(),
										sellerbean.getTo(),
										ic_email,
										sellerbean.getS_postcode(),
										sellerbean.getS_address(),
										sellerbean.getS_detailAddress(),
										sellerbean.getR_postcode(),
										sellerbean.getR_address(),
										sellerbean.getR_detailAddress(),
										sellerbean.getC_code());
		
		// 권한
		AuthoritiesDTO amem = new AuthoritiesDTO(memdto.getUserid(), sellerbean.getAuthority());
		
		boolean b = memberdao.getAddmem(mem);
		
		if(b) {
			memberdao.getAddSeller_C(sel);
			memberdao.getAuthAddmem(amem);
		}

	}

	// id찾기
	@Override
	public String getFindID(MemBean mbean) {
		
		String foundId = "";	
		
		String eID = memberdao.getFindID_E(mbean);		// email를 넣어서 id를 뽑아냄
		MemberDTO mem = new MemberDTO(eID, null);
		
		String getuserpw = memberdao.getFindID_P(mem);	// db에 저장되어있는 pw를 뽑아냄
		
		boolean b = passwordEncoder.matches(mbean.getUserpw(), getuserpw);
		if(b) {
			foundId = eID;
		}else {
			foundId = "N";
		}		

		return foundId;
	}


	@Override
	public String getusertel(P_MemberDTO pmem) {
		return memberdao.getusertel(pmem);
	}

	@Override
	public void getuserpwreset(MemberDTO mem) {
		mem.setUserpw(passwordEncoder.encode(mem.getUserpw()));
		memberdao.getuserpwreset(mem);
	}

	@Override
	public SellerDTO getfindid_seller(SellerBean sbean) {
		
		String c_num = sbean.getCrnum1()+"-"+sbean.getCrnum2()+"-"+sbean.getCrnum3();
		
		SellerDTO sdto = new SellerDTO(null,sbean.getC_name(), c_num);
		
		return memberdao.getfindid_seller(sdto);
	}

	@Override
	public boolean getfindpw_seller(SellerBean sbean) {
		
		String c_num = sbean.getCrnum1()+"-"+sbean.getCrnum2()+"-"+sbean.getCrnum3();
		
		SellerDTO sdto = new SellerDTO(sbean.getUserid(),sbean.getC_name(), c_num);
		
		return memberdao.getfindpw_seller(sdto);	// 사업자 id,상호명,email이 일치하다면 비밀번호 수정하기

		
	}

	@Override
	public void getkakaoregi(MemBean mbean) {
		
		MemBean mb = new MemBean(mbean.getUseremail(), passwordEncoder.encode(mbean.getUserpw()), 
				mbean.getUsername(), mbean.getUseremail(), "ROLE_MEMBER", "KAKAO");
		
		memberdao.getkakaoregi(mb);
		
		AuthoritiesDTO amem = new AuthoritiesDTO(mbean.getUseremail(), "ROLE_MEMBER");
		memberdao.getAuthAddmem(amem);
		
	}

	// 카카오 유저 확인ㄴ
	@Override
	public boolean getkakaouser(MemBean mbean) {
		return memberdao.getsnsuser(mbean);
	}

	// 카카오 이메일과 다른 이메일로 회원가입 했을 경우
	/*
	 * @Override public boolean getSnsUserName(MemBean mbean) { return
	 * memberdao.getSnsUserName(mbean); }
	 */
	
	// 네이버 유저확인
	@Override
	public boolean getNaveruser(MemBean mbean) {
		mbean.setUserid(mbean.getUseremail());
		
		return memberdao.getsnsuser(mbean);
	}

	@Override
	public void getNaverRegi(MemBean mbean) {
		
		MemBean mb = new MemBean(mbean.getUseremail(), passwordEncoder.encode(mbean.getUsername()), 
					mbean.getUsername(), mbean.getUseremail(), "ROLE_MEMBER", "NAVER");
		
		memberdao.getNaverRegi(mb);
		
		AuthoritiesDTO amem = new AuthoritiesDTO(mbean.getUseremail(), "ROLE_MEMBER");
		memberdao.getAuthAddmem(amem);
		
	}

	// 사업자 이메일 등록확인
	@Override
	public boolean getEmailCheck_C(String email) {
		return memberdao.getEmailCheck_C(email);
	}
	// 일반회원 이메일 등록확인
	@Override
	public boolean getEmailCheck_P(String email) {
		return memberdao.getEmailCheck_P(email);
	}




	








}
