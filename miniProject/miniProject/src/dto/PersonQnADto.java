package dto;

import java.io.Serializable;

public class PersonQnADto implements Serializable {
	
	private int seq;
	private String id;
	private String title;
	private String content;
	private String wdate;
	private int answer_check;
	private String question_type;
	private String comments;
	
	public PersonQnADto() {
	}

	public PersonQnADto(int seq, String id, String title, String content, String wdate, int answer_check,
			String question_type, String comments) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.answer_check = answer_check;
		this.question_type = question_type;
		this.comments = comments;
	}

	public PersonQnADto(String id, String title, String content, String question_type, String comments) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.question_type = question_type;
		this.comments = comments;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getAnswer_check() {
		return answer_check;
	}

	public void setAnswer_check(int answer_check) {
		this.answer_check = answer_check;
	}

	public String getQuestion_type() {
		return question_type;
	}

	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "PersonQnADto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate="
				+ wdate + ", answer_check=" + answer_check + ", question_type=" + question_type + ", comments="
				+ comments + "]";
	}
	
	
	

}
