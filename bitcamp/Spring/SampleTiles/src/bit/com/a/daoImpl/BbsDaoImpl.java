package bit.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.BbsDao;
import bit.com.a.model.BbsDto;

//org.springframework를 pom.xml에 넣으면 @Repository를 사용할 수 있다
@Repository		// 저장소
public class BbsDaoImpl implements BbsDao {

	// org.springframework를 pom.xml에 넣으면 @Autowired를 사용할 수 있다
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Bbs.";
	
	// log4j
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(BbsDaoImpl.class);

	// 전체 리스트 갖고 게시판으로 이동
	@Override
	public List<BbsDto> bbsList() {
		logger.info("BbsDaoImpl bbsList()");
		List<BbsDto> list = sqlSession.selectList(namespace + "bbsList");

		return list;
	}
	
	// 게시판 글쓰기
	@Override
	public boolean bbsWrite(BbsDto dto) {
		logger.info("BbsDaoImpl bbsWrite() : " + dto.toString());
		int count = sqlSession.insert(namespace + "insert", dto);

		return count>0?true:false;
	}

	// 해당 글 선택하면 조회수 증가
	@Override
	public boolean bbsReadCount(int seq) {
		logger.info("BbsDaoImpl bbsReadCount : " + seq);
		int count = sqlSession.update(namespace + "readCount", seq);

		return count>0?true:false;
	}

	// detail에서 게시글 가져오기
	@Override
	public BbsDto getBbs(int seq) {
		logger.info("BbsDaoImpl getBbs : " + seq);
		BbsDto dto = sqlSession.selectOne(namespace + "getBbs", seq);

		return dto;
	}

	// 게시글 삭제
	@Override
	public boolean bbsDelete(int seq) {
		int count = sqlSession.update(namespace + "delete", seq);

		return count>0?true:false;
	}

	// 게시글 수정
	@Override
	public boolean bbsUpdate(BbsDto dto) {
		int count = sqlSession.update(namespace + "update", dto);

		return count>0?true:false;
	}

	@Override
	public boolean answer(BbsDto dto) {
		int count = sqlSession.update(namespace + "answerupdate", dto.getSeq());
		
		int count2 = sqlSession.insert(namespace + "answerinsert", dto);
		
		boolean b = false;
		if(count > 0 && count2 > 0) {
			b = true;
		}

		return b;
	}
	
}
