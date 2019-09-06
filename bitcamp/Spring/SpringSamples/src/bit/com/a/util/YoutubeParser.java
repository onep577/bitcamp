package bit.com.a.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.activation.URLDataSource;

import org.springframework.stereotype.Component;

import bit.com.a.model.Youtube;

// 파싱 : xml 코드에서 태그는 필요없다 그 안의 값만 가져오는 것을 파싱이라고 한다
// 파서 : 파싱만 하는 프로그램

// @Component
// DI : 의존성
// YoutubeParser를 사용하기 위해서 객체를 어딘가 등록해야 한다
// 스프링 프레임워크가 프레임워크에 등록한다 싱글톤 패턴으로 운영한다
// 첫번째는 htmls가 null값이지만 두번째는 htmls에 값이 있기 때문에
// htmls.clear()를 해서 비워준다

@Component
public class YoutubeParser {
	
	// 비트캠프를 검색한 후 나온 url은 https://www.youtube.com/results?search_query=비트캠프이다
	// urls는 검색어 즉, 비트캠프 전까지 가져온다
	String urls = "https://www.youtube.com/results?search_query=";
	ArrayList<String> htmls = new ArrayList<String>();
	
	public ArrayList<String> search(String s) {
		//System.out.println("search()");
		
		// 첫번째는 비어있지만 두번째는 값이 있다 그래서 clear한다
		htmls.clear();
		
		// buffer라는 빈 공간을 만든다
		BufferedReader br = null;
		
		try {
			// 매개변수로 들어온 s를 utf-8로 변환한다
			String ss = URLEncoder.encode(s, "utf-8");
			
			// ss는 검색어 즉, 비트캠프를 utf-8으로 변환시킨 것이다
			// url은 검색한 유투브의 전체 url이다 https://www.youtube.com/results?search_query=비트캠프이다
			URL url = new URL(urls + ss);
			
			// BufferedReader는 buffer라는 공간에서 읽는다는 뜻
			// InputStreamReader는 안으로 들어오는 흐름을 읽는다는 뜻
			// buffer라는 공간에 url을 담는다
			br = new BufferedReader(new InputStreamReader(url.openStream(), "utf-8"));
			
			String msg = "";
			while((msg = br.readLine()) != null) {
				// contains 는 긁어올 부분의 클래스
				if(msg.trim().contains("class=\"yt-uix-tile-link yt-ui-ellipsis yt-ui-ellipsis-2 yt-uix-sessionlink")) {
					htmls.add(msg.trim());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return htmls;		
	} // search 함수

	
	
	
	// &이후를 제거		/watch?v=비트캠프짱&asdf
	public String toUrl(String msg) {
		String tt = "";
		if(msg.indexOf("&") == -1) {
			// &이후가 없으면
			tt = msg;
			
		}else {
			// &이후가 있으면
			tt = msg.substring(0, msg.indexOf("&"));
			
		}
		return tt;
	}
	
	

	
	
	// 제목
	// 검색한 키워드가 있을때만 들어온다
	public ArrayList<Youtube> getTitles(String key) {
		//System.out.println("getTitles()");
		
		ArrayList<Youtube> af = new ArrayList<Youtube>();
		int i = 0;
		
		ArrayList<String> asd = search(key);
		
		for(int j = 0; j < asd.size(); j++) {
			try {
			// ?
			String fu[] = asd.get(i).split("\"");
			String url = URLDecoder.decode(fu[5], "EUB-KR");
			String title = URLDecoder.decode(fu[11], "EUC-KR");
			
			// title, url, img
			Youtube f = new Youtube(title, toUrl(url), "");
		
			af.add(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			i++;
		}
		return af;
	}

}
