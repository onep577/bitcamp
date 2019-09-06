package bit.com.a.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.YoutubeDao;
import bit.com.a.service.YoutubeService;

@Service
public class YoutubeServiceImpl implements YoutubeService {
	
	@Autowired
	YoutubeDao youtubeDao;

}
