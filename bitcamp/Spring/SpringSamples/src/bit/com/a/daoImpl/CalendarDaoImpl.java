package bit.com.a.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.CalendarDao;
import bit.com.a.model.CalendarDto;
import bit.com.a.model.CalendarParam;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	// org.springframework를 pom.xml에 넣으면 @Autowired를 사용할 수 있다
	@Autowired
	SqlSession sqlSession;
	
	String namespace = "Calendar.";
	
	// log4j
	// 현재 클래스에서 Logger를 사용하겠다
	Logger logger = LoggerFactory.getLogger(CalendarDaoImpl.class);

	@Override
	public List<CalendarDto> getCalendarList(CalendarParam calparam) throws Exception {
		logger.info("일정 전체 가져오기");
		List<CalendarDto> list = sqlSession.selectList(namespace + "callist", calparam);
		
		return list;
	}

	// 일정 쓰기
	@Override
	public boolean calwriteAf(CalendarDto dto) throws Exception {
		logger.info("일정쓰기");		
		int count = sqlSession.insert(namespace + "calwriteAf", dto);

		return count>0?true:false;
	}

	// 하루 전체 일정 보기
	@Override
	public List<CalendarDto> getdayList(String date) throws Exception {
		logger.info("그날의 일정 가져오기");
		List<CalendarDto> list = sqlSession.selectList(namespace + "getdayList", date);

		return list;
	}

	// 하나의 일정보기
	@Override
	public CalendarDto getdetail(int seq) throws Exception {
		logger.info("하나의 일정 가져오기");
		CalendarDto dto = sqlSession.selectOne(namespace + "getdetail", seq);
		
		return dto;
	}
	
	// 하나의 일정 삭제
	@Override
	public boolean delete(int seq) throws Exception {
		logger.info("하나의 일정 삭제");
		int count = sqlSession.delete(namespace + "delete", seq);

		return count>0?true:false;
	}

	// 하나의 일정 수정
	@Override
	public boolean update(CalendarDto dto) throws Exception {
		logger.info("하나의 일정 수정");
		int count = sqlSession.update(namespace + "update", dto);

		return count>0?true:false;
	}

}
