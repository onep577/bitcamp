package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustuserDao;
import dto.CustuserDto;
import sun.misc.Perf.GetPerfAction;

public class CustUserControl extends HttpServlet {
	// 컨트롤러에 오면 dao를 불러와야하는 경우가 많다

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CustUserControl get방식");
		
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset=utf-8");
		
		String command = req.getParameter("command");
		// 데이터를 받는다
		
		CustuserDao dao = CustuserDao.getInstance();
		
		if(command.equals("list")) {
			List<CustuserDto> list = dao.getCustuserList();
			
			// 짐 싸
			req.setAttribute("custlist", list);
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);
		}else if(command.equals("insert")) {
			//System.out.println("CustUserControl insert");
			
			// 잘가
			resp.sendRedirect("custadd.jsp");
		}else if(command.equals("detail")) {
			System.out.println("CustUserControl detail");
			
			String id = req.getParameter("id");
			
			CustuserDto dto = dao.getOnelist(id);
			
			// 짐 싸
			req.setAttribute("custdto", dto);
			// 잘가
			req.getRequestDispatcher("custuserdetail.jsp").forward(req, resp);
		}else if(command.equals("cancel")) {
			System.out.println("CustUserControl cancel");
			
			List<CustuserDto> list = dao.getCustuserList();
			
			// 짐 싸
			req.setAttribute("custlist", list);			
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);
		}else if(command.equals("updateAf")) {
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String addr = req.getParameter("addr");

			System.out.println( id + ", " + name + ", " + addr );
			
			boolean b = dao.updatecustuser(id, name, addr);
			
			if(b) {
				System.out.println("업데이트 성공");
			}else {
				System.out.println("업데이트 실패");
			}

			List<CustuserDto> list = dao.getCustuserList();
			
			// 짐 싸
			req.setAttribute("custlist", list);			
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);			
		}
		
	} // doGet 함수

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("CustUserControl post방식");
		
		req.setCharacterEncoding("utf-8");		
		resp.setContentType("text/html; charset=utf-8");
		
		String command = req.getParameter("command");
		// 데이터를 받는다

		CustuserDao dao = CustuserDao.getInstance();

		
		if(command.equals("muldel")) {
			System.out.println("CustUserControl muldel");
			
			String[] ids = req.getParameterValues("id");
			
			boolean b = dao.delcustusers(ids);
			
			if(b) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
			List<CustuserDto> list = dao.getCustuserList();
				
			// 짐 싸
			req.setAttribute("custlist", list);
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);
		
		}else if(command.equals("insertAf")) {
			System.out.println("CustUserControl insertAf");
			
			//String id = new String(req.getParameter("id").getBytes("8859_1"),"KSC5601");
			String id = req.getParameter("id");
			String name = req.getParameter("name");
			String addr = req.getParameter("addr");
			
			int count = dao.addCustuser(id, name, addr);
			
			if(count > 0) {
				System.out.println("추가 성공");
			}else {
				System.out.println("추가 실패");
			}

			List<CustuserDto> list = dao.getCustuserList();
			
			// 짐 싸
			req.setAttribute("custlist", list);
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);
		}else if(command.equals("delete")) {
			System.out.println("CustUserControl delete");
			
			String id = req.getParameter("id");
			System.out.println("id : " + id);
			
			boolean b = dao.delcustuser(id);
			
			if(b) {
				System.out.println("삭제 성공");
			}else {
				System.out.println("삭제 실패");
			}
			
			List<CustuserDto> list = dao.getCustuserList();
			
			// 짐 싸
			req.setAttribute("custlist", list);			
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);
		}else if(command.equals("update")) {
			System.out.println("CustUserControl update");
			
			String id = req.getParameter("id");
			System.out.println("id : " + id);
			
			CustuserDto dto = dao.getOnelist(id);
			
			System.out.println( dto.getId() + ", " + dto.getName() + ", " + dto.getAddress() );
			
			// 짐 싸
			req.setAttribute("custdto", dto);
			// 잘가
			req.getRequestDispatcher("custupdate.jsp").forward(req, resp);
		}else if(command.equals("select")) {
			System.out.println("CustUserControl select");
			String str = req.getParameter("selText");
			//System.out.println("str : " + str);
			String select = req.getParameter("sel");
			//System.out.println("select : " + select);
			
			List<CustuserDto> list = dao.selectList(str, select);
			
			// 짐 싸
			req.setAttribute("custlist", list);			
			// 잘가
			req.getRequestDispatcher("custuserlist.jsp").forward(req, resp);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	} // doPost 함수

}
