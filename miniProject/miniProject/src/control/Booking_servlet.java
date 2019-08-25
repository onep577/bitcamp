package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDao;
import dao.CustomerDao;
import dao.RoomDao;
import dao.iBookingDao;
import dao.iCustomerDao;
import dao.iRoomDao;
import dto.AdminTodayBookingDto;
import dto.BookingCheckDto;
import dto.BookingDto;
import dto.CustomerDto;
import dto.RoomDto;

@WebServlet("/booking_servlet")
public class Booking_servlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("dogetIn");
		String command = "";	// 페이지 히든
		
		String visit_date = "";	// 입실
		String leave_date = ""; // 퇴실
		int adult_number = 1;	// 인원(어른)
		int child_number = 0;	// 인원(어린이)
		String Sprice = "";
		int price = 0;
		String grade = "";
		String room_number = "";
		String id = "asd";	// id 합칠경우 값 "" 으로 초기화
		int result_date = 0;
		
		command = req.getParameter("command");
		
		iRoomDao RDao = RoomDao.getInstance();
		iBookingDao BDao = BookingDao.getInstance();
		iCustomerDao CDao = CustomerDao.getInstance();
		
		BookingDto BDto = new BookingDto();
		
		if(command.equals("firstBook")) {
	//		System.out.println("FBIN"); 확인용
			visit_date = req.getParameter("visit_date");
			leave_date = req.getParameter("leaver_date");
			result_date = Integer.parseInt(req.getParameter("result_date"));
			adult_number = Integer.parseInt(req.getParameter("adult_number"));
			child_number = Integer.parseInt(req.getParameter("child_number"));
			
			String visitday = visit_date.replace("-", "");	// 자른 문자열
			String leaveday = leave_date.replace("-", "");	// 자른 문자열
			
			
			System.out.println("visit_date:" + visit_date);
			System.out.println("leaver_date:" + leave_date);
			System.out.println("adult_number:" + adult_number);
			System.out.println("child_number:" + child_number);
			
			
			System.out.println("visitday == " + visitday);
			List<RoomDto> AllList = RDao.getAllList(visitday, leaveday);	// 사용가능한 방 리스트
			
			System.out.println(AllList.toString());

			BDto = new BookingDto(visit_date, leave_date, adult_number, child_number);
			
			System.out.println(BDto.toString());
			
			req.setAttribute("dto", BDto);
			
			System.out.println("Bdto 저장함");
			
			req.setAttribute("All", AllList);
			
			System.out.println("AllList 저장함");
			
			req.setAttribute("result_date", result_date);
			
			System.out.println("리설트데이 저장");
			
			req.getRequestDispatcher("./Booking/secondBook.jsp").forward(req, resp);
			
		}else if(command.equals("secondBook")) {
			
			//System.out.println("세컨드북 들어옴");	확인용
			
			id = req.getParameter("id");//	합칠경우 주석 해제
			
			visit_date = req.getParameter("visit_date");
			leave_date = req.getParameter("leave_date");
			System.out.println("result_date : "+req.getParameter("result_date"));
			result_date = Integer.parseInt(req.getParameter("result_date"));
			
			String visitday = visit_date.replace("-", "");	// - 자른 문자열
			String leaveday = leave_date.replace("-", "");	//	- 자른 문자열
			
			System.out.println("leave_date"+leave_date);
			
			adult_number = Integer.parseInt(req.getParameter("adult_number"));
			child_number = Integer.parseInt(req.getParameter("child_number"));
			room_number = req.getParameter("room_number");
			
			Sprice = req.getParameter("price");
			
			Sprice = Sprice.replace(",", "");	// 가격도 Int값으로 사용을 위해 , 잘라서 사용
			
			price = Integer.parseInt(Sprice);
			
			int result = 0;
			
			/*
			// 날짜 차이 구하는 코드
			SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			
			try {
				Date visitD = format.parse(visit_date);
				Date LeaveD = format.parse(leave_date);
				System.out.println("트라이");
				
				long calDate = LeaveD.getTime() - visitD.getTime();
				
				long calD = calDate / (24*60*60*1000);
				
				calD = Math.abs(calD);
				System.out.println("결과" + calD);
				result = (int)calD;
			} catch (ParseException e) {

				e.printStackTrace();
			}
			*/
			
			
			result = result_date * price;	// 날짜 차이를 구한후 금액과 * 
			
			BDto = new BookingDto(id, visitday, leaveday, result, adult_number, child_number, room_number);
			
			CustomerDto CDto = new CustomerDto();
			CDto.setId(id);
			CDto.setTotal_payment(result);
			
			boolean b = BDao.InsertBook(BDto);	
			
			/*
			if(b && c) {	// 입력 성공 여부 확인
				System.out.println("db데이터 입력성공");	
			}else {
				System.out.println("db데이터 입력 실패");
			}*/
			if(b) {
				boolean c = CDao.B_T_ChangeCustomer(CDto);// 예약 후 개인정보 업데이트
				if(c) {
					System.out.println("데이터 최종 입력 성공");
					
					CustomerDto user = CDao.getCustomer(id); // 업데이트된 개인정보 다시 가져오기
					
					HttpSession session = req.getSession(); // 세션에 로드
		
					session.setAttribute("login", user); // 세션에 저장
					session.setMaxInactiveInterval(30*60*60); // 세션 기간 설정
					
					BDto = new BookingDto(id, visit_date, leave_date, result, adult_number, child_number, room_number);
					
					req.setAttribute("dto", BDto);
					
					System.out.println("thirdBook.jsp 로 이동");
					req.getRequestDispatcher("./Booking/thirdBook.jsp").forward(req, resp);
					
				}else {
					System.out.println("개인정보 입력 실패");
					req.getRequestDispatcher("./Booking/thirdBook.jsp").forward(req, resp);
				}
				
			}else {
				
				String BookingRoom = "fail";
				
				req.setAttribute("BookingRoom", "fail");
				req.getRequestDispatcher("./Booking/firstBook.jsp").forward(req, resp);
				
			}	
		}else if(command.equals("first")) {
			req.getRequestDispatcher("./Booking/firstBook.jsp").forward(req, resp);
		}else if(command.equals("home")) {
			req.getRequestDispatcher("./Main.jsp").forward(req, resp);
		}else if(command.equals("mypage")) {
			req.getRequestDispatcher("./Customer/mypage.jsp").forward(req, resp);
		}else if(command.equals("adminBooking")) {
			
			// 예약조회관리 페이지로 이동
			System.out.println("command : adminBooking");
			Calendar cal = Calendar.getInstance();
			
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			String day = req.getParameter("day");
			String date = "";
			
			if(year == null && day == null && month == null) {
				// 첫 이동할 때 null값이 들어온다
				year = ""+cal.get(Calendar.YEAR);
				
				month = ""+(cal.get(Calendar.MONTH)+1);
				if(month.length() < 2) {
					month = "0"+month;
				}
				
				day = ""+cal.get(Calendar.DATE);
				if(day.length() < 2) {
					day = "0"+day;
				}
				
			}
			
			// 처음 들어올 때, 전체 검색할 때는 if문으로 간다
			// 검색 했을때는 if문을 지나온다
			date = year+month+day;
			
			System.out.println("adminBooking date : " + date);
			
			
			List<AdminTodayBookingDto> visitlist = BDao.getTodayVisit(date);
			List<AdminTodayBookingDto> leavelist = BDao.getTodayLeave(date);
			List<AdminTodayBookingDto> bookinglist = BDao.getTodayBooking(date);
			
			
			req.setAttribute("visitlist", visitlist);
			req.setAttribute("leavelist", leavelist);
			req.setAttribute("bookinglist", bookinglist);
			req.setAttribute("date", date);
			req.getRequestDispatcher("./Admin/adminbooking.jsp").forward(req, resp);
		}	
		else if(command.equals("bookingcheck")) {
			// 예약조회관리에서 나의 예약들을 조회
			System.out.println("command : bookingcheck");
			
			HttpSession session = req.getSession();
			CustomerDto user = (CustomerDto)session.getAttribute("login");
			System.out.println("예약조회 페이지 나의 id : " + user.getId());
			
			List<BookingCheckDto> list = BDao.getBookingCheck(user.getId());
			System.out.println("예약조회 페이지 나의 예약조회 list size : " + list.size());
			
			req.setAttribute("list", list);
			req.getRequestDispatcher("./Booking/bookingcheck.jsp").forward(req, resp);
		}else if(command.equals("delete")) {
			// 예약조회관리에서 예약 취소
			System.out.println("command : bookingdel");
			
			HttpSession session = req.getSession();
			CustomerDto user = (CustomerDto)session.getAttribute("login");
			
			
			String seq = req.getParameter("seq");
			int total_price = Integer.parseInt(req.getParameter("total_price"));			
			System.out.println("seq : " + seq + ", total_price : " + total_price);
			
			
			boolean b1 = CDao.cancel(user.getId(), total_price);
			System.out.println("취소여부1 : " + b1);
			
			boolean b2 = BDao.delete(Integer.parseInt(seq));
			System.out.println("취소여부2 : " + b2);

			
			req.getRequestDispatcher("booking_servlet?command=bookingcheck").forward(req, resp);
		}
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
	
	
	
}
