package com.rhymes.app.used.daoImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.BbsParam;
import com.rhymes.app.used.model.CommentsDto;
import com.rhymes.app.used.model.NotesRecvParam;
import com.rhymes.app.used.model.ProductsDto;

@Repository
public class UsedDaoImpl implements UsedDao {

	@Autowired
	SqlSession sqlSession;

	String ns = "Used.";

	@Override
	public boolean UsedWrite(ProductsDto dto) { // 중고 게시글 작성
		// TODO Auto-generated method stub

		int n = sqlSession.insert(ns + "write", dto);

		return n > 0 ? true : false;
	}

	@Override
	public List<ProductsDto> getUsedList(BbsParam param) { // 중고 게시글 리스트를 불러온다
		// TODO Auto-generated method stub

		List<ProductsDto> list = sqlSession.selectList(ns + "getUsedList", param);

		return list;
	}

	@Override
	public ProductsDto getUsedDetail(int seq) { // 중고 게시글 상세보기를 시퀀스값으로 찾는다
		// TODO Auto-generated method stub

		ProductsDto dto = sqlSession.selectOne(ns + "getUsedDetail", seq);

		return dto;
	}

	@Override
	public int getSellerCount(String parameter) { // 판매자 등록시 본인인증 횟수를 DB에서 꺼낸다
		sqlSession.update(ns + "updateSellerCount", parameter);

		int count = sqlSession.selectOne(ns + "getSellerCount", parameter);

		return count;
	}

	@Override
	public P_MemberDTO getMemberDto(String id) { // 아이디로 판매자정보를 얻는다
		P_MemberDTO dto = sqlSession.selectOne(ns + "getMember", id);

		return dto;
	}

	@Override
	public boolean setSellerMember(String s_id) { // 본인인증이 완료되면 데이터베이스에 판매자 등록을 시켜준다

		int n = sqlSession.insert(ns + "setSellerMember", s_id);

		return n > 0 ? true : false;
	}

	@Override
	public boolean setSellerMember(P_MemberDTO p_MemberDTO) { // 주소를 추가로 입력시 개인회원 테이블에 주소를 업데이트 시켜준다

		sqlSession.update(ns + "setSelleraddress", p_MemberDTO);

		int n = sqlSession.insert(ns + "setSellerMember2", p_MemberDTO);

		return n > 0 ? true : false;
	}

	@Override
	public boolean addlikes(Map<String, Object> map) { // 좋아요 클릭 ajax
		int count = sqlSession.delete(ns + "addlikes", map);
		return count > 0 ? true : false;

	}

	@Override
	public boolean getlikes(Map<String, Object> map) { // 좋아요 클릭 ajax
		int count = sqlSession.selectOne(ns + "getlikes", map);
		return count > 0 ? true : false;
	}

	@Override
	public int getboardlikes(int seq) { // 게시글별 좋아요 개수를 구한다
		int count = sqlSession.selectOne(ns + "getboardlikes", seq);
		return count;
	}

	@Override
	public boolean deletelikes(Map<String, Object> map) { // 좋아요 ajax 삭제
		int count = sqlSession.delete(ns + "deletelikes", map);

		return count > 0 ? true : false;
	}

	@Override
	public List<CommentsDto> getComments(CommentsDto cDto) { // 댓글목록을 ajax로 불러온다
		List<CommentsDto> list = sqlSession.selectList(ns + "getComments", cDto);

		return list;
	}

	@Override
	public boolean addComments(Map<String, Object> map) { // 댓글을 ajax로 추가한다
		int n = sqlSession.insert(ns + "addComments", map);
		return n > 0 ? true : false;
	}

	@Override
	public boolean updateComment(Map<String, Object> map) { // ajax로 댓글을 업데이트 해준다
		int n = sqlSession.update(ns + "updateComment", map);
		return n > 0 ? true : false;
	}

	@Override
	public boolean updateReadCount(int seq) { // 게시글 조회수
		int n = sqlSession.update(ns + "updateReadCount", seq);
		return n > 0 ? true : false;
	}

	@Override
	public boolean deleteComment(Map<String, Object> map) { // ajax로 댓글을 삭제한다
		int n = sqlSession.delete(ns + "deleteComment", map);

		return n > 0 ? true : false;
	}

	@Override
	public boolean insertanswer(Map<String, Object> map) { // ajax로 댓글의 답글을 단다
		sqlSession.update(ns + "updateanswer", map);

		int n = sqlSession.insert(ns + "insertanswer", map);

		return n > 0 ? true : false;
	}

	@Override
	public boolean usedUpdate(ProductsDto dto) { // 게시글 수정

		int n = sqlSession.update(ns + "usedupdate", dto);
		return n > 0 ? true : false;
	}

	// 페이징을 위한 게시글 총 개수 구하기
	@Override
	public int getBbsCount(BbsParam param) {
		int n = sqlSession.selectOne(ns + "getBbsCount", param);
		return n;
	}

	@Override
	public int getSellerid(String s_id) { // 셀러의 아이디를 조회한다
		int n = sqlSession.selectOne(ns + "getSellerid", s_id);

		return n;
	}

	@Override
	public boolean deleteProduct(int seq) { // 중고제품 삭제
		int n = sqlSession.delete(ns + "deleteProduct", seq);

		return n > 0 ? true : false;
	}

	@Override
	public boolean setblackList(Map<String, Object> map) { // 신고하기 기능
		int n = sqlSession.insert(ns + "setblackList", map);

		return n > 0 ? true : false;
	}

	@Override
	public int getCommentCount(CommentsDto cDto) { // 댓글의 총 개수를 구한다
		int count = sqlSession.selectOne(ns + "getCommentCount", cDto);

		return count;
	}

	@Override
	public boolean insertSeller(String id) {
		int count = sqlSession.insert(ns + "insertSeller", id);
		return count > 0 ? true : false;
	}

}
