package com.rhymes.app.admin.excel.model;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@SuppressWarnings("serial")
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AdminExcelProductDTO implements Serializable {
	private int stock_seq;
	private int p_seq;
	private String size;
	private int quantity;
	
	private String c_name;
	private String p_name;
	private String p_title;
	private String cp_code;
	private int p_price;
	private int bfs_price;
	private String p_color;
	private String c1_name;
	private String c2_name;
	private String c3_name;
	private String nation;
	private String mdate;
	private String detail;
	private String photo1_file;
	private String photo2_file;
	private String photo3_file;
	private String photo4_file;
	private String photo5_file;
	private Date rdate;
}
