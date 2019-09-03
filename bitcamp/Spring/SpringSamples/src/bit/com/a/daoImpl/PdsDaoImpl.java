package bit.com.a.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.PdsDao;
import bit.com.a.model.PdsDto;

@Repository
public class PdsDaoImpl implements PdsDao {

	// sqlSession은 ibatis 소속이고 sqlsessiontemplate은 mybatis 소속이다 차이가 거의 없다
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace = "Pds.";

	// 파일 전체 보기
	@Override
	public List<PdsDto> getPdsList() {		
		return sqlSession.selectList(namespace + "getPdsList");
	}

	// 파일 업로드
	@Override
	public boolean uploadPds(PdsDto dto) {
		int n = sqlSession.insert(namespace + "uploadPds", dto);
		return n>0?true:false;
	}

	// 파일 삭제
	@Override
	public boolean delete(int seq) throws Exception {
		int n = sqlSession.delete(namespace + "delete", seq);
		return n>0?true:false;
	}

	// 하나의 파일 가져오기
	@Override
	public PdsDto getPds(int seq) throws Exception {
		PdsDto dto = sqlSession.selectOne(namespace + "getPds", seq);
		return dto;
	}
	
}
