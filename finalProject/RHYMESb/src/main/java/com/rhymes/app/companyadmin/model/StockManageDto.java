package com.rhymes.app.companyadmin.model;

import java.io.Serializable;

public class StockManageDto implements Serializable {

			// 정렬
			private String sorting;
			
			// 검색
			private String keyword;	  // 검색어
			private String criterion; // 상품이름 OR 브랜드이름
			
			// 업체명
			private String c_name;
			
			// 카테고리
			private String c1_name;
			private String c2_name;
			private String c3_name;
			
			private int c1_seq;
			private int c2_seq;
			private int c3_seq;
			
			// 페이징
			private int pageNumber = 0;				
			private int recordCountPerPage = 10; 	// 표현할 한 페이지의 글 수
			
			// DB용 변수 : [1] ~ [10]
				private int start = 0;
				private int end = 10;
				public String getKeyword() {
					return keyword;
				}
				public void setKeyword(String keyword) {
					this.keyword = keyword;
				}
				public String getCriterion() {
					return criterion;
				}
				public void setCriterion(String criterion) {
					this.criterion = criterion;
				}
				public String getC1_name() {
					return c1_name;
				}
				public void setC1_name(String c1_name) {
					this.c1_name = c1_name;
				}
				public String getC2_name() {
					return c2_name;
				}
				public void setC2_name(String c2_name) {
					this.c2_name = c2_name;
				}
				public String getC3_name() {
					return c3_name;
				}
				public void setC3_name(String c3_name) {
					this.c3_name = c3_name;
				}
				public int getPageNumber() {
					return pageNumber;
				}
				public void setPageNumber(int pageNumber) {
					this.pageNumber = pageNumber;
				}
				public int getRecordCountPerPage() {
					return recordCountPerPage;
				}
				public void setRecordCountPerPage(int recordCountPerPage) {
					this.recordCountPerPage = recordCountPerPage;
				}
				public int getStart() {
					return start;
				}
				public void setStart(int start) {
					this.start = start;
				}
				public int getEnd() {
					return end;
				}
				public void setEnd(int end) {
					this.end = end;
				}
				public int getC1_seq() {
					return c1_seq;
				}
				public void setC1_seq(int c1_seq) {
					this.c1_seq = c1_seq;
				}
				public int getC2_seq() {
					return c2_seq;
				}
				public void setC2_seq(int c2_seq) {
					this.c2_seq = c2_seq;
				}
				public int getC3_seq() {
					return c3_seq;
				}
				public void setC3_seq(int c3_seq) {
					this.c3_seq = c3_seq;
				}
				public String getSorting() {
					return sorting;
				}
				public void setSorting(String sorting) {
					this.sorting = sorting;
				}
				
				public String getC_name() {
					return c_name;
				}
				public void setC_name(String c_name) {
					this.c_name = c_name;
				}
	
}
