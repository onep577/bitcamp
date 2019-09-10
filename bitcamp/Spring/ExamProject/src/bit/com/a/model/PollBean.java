package bit.com.a.model;

import java.io.Serializable;
import java.util.Date;

import bit.com.a.util.DateUtil;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

// 투표 작성자가 작성해서 넘겨준 경우, 받는 데이터들
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PollBean implements Serializable {
	private String title;				// 시험명
	
	
	private int subject_seq;			// 과목코드
	private int exam_seq;				// 시험코드
	private String question;			// 질문
	private String question_sub;		// 상세 질문
	private String itemcount;			// 질문의 갯수
	private String pollsub1;			// 보기1
	private String pollsub2;			// 보기2
	private String pollsub3;			// 보기3
	private String pollsub4;			// 보기4
	private String pollsubtotal1;		// 1번 투표한 사람 수
	private String pollsubtotal2;		// 2번 투표한 사람 수
	private String pollsubtotal3;		// 3번 투표한 사람 수
	private String pollsubtotal4;		// 4번 투표한 사람 수
	private String answer;				// 정답
	
	
	private String teacher;				// 출제자
	private int syear;					// 시작일
	private int smonth;
	private int sday;	
	private int eyear;					// 종료일
	private int emonth;
	private int eday;
	private Date sdate;
	private Date edate;
	
	

	
	public Date getSdate() {
		return DateUtil.toDate(getSyear(), getSmonth(), getSday());
	}
	
	public Date getEdate() {
		return DateUtil.toDate(getEyear(), getEmonth(), getEday());
	}

	public PollBean(String title, String question, String question_sub, String itemcount, String pollsub1,
			String pollsub2, String pollsub3, String pollsub4, String answer, String teacher, Date sdate, Date edate) {
		super();
		this.title = title;
		this.question = question;
		this.question_sub = question_sub;
		this.itemcount = itemcount;
		this.pollsub1 = pollsub1;
		this.pollsub2 = pollsub2;
		this.pollsub3 = pollsub3;
		this.pollsub4 = pollsub4;
		this.answer = answer;
		this.teacher = teacher;
		this.sdate = sdate;
		this.edate = edate;
	}	
	

}
