package main;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.BbsDto;
import dto.BbsParam;
import dto.MemberDto;

public class mainClass {

	public static void main(String[] args) {
		
		String res = "mybatis/config.xml";
		
		try {
			// mybatis 설정 파일을 읽어 들인다
			InputStream is = Resources.getResourceAsStream(res);
			
			// SqlSessionFactory 객체를 취득한다
			SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(is);
			
			// SqlSession 객체를 취득
			SqlSession session = factory.openSession();
			
			// insert
			/*
			MemberDto dto = new MemberDto("aaa", "111", "aaa111");
			//MemberDto dto = new MemberDto("bbb", "222", "bbb222");
			//MemberDto dto = new MemberDto("ccc", "333", "ccc333");
			
			int n = session.insert("add", dto);
			
			if(n > 0) {
				session.commit();
				System.out.println("추가 성공");
			}else {
				session.rollback();
				System.out.println("추가 실패");
			}
			/**/
			
			// delete
			/*
			String findId = "aaa";
			int n = session.delete("remove", findId);
			 
			if(n > 0) {
				session.commit();
				System.out.println("삭제 성공");
			}else {
				session.rollback();
				System.out.println("삭제 실패");
			}
			/**/
			
			// delete
			/*
			MemberDto dto = new MemberDto("aaa", null, "");
			int n = session.delete("removeobj", dto);
			if(n > 0) {
				session.commit();
				System.out.println("삭제 성공");
			}else {
				session.rollback();
				System.out.println("삭제 실패");
			}
			/**/
			
			// update
			/*
			MemberDto dto = new MemberDto("aaa", "111", "222");
			int n = session.update("update", dto);
			if(n > 0) {
				session.commit();
				System.out.println("수정 성공");
			}else {
				session.rollback();
				System.out.println("수정 실패");
			}
			/**/
			
			// select
			String fId = "aaa";
			
			MemberDto _dto = session.selectOne("find", fId);
			System.out.println(_dto.toString());
			
			// select list
			List<MemberDto> list = session.selectList("alllist");
			for(MemberDto mem : list) {
				System.out.println(mem.toString());
			}
			
			// search
			BbsParam bp = new BbsParam("1", "", "title");
			
			List<BbsDto> bbslist = session.selectList("search", bp);
			for(BbsDto bbs : bbslist) {
				System.out.println(bbs.toString());
			}
						
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		

	} // main 함수

}
