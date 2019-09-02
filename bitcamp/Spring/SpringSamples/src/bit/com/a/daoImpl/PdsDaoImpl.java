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

	@Override
	public List<PdsDto> getPdsList() {		
		return sqlSession.selectList(namespace + "getPdsList");
	}

	@Override
	public boolean uploadPds(PdsDto dto) {
		int n = sqlSession.insert(namespace + "uploadPds", dto);
		return n>0?true:false;
	}
	
}
