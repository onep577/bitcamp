package com.rhymes.app.member.service;

import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;

public interface MemberService{
	
	// 아이디 체크
	public int getIDCheck(MemberDTO mem);
	
	// 일반회원가입 insert
	public boolean getAddmem(MemBean bean);
	
	// 사업자번호 체크
	public String getCRCheck(SellerCRnumDTO crdto);
	
	// 라임즈에 사업자번호 등록되어있는지 확인
	public int getCRCYN(SellerCRnumDTO crnum);
	
	// 사업자 회원가입 insert
	public void getAddSeller(SellerBean sellerbean, MemberDTO mem);
	
	// id찾기
	public String getFindID(MemBean mbean);
	
	// 비밀번호 찾기
	public String getusertel(P_MemberDTO pmem);
	
	// 비밀번호 재설정
	public void getuserpwreset(MemberDTO mem);
	
	// 사업자 id찾기
	public SellerDTO getfindid_seller(SellerBean sbean);
	
	// 사업자 pw찾기
	public boolean getfindpw_seller(SellerBean sbean);
	
	// 카카오 회원가입
	public void getkakaoregi(MemBean mbean);
	
	// 카카오 로그인
	public boolean getkakaouser(MemBean mbean);
	
	// 카카오이메일과 다른 이메일로 가입했을 경우
//	public boolean getSnsUserName(MemBean mbean);
	
	// 네이버 유저확인
	public boolean getNaveruser(MemBean mbean);
	
	// 네이버 유저 회원가입
	public void getNaverRegi(MemBean mbean);
	
	// 사업자 이메일 등록 확인
	public boolean getEmailCheck_C(String email);
	
	// 일반회원 이메일 등록 확인
	public boolean getEmailCheck_P(String email);
	
}
