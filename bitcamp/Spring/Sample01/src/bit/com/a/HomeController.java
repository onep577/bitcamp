package bit.com.a;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/home")
	public ModelAndView home() {
		
		//System.out.println("HomeController home()");
		// 몇시 몇분에 디버깅 되었는지도 볼 수 있다
		logger.info("HomeController home : " + new Date());

		ModelAndView view = new ModelAndView();
		view.setViewName("/home");	// home.jsp
		
		return view;
	}
	
	// 외부에서는 hello.do를 보고 들어온다
	@RequestMapping(value="hello.do", method=RequestMethod.GET)
	public String myHello(Model model) {
		// model의 목적은 날려주기 위해서이다
		// 컨트롤러의 메소드이다 myHello 이름이 달라도 된다 하지만 대부분 맞춘다
		
		logger.info("HomeController myHello " + new Date());
		
		// request.setAttribute
		model.addAttribute("name", "홍길동");
		
		// 가고 싶은 파일의 파일명이다
		// myHello.jsp
		return "myHello";
	}

	

}
