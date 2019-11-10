package com.rhymes.app.member.model.mypage;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

/**JPA Hibernate 활용을 위한 Entity Class
 * @author minhj
 *
 */
@Getter
@Setter
@ToString
@Entity
@Table(name = "rhyStoreProduct")//카멜표기법은 자동으로 스네이크 표기법으로 변환(ex rhy_store_product)
public class MemberProductDTO {

	@Id
	@GeneratedValue
	private int pSeq;

	private String cName;
	private String pName;
	private String pTitle;
	private String cpCode;
	
	private int pPrice;
	private int bfsPrice;
	
	private String pColor;
	private String c1_name;
	private String c2_name;
	private String c3_name;
	private String nation;
	
	private String mdate;
	private String detail;
	
	private String photo1_file;
	
}
