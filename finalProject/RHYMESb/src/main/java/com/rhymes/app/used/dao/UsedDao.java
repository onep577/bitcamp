package com.rhymes.app.used.dao;

import java.util.List;
import java.util.Map;

import com.rhymes.app.member.model.MemberDTO;
import com.rhymes.app.member.model.P_MemberDTO;
import com.rhymes.app.used.model.BbsParam;
import com.rhymes.app.used.model.CommentsDto;
import com.rhymes.app.used.model.NotesRecvParam;
import com.rhymes.app.used.model.ProductsDto;

public interface UsedDao {

	boolean UsedWrite(ProductsDto dto);

	List<ProductsDto> getUsedList(BbsParam param);

	ProductsDto getUsedDetail(int seq);

	int getSellerCount(String parameter);

	P_MemberDTO getMemberDto(String userid);

	boolean setSellerMember(String s_id);
	
	boolean setSellerMember(P_MemberDTO p_MemberDTO);

	boolean addlikes(Map<String,Object> map);

	boolean getlikes(Map<String, Object> map);

	int getboardlikes(int seq);

	boolean deletelikes(Map<String, Object> map);

	List<CommentsDto> getComments(CommentsDto cDto);

	boolean addComments(Map<String, Object> map);

	boolean updateComment(Map<String,Object> map);

	boolean updateReadCount(int seq);

	boolean deleteComment(Map<String, Object> map);

	boolean insertanswer(Map<String, Object> map);

	boolean usedUpdate(ProductsDto dto);

	int getBbsCount(BbsParam param);

	int getSellerid(String s_id);

	boolean deleteProduct(int seq);

	boolean setblackList(Map<String, Object> map);

	int getCommentCount(CommentsDto cDto);

	boolean insertSeller(String id);
	
}
