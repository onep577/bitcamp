package bit.com.a;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.HelloController;
import bit.com.a.model.MyClass;
import bit.com.a.model.MyData;

@Controller
public class HelloController {

	// 현재 클래스에서 Logger를 사용하겠다
	private static final Logger logger = LoggerFactory.getLogger(HelloController.class);
	
	@RequestMapping(value = "hello.do", method = RequestMethod.GET)
	public String hello(Model model) {
		// 리퀘스트를 추가하는 이유는 session에 접근할 때
		
		// system.out.println 보다 가벼워서 권장한다 강요는 아니다
		logger.info("HelloController hello()");
		
		MyClass cls = new MyClass();
		cls.setNumber(1001);
		cls.setName("홍길동");
		
		model.addAttribute("mycls", cls);
		
		return "hello";
	}

	/* {RequestMethod.GET, RequestMethod.POST} */
	// get으로 오던 post로 오던 상관없다
	
	/* 2 */
	@RequestMapping(value= "inputData.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String inputData(Model model, MyClass mycls) {
		// 기본생성자가 없으면 위에 코드에서 에러난다 왜? 파라미터로 받으니까
		logger.info("HelloController inputData()");
		// 자동적으로 프레임웍이 넣어준다
		// parseInt 안해도 된다, request.getParameter로 안 받아도 된다
		// (Model model, Int number, String name) 로 할 수도 있지만 하나 하나씩 다 받아줘야 한다
		// model은 날라온 데이터 다시 날려주려고 할 때 필요하다
		// model은 반드시 써야하는 것은 아니다
		
		// 넘겨주고 넘겨 받는것이 아주 편하다 이것을 의존성이라고 한다
		// dependencies
		
		logger.info(mycls.toString());		
		model.addAttribute("mycls", mycls);
		
		return "hello";		
	}
	
	/* 3 */
	@RequestMapping(value = "move.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String move() {
		logger.info("HelloController move()");
		
		// sendRedirect 이다 데이터를 가져가진 않고 controller에서 controller로 이동만 한다
		return "redirect:/hello.do";
		//return "forward:/hello.do";
	}
	
	/* 4 */
	// ajax는 @ResponseBody를 꼭 써야한다
	@ResponseBody
	@RequestMapping(value = "idcheck.do",
					produces = "application/String; charset=utf-8",
					method= {RequestMethod.GET, RequestMethod.POST})
	public String idcheck(String id) {
		logger.info("HelloController idcheck()");
		logger.info("id : " + id);
		
		// 답글의 경우 한글이 넘어오는 경우가 많다 produces로 한글 깨짐현상을 방지하자
		//String str = "OK";
		String str = "오케이";

		// ajax는 데이터를 가지고 가는 용도이다
		return str;
	}
	
	/* 5 */
	@ResponseBody
	@RequestMapping(value = "account.do", method = RequestMethod.POST)
	public Map<String, Object> account(MyData my) {
		logger.info("HelloController account()" + new Date());
		logger.info(my.toString());
		// 넘어온 데이터 확인
		
		// DB 접근
		
		// 넘길 데이터 준비
		Map<String, Object> rmap = new HashMap<String, Object>();
		
		rmap.put("msg", "메시지입니다");
		rmap.put("data", "홍길동");
		
		String str = "ㅇㅇㅇ";
		// return str;
		// 왜 String은 error가 날까?
		return rmap;
	}
	
	/* 6 */
	@ResponseBody
	@RequestMapping(value = "updateUser.do", method = RequestMethod.POST)
	public Map<String, Object> updateUser(@RequestBody Map<String, Object> map){
		// map으로 넘겨받는 것은 @RequestBody를 넣어줘야 한다
		// map으로 넘어오는 것은 현재 Object가 넘어온다
		logger.info("HelloController updateUser()" + new Date());
		// object로 넘어오기 때문에 String으로 변환해야 한다
		logger.info(map.get("name") +"");
		logger.info(map.get("tel") +"");
		logger.info(map.get("email") +"");
		logger.info(map.get("birth") +"");

		Map<String, Object> rmap = new HashMap<String, Object>();
		
		rmap.put("msg", "메시지입니다");
		rmap.put("data", "홍길동");
		
		// ajax의 리턴값은 jsp가 아니라 데이터이다
		return rmap;
	}

}









