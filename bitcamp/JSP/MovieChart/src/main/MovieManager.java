package main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import dto.MovieVo;

public class MovieManager {
	
	public static List<MovieVo> getCGVdata(){
		
		Document doc;
		
		List<MovieVo> list = new ArrayList<MovieVo>();
		
		try {
			doc = Jsoup.connect("http://www.cgv.co.kr/movies/").get();

			// 영화 제목
			Elements titles = doc.select("div.box-contents strong.title");
			// div.box-contents 박스 컨텐츠에 접근 할 수 있다
					
			/*
			<div class="box-contents">
	            <a href="/movies/detail-view/?midx=82012">
	                <strong class="title">엑시트</strong>
	            </a>
			*/
			
			// 좋아요
			Elements likes = doc.select("div.box-contents span.count strong i");
			
			/*
			<div class="box-contents">
	            <a href="/movies/detail-view/?midx=82012">
	                <strong class="title">엑시트</strong>
	            </a>
	
	            <div class="score">
	                <strong class="percent">예매율<span>18.7%</span></strong>
	                <!--[2015-12-10] 에그포인트 적용 범위1~ 3위. start : add_mwpark-->
	                <div class="egg-gage small">
	                    <span class="egg great"></span>
						<span class="percent">97%</span>
					</div>
	                <!--[2015-12-10] 에그포인트 적용 범위 1~ 3위. end : add_mwpark-->
	                <!-- [2015-12-11] 무비 차트 평점 개편 별점 UI 삭제 start : del_mwpark
	                    <div class="point">
	                        <em>97.0</em>
	                    </div>
	                [2015-12-11] 무비 차트 평점 개편 별점 UI 삭제 start : del_mwpark-->
	            </div>
	
	            <span class="txt-info">
	                <strong>
	                    2019.07.31 
	                    <span>개봉</span>
	                    
	                </strong>
	            </span>
	            <span class="like"> 
	                <button class="btn-like" value="82012">영화 찜하기</button>
	                <span class="count"> 
	                    <strong><i>8,852</i><span>명이 선택</span></strong> 

			*/
			
			for(int i = 0; i < 7; i++) {
				Element eTitle = titles.get(i);
				String title = eTitle.text();
				//System.out.print((i+1) + " - 영화제목 : " + title);
				
				Element eLike = likes.get(i);
				String slike = eLike.text().replace(",", "");
				//System.out.println(", 좋아요 : " + slike);
				int like = Integer.parseInt(slike);
				
				MovieVo vo = new MovieVo();
				vo.setTitle(title);
				vo.setLike(like);
				
				list.add(vo);
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return list;
		
	} // getCGVdata 함수

}
