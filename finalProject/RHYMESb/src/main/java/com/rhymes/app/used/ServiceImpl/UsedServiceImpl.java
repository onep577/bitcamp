package com.rhymes.app.used.ServiceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.Service.UsedService;
import com.rhymes.app.used.dao.UsedDao;
import com.rhymes.app.used.model.BbsParam;
import com.rhymes.app.used.model.CommentsDto;
import com.rhymes.app.used.model.NotesRecvParam;
import com.rhymes.app.used.model.ProductsDto;

@Service
public class UsedServiceImpl implements UsedService {
	@Autowired UsedDao usedDao;

	@Override
	public boolean UsedWrite(ProductsDto dto) {
		// TODO Auto-generated method stub
		return usedDao.UsedWrite(dto);
	}

	@Override
	public List<ProductsDto> getUsedList(BbsParam param) {
		// TODO Auto-generated method stub
		return usedDao.getUsedList(param);
	}

	@Override
	public ProductsDto getUsedDetail(int seq) {
		// TODO Auto-generated method stub
		return usedDao.getUsedDetail(seq);
	}

	@Override
	public int getSellerCount(String parameter) {
		// TODO Auto-generated method stub
		return usedDao.getSellerCount(parameter);
	}

	@Override
	public P_MemberDTO getMemberDto(String userid) {
		// TODO Auto-generated method stub
		return usedDao.getMemberDto(userid);
	}

	@Override
	public boolean setSellerMember(String s_id) {
		// TODO Auto-generated method stub
		return usedDao.setSellerMember(s_id);
	}

	@Override
	public boolean setSellerMember(P_MemberDTO p_MemberDTO) {
		// TODO Auto-generated method stub
		return usedDao.setSellerMember(p_MemberDTO);
	}

	@Override
	public boolean addlikes(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.addlikes(map);
	}

	@Override
	public boolean getlikes(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.getlikes(map);
	}

	@Override
	public int getboardlikes(int seq) {
		// TODO Auto-generated method stub
		return usedDao.getboardlikes(seq);
	}

	@Override
	public boolean deletelikes(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.deletelikes(map);
	}

	@Override
	public List<CommentsDto> getComments(CommentsDto cDto) {
		// TODO Auto-generated method stub
		return usedDao.getComments(cDto);
	}

	@Override
	public boolean addComments(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.addComments(map);
	}

	@Override
	public boolean updateComment(Map<String,Object> map) {
		// TODO Auto-generated method stub
		return usedDao.updateComment(map);
	}

	@Override
	public boolean updateReadCount(int seq) {
	
		return usedDao.updateReadCount(seq);
	}

	@Override
	public boolean deleteComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.deleteComment(map);
	}

	@Override
	public boolean insertanswer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.insertanswer(map);
	}

	@Override
	public boolean UsedUpdate(ProductsDto dto) {
		// TODO Auto-generated method stub
		return usedDao.usedUpdate(dto);
	}

	@Override
	public int getBbsCount(BbsParam param) {
		// TODO Auto-generated method stub
		return usedDao.getBbsCount(param);
	}

	@Override
	public int getSellerid(String s_id) {
		// TODO Auto-generated method stub
		return usedDao.getSellerid(s_id);
	}

	@Override
	public boolean deleteProduct(int seq) {
		// TODO Auto-generated method stub
		return usedDao.deleteProduct(seq);
	}

	@Override
	public boolean setblackList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return usedDao.setblackList(map);
	}

	@Override
	public int getCommentCount(CommentsDto cDto) {
		// TODO Auto-generated method stub
		return usedDao.getCommentCount(cDto);
	}

	@Override
	public boolean insertSeller(String id) {
		// TODO Auto-generated method stub
		return usedDao.insertSeller(id);
	}
}
