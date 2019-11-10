package com.rhymes.app.member.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.dao.MemberDAO;
import com.rhymes.app.member.model.AuthoritiesDTO;
import com.rhymes.app.member.model.MemBean;
import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.member.model.SellerBean;
import com.rhymes.app.member.model.SellerCRnumDTO;
import com.rhymes.app.member.model.SellerDTO;
import com.rhymes.app.member.model.mypage.MemberCouponDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "member.";
	
	@Override
	public MemberDTO getOneMemberByMemberId(String id) {
		return sqlSession.selectOne( ns + "getOneMemberByMemberId", id);
	}
	
	
	
	// id체크
		@Override
		public int getIDCheck(MemberDTO mem) {
			return sqlSession.selectOne(ns+"getIDCheck", mem);
		}

		// 회원가입
		@Override
		public boolean getAddmem(MemberDTO mem) {
			int n = sqlSession.insert(ns+"getAddmem", mem);
			return n>0?true:false;			
		}
		// 회원가입 추가정보
		@Override
		public void getPAddmem(P_MemberDTO pmem) {
			sqlSession.insert(ns+"getPAddmem", pmem);		
		}
		// 회원가입 권한
		@Override
		public void getAuthAddmem(AuthoritiesDTO amem) {
			sqlSession.insert(ns+"getAuthAddmem", amem);			
		}
		// 웰컴쿠폰
		@Override
		public void getmem_cp(MemberCouponDTO coudto) {
			sqlSession.insert(ns+"getmem_cp", coudto);
			
		}

		// 사업자번호 체크
		@Override
		public String getCRCheck(SellerCRnumDTO crdto) {
			return sqlSession.selectOne(ns+"getCRCheck", crdto);
		}

		// 사업자 추가 회원가입
		@Override
		public void getAddSeller_C(SellerDTO sel) {
			sqlSession.insert(ns+"getAddSeller_C", sel);
		}

		@Override
		public int getCRCYN(SellerDTO sdto) {
			return sqlSession.selectOne(ns+"getCRCYN", sdto);
		}
		
		@Override
		public String getFindID_E(MemBean mbean) {
			return sqlSession.selectOne(ns+"getFindID_E", mbean);
		}

		@Override
		public String getFindID_P(MemberDTO mem) {
			return sqlSession.selectOne(ns+"getFindID_P", mem);
		}

		@Override
		public String getusertel(P_MemberDTO pmem) {
			return sqlSession.selectOne(ns+"getusertel", pmem);
		}

		@Override
		public void getuserpwreset(MemberDTO mem) {
			sqlSession.update(ns+"getuserpwreset", mem);
			
		}

		// 사업자 id찾기
		@Override
		public SellerDTO getfindid_seller(SellerDTO sdto) {
			return sqlSession.selectOne(ns+"getfindid_seller", sdto);
		}

		// 사업자pw찾기
		@Override
		public boolean getfindpw_seller(SellerDTO sdto) {
			int n = sqlSession.selectOne(ns+"getfindpw_seller", sdto);
			return n>0?true:false;
		}
		
		// 카ㅣ카오 회원가입
		@Override
		public void getkakaoregi(MemBean mb) {
			sqlSession.insert(ns+"getsnsregi", mb);
			sqlSession.insert(ns+"getsnsregi_p", mb);
			
		}
		
	/*
	 * //카카오이메일과 다른 이메일로 회원가입 했을 경우
	 * 
	 * @Override public boolean getSnsUserName(MemBean mbean) { return
	 * sqlSession.selectOne(ns+"getSnsUserName", mbean); }
	 */

		// sns유저확인
		@Override
		public boolean getsnsuser(MemBean mbean) {
			int n = sqlSession.selectOne(ns+"getsnsuser", mbean);
			return n>0?true:false;
		}

		@Override
		public void getNaverRegi(MemBean mb) {
			sqlSession.insert(ns+"getsnsregi", mb);
			sqlSession.insert(ns+"getsnsregi_p", mb);
			
		}


		// 사업자 이메일 등록 확인
		@Override
		public boolean getEmailCheck_C(String email) {
			int count = sqlSession.selectOne(ns+"getEmailCheck_C", email);
			return count>0?true:false;
		}


		// 일반회원 이메일 등록 확인
		@Override
		public boolean getEmailCheck_P(String email) {
			int count = sqlSession.selectOne(ns+"getEmailCheck_P", email);
			return count>0?true:false;
		}





		

		




	
}
