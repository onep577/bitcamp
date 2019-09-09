package bit.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.YoutubeDao;
import bit.com.a.model.YoutubeSave;

@Repository
public class YoutubeDaoImpl implements YoutubeDao {

	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Youtube.";

	// 유튜브 저장
	@Override
	public boolean writeYoutube(YoutubeSave ys) throws Exception {
		int n = sqlSession.insert(namespace + "writeYoutube", ys);
		return n>0?true:false;
	}

	// 유튜브 가져오기
	@Override
	public YoutubeSave getYoutube(YoutubeSave ys) throws Exception {
		YoutubeSave you = sqlSession.selectOne(namespace + "getYoutube", ys);
		return you;
	}

	// 유튜브 전체 다 가져오기
	@Override
	public List<YoutubeSave> getYoutubeList(YoutubeSave ys) throws Exception {
		List<YoutubeSave> list = sqlSession.selectList(namespace + "getYoutubeList", ys);
		return list;
	}
	
}
