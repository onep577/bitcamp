package bit.com.a.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.YoutubeDao;
import bit.com.a.model.YoutubeSave;
import bit.com.a.service.YoutubeService;

@Service
public class YoutubeServiceImpl implements YoutubeService {
	
	@Autowired
	YoutubeDao youtubeDao;

	// 유튜브 저장
	@Override
	public boolean writeYoutube(YoutubeSave ys) throws Exception {
		return youtubeDao.writeYoutube(ys);
	}

	// 유튜브 가져오기
	@Override
	public YoutubeSave getYoutube(YoutubeSave ys) throws Exception {
		return youtubeDao.getYoutube(ys);
	}

	// 유튜브 전체 다 가져오기
	@Override
	public List<YoutubeSave> getYoutubeList(YoutubeSave ys) throws Exception {
		return youtubeDao.getYoutubeList(ys);
	}

}
