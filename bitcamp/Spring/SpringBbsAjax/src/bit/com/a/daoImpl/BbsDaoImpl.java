package bit.com.a.daoImpl;

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
	
	String namespace = "Member.";
	
	// log4j
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(BbsDaoImpl.class);	
	
	// 게시판 글쓰기
	@Override
	public boolean bbsWrite(BbsDto dto) {
		logger.info("BbsDaoImpl bbsWrite : " + dto.toString());

		return false;
	}
	
}
