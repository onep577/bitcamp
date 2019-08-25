package control;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.AdminDao;
import dao.PersonQnADao;
import dao.RoomDao;
import dao.iAdminDao;
import dao.iPersonQnADao;
import dao.iRoomDao;
import dto.AdminChartDto;
import dto.Paging;
import dto.PersonQnADto;
import dto.RoomDto;

@WebServlet("/admin_servlet")
public class Admin_servlet extends HttpServlet{
	
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Admin_servlet doGet");
		
		String command = req.getParameter("command");
		
		iPersonQnADao qnaDao = PersonQnADao.getInstance();
		iRoomDao roomDao = RoomDao.getInstance();
		iAdminDao adminDao = AdminDao.getInstance();
		
		
		if(command.equals("adminpage")) {
			req.getRequestDispatcher("./Admin/adminmainpage.jsp").forward(req, resp);
		}
		// 고객의 소리 List로 보내주기
		else if(command.equals("qnalist")) {
			String choiceStr = req.getParameter("choice");
			String str = req.getParameter("str");
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			
			System.out.println("servlet choiceStr : " + choiceStr + " str : " + str);
			
			List<PersonQnADto> list = qnaDao.getPersonQnAList(choiceStr, str, pageNum);
			int count = qnaDao.getCount(choiceStr, str);

			Paging paging = new Paging();
			paging.setPageNum(pageNum);
			paging.setTotalCount(count);			
			
			// 짐 싸기
			req.setAttribute("choice", choiceStr);
			req.setAttribute("str", str);
		//	req.setAttribute("pageNum", pageNum);
			
		//	req.setAttribute("count", count);
			req.setAttribute("list", list);
			req.setAttribute("paging", paging);
			
			// 보내기
			req.getRequestDispatcher("./PersonQnA/personqna.jsp").forward(req, resp);
		
		}
		
		// 입력한 comments를 받아서 DB를 Update
		else if(command.equals("qnaupdate")) {
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			
			String comments = req.getParameter("comments");
			int seq = Integer.parseInt(req.getParameter("seq"));
			System.out.println("comments : " + comments + " seq : " + seq);
		
			boolean isS = qnaDao.updateQnA(comments, seq);
		
			if(isS == true) {
				System.out.println("답변 등록 성공");
			}
			else {
				System.out.println("답변 등록 실패");
			}
		
			resp.sendRedirect("admin_servlet?command=qnalist&choice=&str=&pageNum=" + pageNum);
		}
		
		// 객실정보 관리 페이지로 보내주기
		else if(command.equals("roomadmin")) {
			
			List<RoomDto> list = roomDao.getRoomList();
			
			// 짐 싸기
			req.setAttribute("roomlist", list);
			
			// 보내기
			req.getRequestDispatcher("./Room/roomadmin.jsp").forward(req, resp);
		}
	
		// 객실 수정
		else if(command.equals("updateroom")) {
			String roomNum = req.getParameter("roomNum");
			int roomPrice = Integer.parseInt(req.getParameter("roomPrice"));
			String roomGrade = req.getParameter("roomGrade");
			
			RoomDto dto = new RoomDto(roomNum, roomPrice, roomGrade);
			
			boolean isS = roomDao.updateRoom(dto);
			
			if(isS == true) {
				System.out.println("객실 수정 성공");
			}
			else {
				System.out.println("객실 수정 실패");
			}
			
			// 보내기
			resp.sendRedirect("admin_servlet?command=roomadmin");
		}
		
		// 객실 삭제
		else if(command.equals("deleteroom")) {
			String roomNum = req.getParameter("roomNum");
			
			boolean isS = roomDao.deleteRoom(roomNum);
			
			if(isS == true) {
				File file = new File("D:\\jsp\\miniProject\\WebContent\\image\\" + roomNum + ".jpg");
				
				if(file.exists()) {
					if(file.delete()) {
						System.out.println("파일 삭제 성공");
					}
					else {
						System.out.println("파일 삭제 실패");
					}
				}
				else {
					System.out.println("파일이 존재하지 않습니다.");
				}				
				System.out.println("객실 삭제 성공");
			}
			
			else {
				System.out.println("객실 삭제 실패");
			}
			
			// 보내기
			resp.sendRedirect("admin_servlet?command=roomadmin");
			
		}else if(command.equals("adminChart")) {
			
			// 통계 페이지로 이동
			String year = req.getParameter("year");
			String month = req.getParameter("month");
			
			if(year == null && month == null) {
				Calendar cal = Calendar.getInstance();
				
				year = ""+cal.get(Calendar.YEAR);
				month = ""+(cal.get(Calendar.MONTH)+1);
				if(month.length() < 2) {
					month = "0"+month;
				}
			}
			String date = year+month;
			System.out.println("adminChart date : " + date);
			
			
			
			List<AdminChartDto> yearPriceList[] = new ArrayList[3];

			List<AdminChartDto> datePriceList[] = new ArrayList[12];
			List<AdminChartDto> monthPriceList = new ArrayList<AdminChartDto>();
			
			//List<AdminChartDto> priceList = new ArrayList<AdminChartDto>();
			List<AdminChartDto> addressList = new ArrayList<AdminChartDto>();
			List<AdminChartDto> ageList = new ArrayList<AdminChartDto>();

			
			for(int i = 0; i < 12; i++) {
				if(i < 9) {
					int mon = i+1;
					month = "0"+mon;
				}else {
					int mon = i+1;
					month = ""+mon;
				}

				date = year + month;
				System.out.println("adminChart year+month : " + date);
				
				datePriceList[i] = adminDao.chartDaily(date);
			}
			
			

			int _year = 2017;
			for(int j = 0; j < 3; j++) {
				System.out.println("_year : " + _year);
				yearPriceList[j] = adminDao.chartMonth(_year);
				_year++;
			}
			
			monthPriceList = adminDao.chartMonth(Integer.parseInt(year));
			//priceList = adminDao.chartDaily(date);
			addressList = adminDao.chartArea();
			ageList = adminDao.chartAge();
			
			
			
			req.setAttribute("year", year);
			req.setAttribute("month", month);
			
			for(int j = 0; j < 3; j++) {
				req.setAttribute("yearPriceList"+j, yearPriceList[j]);
			}
			for(int i = 0; i < 12; i++) {
				req.setAttribute("datePriceList"+i, datePriceList[i]);
			}
			req.setAttribute("monthPriceList", monthPriceList);
			//req.setAttribute("priceList", priceList);
			req.setAttribute("addressList", addressList);
			req.setAttribute("ageList", ageList);
			
			req.getRequestDispatcher("./Admin/adminchart.jsp").forward(req, resp);			
		}
		
	}
	
	// 목적 : 업로드
	public String processUploadFile(FileItem fileItem, String dir, String roomNum) throws IOException {
		String filename = fileItem.getName();	// 경로 + 파일명
		System.out.println("원래 filename:" + filename);
		filename = roomNum + ".jpg";
		System.out.println("변경 filename:" + filename);
		
		long sizeInBytes = fileItem.getSize();	// 파일 크기
		
		// 파일이 정상적인 경우
		if(sizeInBytes > 0) {
			
			int idx = filename.lastIndexOf("\\");	// 뒤에서부터 \\의 위치를 얻어옴
			if(idx == -1) {		// "\\" 못찾은 경우
				idx = filename.lastIndexOf("/");
			}
			
			filename = filename.substring(idx + 1);	
			
			File uploadFile = new File(dir, filename);	
			
			try{
				fileItem.write(uploadFile);		// 실제 업로드 부분
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		return filename;	// 확인용
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Admin_servlet doPost");
		
		String command = req.getParameter("command");
		
		iPersonQnADao qnaDao = PersonQnADao.getInstance();
		iRoomDao roomDao = RoomDao.getInstance();
		iAdminDao adminDao = AdminDao.getInstance();
		
		// 객실 등록
		if(command.equals("addroom")) {
			
			// 지정폴더에 업로드
			String fupload = "D:\\jsp\\miniProject\\WebContent\\image";
			System.out.println("파일 업로드 폴더 : " + fupload);
			
			String yourTempDir = fupload;
			
			int yourMaxRequestSize = 100 * 1024 * 1024; // 1 MByte
			int yourMaxMemorySize = 100 * 1024;			// 1 KByte

			// form field의 데이터를 저장할 변수
			String roomNum = "";
			String roomPrice = "";
			String roomGrade = "";
			
			// file name
			String filename = "";
			
			boolean isMultipart = ServletFileUpload.isMultipartContent(req);
			
			if(isMultipart) {
				// FileItem을 생성
				DiskFileItemFactory factory = new DiskFileItemFactory();
				
				factory.setSizeThreshold(yourMaxMemorySize);
				factory.setRepository(new File(yourTempDir));
				
				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setSizeMax(yourMaxRequestSize);
				
				
				try {
				// list 저장
				List<FileItem> items = upload.parseRequest(req);
				Iterator<FileItem> it = items.iterator();
								
				// FormField를 받음
				while(it.hasNext()) {
					FileItem item = it.next();
					
					if(item.isFormField()) {
						if(item.getFieldName().equals("roomNum")) {
							roomNum = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("roomPrice")) {
							roomPrice = item.getString("utf-8");							
						}
						else if(item.getFieldName().equals("roomGrade")) {
							roomGrade = item.getString("utf-8");
						}
						
					}
					else {	// fileload
						if(item.getFieldName().equals("fileload")) {
							filename = processUploadFile(item, fupload, roomNum);
							System.out.println("fupload : " + fupload);
						}
												
					}
					
					System.out.println("roomNum:" + roomNum + " roomPrice:" + roomPrice + " roomGrade:" + roomGrade);
				}
				} catch (FileUploadException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			else {
				System.out.println("multipart 아님");
			}
			
			// DB에 올리기
			int iroomPrice = Integer.parseInt(roomPrice);
			
			RoomDto dto = new RoomDto(roomNum, iroomPrice, roomGrade);
			
			boolean isS = roomDao.addRoom(dto);
			
			if(isS == true) {
				System.out.println("객실 등록 성공");
			}
			else {
				System.out.println("객실 등록 실패");
			}
			
			// 보내기
			resp.sendRedirect("admin_servlet?command=roomadmin");
		}
		
		
	
	}
	

}
