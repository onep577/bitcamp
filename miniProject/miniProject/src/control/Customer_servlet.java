package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDao;
import dao.CustomerDao;
import dao.PersonQnADao;
import dao.iBookingDao;
import dao.iCustomerDao;
import dao.iPersonQnADao;
import dto.BookingDto;
import dto.CustomerDto;
import dto.Paging;
import dto.PersonQnADto;
import mail.SendEmail;

@WebServlet("/customer_servlet")
public class Customer_servlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		iCustomerDao dao = CustomerDao.getInstance();
		iPersonQnADao qnadao = PersonQnADao.getInstance();
		iBookingDao boodao = BookingDao.getInstance();
		
		String command = req.getParameter("command");
		
		System.out.println("do get command : " + command);
		
		
		if(command.equals("mainpage")) {
			
			req.getRequestDispatcher("./Main.jsp").forward(req, resp);
			
		}
		else if(command.equals("account")) {
			
			req.getRequestDispatcher("./Customer/account.jsp").forward(req, resp);
			
		}else if(command.equals("pwdfind")) {
			
			req.getRequestDispatcher("./Customer/pwdfind.jsp").forward(req, resp);
			
		}
		else if(command.equals("logout")) {
			
			HttpSession session = req.getSession();
			  
		    session.invalidate();
		    
		    if(req.getSession(false) == null) {
		    	System.out.println("로그아웃이 완료되었습니다");
		    }
		    
		    req.getRequestDispatcher("./Main.jsp").forward(req, resp);

		}else if(command.equals("loginpage")) {
			
		    req.getRequestDispatcher("./Customer/login.jsp").forward(req, resp);

		}else if(command.equals("idcheck")) {
			
		    System.out.println("id 체크입니다.");
		    
		    String id = req.getParameter("id");

		    boolean check = dao.getidcheck(id);

		    System.out.println("in_id = " + id);

		    String str = "";

		    if(check == false){
		    	str = "사용불가";
		    }else{
		    	str = "사용가능";
		    }
		 
		    resp.getWriter().print(check);
		    
		}else if(command.equals("mypage")) {
			
			HttpSession session = req.getSession();
			CustomerDto user = (CustomerDto)session.getAttribute("login");
			
			
			
			CustomerDto newuser = dao.getCustomer(user.getId());

			session.setAttribute("login", newuser);
			session.setMaxInactiveInterval(30*60*60);
			
			// 예약dao.get예약내역
			List<BookingDto> bookinglist = boodao.SelectBook(user.getId());
			req.setAttribute("bookinglist", bookinglist); //짐싸 예약내역 다오
			
			// 문의dao.get문의내역
			List<PersonQnADto> qnalist = qnadao.getMyList(user.getId());
			req.setAttribute("qnalist", qnalist); //짐싸 문의내역 다오
			
		    req.getRequestDispatcher("./Customer/mypage.jsp").forward(req, resp);

		}else if(command.equals("adminCustomer")) {
			
			// 회원관리 페이지로 이동
			System.out.println("command : adminCustomer");

			String search = req.getParameter("search");
			String text = req.getParameter("text");
			String page = req.getParameter("page");
			
			if(search == null && text == null && page == null) {
				// 처음 이동할 때는 null값이다
				search = "";
				text = "";
				page = "1";
			}else if(search == null && text == null) {
				search = "";
				text = "";
			}else if(page == null) {
				page = "1";
			}
			
			System.out.println("search : " + search + ", text : " + text + ", page : " + page);

			List<CustomerDto> list = dao.getCustomerList(search, text);
			List<CustomerDto> listPage = dao.getCustomerList(search, text, page);
			
			int listCount = list.size();
			int listPageCount = listPage.size();
			
			System.out.println("listCount : " + listCount + ", listPageCount : " + listPageCount);
			
			
			// next, prev 버튼
			Paging paging = new Paging();
			paging.setPageNum(Integer.parseInt(page));
			paging.setTotalCount(listCount);
			req.setAttribute("paging", paging);
			
			
			
			req.setAttribute("search", search);
			req.setAttribute("text", text);
			//req.setAttribute("list", list);
			req.setAttribute("listPage", listPage);
			
			req.getRequestDispatcher("./Admin/admincustomer.jsp").forward(req, resp);
			
		}
		else if(command.equals("hotel_intro")) {
			// 시그니엘 소개 페이지로 이동
			req.getRequestDispatcher("./Customer/hotel_intro.jsp").forward(req, resp);
			
		}
		else if(command.equals("room_intro")) {
			// 객실 소개 페이지로 이동
			req.getRequestDispatcher("./Customer/room_intro.jsp").forward(req, resp);
			
		}else if(command.equals("travel_intro")) {
			// 주변 관광지 소개 페이지로 이동
			req.getRequestDispatcher("./Customer/travel_intro.jsp").forward(req, resp);
			
		}else if(command.equals("deletecust")) {
			
			String id = req.getParameter("id");
			
			boolean b = dao.delCustomer(id);
			
			if(b) {
				System.out.println("정상적으로 회원탈퇴가 되었습니다.");
				
				HttpSession session = req.getSession();
				  
			    session.invalidate();
			    
			    boolean b1 = boodao.outCustomer(id);
			    boolean b2 = qnadao.outCustomer(id);
			    
			    if(b1 == true) {
			    	System.out.println("booking 테이블에서 id null값으로 갱신");
			    }
			    if(b2 == true) {
			    	System.out.println("personQnA 테이블에서 id null값으로 갱신");
			    }
			    
			}else {
				System.out.println("회원탈퇴를 실패했습니다.");
			}
			
			req.getRequestDispatcher("./Main.jsp").forward(req, resp);
			
		}else if(command.equals("idandemail")) { // 비밀번호 찾기
			
		    System.out.println("idandemail 체크입니다.");
		    
		    String id = req.getParameter("id");
		    
		    String email = req.getParameter("email");
		    
		    String cernumber = req.getParameter("cernumber");

		    boolean check = dao.getidandemailcheck(id, email);

		    if(check == true){
		    	
		    	System.out.println("아이디와 이메일이 일치함");
		    	
		    	SendEmail mail = new SendEmail();
				
				mail.senamail(email, cernumber);
				
		    }else{
		    	System.out.println("아이디와 이메일이 일치하지 않음");
		    }
		 
		    resp.getWriter().print(check);
		    
		}
		
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8"); // dopost 에서는 엔코딩을 해줘야 한글이 깨지지 않는다 !!
		
		iCustomerDao dao = CustomerDao.getInstance();
		iPersonQnADao qnadao = PersonQnADao.getInstance();
		iBookingDao boodao = BookingDao.getInstance();
		
		String command = req.getParameter("command");
		
		System.out.println("do Post command : " + command);
		
		if(command.equals("login")) {
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			System.out.println("id : " + id);
			System.out.println("pwd : " + pwd);
			
			
			CustomerDto user = dao.loginCustomer(req.getParameter("id"), req.getParameter("pwd"));
	
			if(user == null){
			
				System.out.println("ID나 PW가 일치하지 않습니다.");
				req.setAttribute("message", "id나 비밀번호가 일치하지 않습니다."); //짐싸
				req.getRequestDispatcher("./Customer/login.jsp").forward(req, resp);
				
			}else{
				HttpSession session = req.getSession();

				session.setAttribute("login", user);
				session.setMaxInactiveInterval(30*60*60);
				
				if(user.getAuth() == 3) { // 일반 유저
					req.getRequestDispatcher("./Main.jsp").forward(req, resp);
				}else { // 관리자 페이지
					resp.sendRedirect("admin_servlet?command=adminChart");
				}
				
			}
		
		}else if(command.equals("custaccount")) {
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String birthday = req.getParameter("birthday");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			/*
			System.out.println(id);
			System.out.println(pwd);
			System.out.println(name);
			System.out.println(address);
			System.out.println(birthday);
			System.out.println(phone);
			System.out.println(email);
			*/
			CustomerDto dto = new CustomerDto(id, pwd, name, address, birthday, phone, email);
			
			boolean b = dao.addCustomer(dto);
			
			if(b) {
				req.setAttribute("message", "회원가입이 정상적으로 되었습니다."); //짐싸
			}else {
				req.setAttribute("message", "회원가입이 실패하였습니다."); //짐싸
			}
			
			req.getRequestDispatcher("./Customer/login.jsp").forward(req, resp);

		}else if(command.equals("custupdate")) {
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String address = req.getParameter("address");
			String birthday = req.getParameter("birthday");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			
			CustomerDto dto = new CustomerDto(id, pwd, name, address, birthday, phone, email);
			
			boolean b = dao.infoChangeCustomer(dto);
			
			if(b) {
				req.setAttribute("message", "정보변경이 정상적으로 되었습니다."); //짐싸
			}else {
				req.setAttribute("message", "정보변경에 실패하였습니다."); //짐싸
			}
			
			CustomerDto user = dao.getCustomer(id);
			
			HttpSession session = req.getSession();

			session.setAttribute("login", user);
			session.setMaxInactiveInterval(30*60*60);
			
			
			// 예약dao.get예약내역
			List<BookingDto> bookinglist = boodao.SelectBook(user.getId());
			req.setAttribute("bookinglist", bookinglist); //짐싸 예약내역 다오
			
			// 문의dao.get문의내역
			List<PersonQnADto> qnalist = qnadao.getMyList(user.getId());
			req.setAttribute("qnalist", qnalist); //짐싸 문의내역 다오
			
			
			req.getRequestDispatcher("./Customer/mypage.jsp").forward(req, resp);
			
		}else if(command.equals("pwdchange")) {
			
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			CustomerDto dto = dao.getCustomer(id);
			
			dto.setPwd(pwd);
			
			boolean b = dao.infoChangeCustomer(dto);
			
			if(b) {
				System.out.println("비밀번호 바꾸기 완료");
				req.setAttribute("message", "비밀번호 바꾸기에 성공하였습니다 바뀐 비밀번호로 로그인해주세요"); //짐싸
			}else {
				System.out.println("비밀번호 바꾸기 실패");
				req.setAttribute("message", "비밀번호 바꾸기에 실패하였습니다 다시 시도해주세요"); //짐싸 
			}
			
			req.getRequestDispatcher("./Customer/login.jsp").forward(req, resp);
			
		}
			
	}

}
