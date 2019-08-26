package bit.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BitMemberDao;
import bit.com.a.service.BitMemberService;

@Service
public class BitMemberServiceImpl implements BitMemberService {

	@Autowired			// DI: 의존성
	private BitMemberDao bitMemberDao;
	// 스프링 프레임웍이 알아서 넣어준다 즉, 의존성
	// 자동적으로 스프링 프레임웍이 생성된다 자동으로 연결해준다
	// 자동적으로 상속받은 자식 클래스를 찾는다
	// 인스턴스가 구현된다 동적할당
	// BitMemberDao bitMemberDao = new BitMemberDaoImpl();
	// 두개가 같은 말이다 하지만 new를 쓰면 안된다 왜? 규칙에 위해된다

}
