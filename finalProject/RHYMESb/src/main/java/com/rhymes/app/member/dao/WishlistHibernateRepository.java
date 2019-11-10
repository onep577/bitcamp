package com.rhymes.app.member.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import com.rhymes.app.member.model.mypage.MemberProductDTO;

@Repository
public class WishlistHibernateRepository {

	@PersistenceContext
    EntityManager em;

    /** 상품번호에 맞는 상품정보 리턴
     * @param p_seq
     * @return
     */
    public MemberProductDTO findProduct(int p_seq){
          return em.find(MemberProductDTO.class, p_seq);
    }

}
