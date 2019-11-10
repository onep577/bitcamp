package com.rhymes.app.member.model.mypage;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemberReviewBbsDTO {
	
	private int seq;	//후기 고유번호
	private int pd_seq;	//후기가 참조하는 주문 디테일 ID(seq)
	private String userid;	//후기작성자 ID
	
	private String title;	//제목
	private String content;	//내용
	private String img;		//첨부파일
	
	private int likes_cnt;	//좋아요 수
	private int ref;		//원본글
	private int step;		//원본글과의 거리
	private int depth;		//답글 깊이
	private int del;		//삭제여부(1=삭제)
	private int parent;		//부모글 번호(seq)
	
	private String rdate;	//등록일
	
	public MemberReviewBbsDTO() {}
	
	/**새 후기 작성 용도 생성자
	 * @param pd_seq
	 * @param userid
	 * @param title
	 * @param content
	 */
	public MemberReviewBbsDTO(int pd_seq, String userid, String title, String content) {
		this.pd_seq = pd_seq;
		this.userid = userid;
		this.title = title;
		this.content = content;
	}	
}
