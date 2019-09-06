package bit.com.a.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.YoutubeDao;

@Repository
public class YoutubeDaoImpl implements YoutubeDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Youtube.";
	
}
