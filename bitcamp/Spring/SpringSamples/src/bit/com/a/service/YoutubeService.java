package bit.com.a.service;

import java.util.List;

import bit.com.a.model.YoutubeSave;

public interface YoutubeService {

	// 유튜브 저장
	public boolean writeYoutube(YoutubeSave ys) throws Exception;
	
	// 유튜브 가져오기
	public YoutubeSave getYoutube(YoutubeSave ys) throws Exception;
	
	// 유튜브 전체 다 가져오기
	public List<YoutubeSave> getYoutubeList(YoutubeSave ys) throws Exception;

}
