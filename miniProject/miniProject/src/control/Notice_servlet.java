package control;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.NoticeDao;
import dto.NoticeDto;


@WebServlet("/notice_servlet")
public class Notice_servlet extends HttpServlet {	
	
	ServletConfig mConfig = null;
	static final int BUFFER_SIZE = 8192;
	
	@Override
	public void init(ServletConfig config) throws ServletException {			
		mConfig = config;
	}	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String command = req.getParameter("command");
		NoticeDao dao = NoticeDao.getInstance();
		
		// 공지 리스트_어드민
		if( command.equals("notice_adm") ) {	//System.out.println("doPost noticeList");
			// 검색용 파라미터 받기
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			// 검색옵션 초기화설정
			if(choice == null || choice.equals("")) {
				choice = "sel";
			}

			if(choice.equals("sel")){
				searchWord = "";
			}
			if(searchWord == null) {
				searchWord = "";
				choice = "sel";
			}
			
			// 페이징용 파라미터 받기	
			String spageNumber = req.getParameter("pageNumber");
				//System.out.println("spageNumber : "+spageNumber);
			
			int pageNumber = 0;	// 파라미터 넘겨줄 페이지번호 변수
			int listpage = 0;	// 파라미터 넘겨줄 전체 페이지수 변수
			
			// goPage()로 받은 파라미터값이 존재할때
			if(spageNumber != null && !spageNumber.equals("") ){
				pageNumber = Integer.parseInt(spageNumber);
			}
			
			System.out.println("서블릿임 choice : " + choice);
			System.out.println("서블릿임 searchWord : " + searchWord);
			System.out.println("서블릿임 pageNumber : " + pageNumber);
			
			// 검색조건에 해당하는 공지글 리스트
			List<NoticeDto> list = dao.getPagingList(choice, searchWord, pageNumber);
			System.out.println("서블릿임 list : "+ list.size() );			
			
			// 전체 공지글 리스트
			int len = dao.getAllnotice(choice, searchWord);
			System.out.println("서블릿임 전체글len : " + len);
			
			// 한 페이지 당 10개 글씩 설정
			listpage = len / 10;
			
			
			if(len % 10 > 0){
				listpage = listpage + 1;
			}
			
		
			
			req.setAttribute("listpage", listpage);
			req.setAttribute("pageNumber", pageNumber);
			req.setAttribute("list", list);
			
			req.getRequestDispatcher("./Notice/notice_admin.jsp").forward(req, resp);
		}
		
		// 공지삭제_어드민
		else if( command.equals("delNotice") ) {   //System.out.println("CustUserControl command = delNotice");
	         String[] arr = req.getParameterValues("chBox");

	         int seq;
	         boolean delisS;
	         for(int i = 0 ; i < arr.length ; i++){
	            seq = Integer.parseInt(arr[i]);            
	              delisS = dao.delNotice( seq );
	              
	              if(!delisS) {
	                 NoticeDto dto = dao.getContent(seq);
	                 JOptionPane.showMessageDialog(null, "title : " + dto.getTitle() + "을 삭제하지 못했습니다.");
	              }
	           }
	         //JOptionPane.showMessageDialog(null, "공지 삭제 완료");
	         
	         resp.sendRedirect("notice_servlet?command=notice_adm");

		}
		
		// 공지 상세보기_어드민
		else if( command.equals("noticeDetail_amd") ){	System.out.println("CustUserControl command = noticeDetail_amd");
			
			int seq = Integer.parseInt(req.getParameter("seq"));
						
			NoticeDto dto = dao.getContent(seq);			
			req.setAttribute("dto", dto);			
			req.getRequestDispatcher("./Notice/noticeDetail_adm.jsp").forward(req, resp);						
		
		}
		
		// 공지 리스트
		else if( command.equals("notice") ) {
			
			// 검색용 파라미터 받기
			String searchWord = req.getParameter("searchWord");
			String choice = req.getParameter("choice");
			
			// 검색옵션 초기화설정
			if(choice == null || choice.equals("")) {
				choice = "sel";
			}

			if(choice.equals("sel")){
				searchWord = "";
			}
			if(searchWord == null) {
				searchWord = "";
				choice = "sel";
			}
			
			// 페이징용 파라미터 받기
			String spageNumber = req.getParameter("pageNumber");
				//System.out.println("spageNumber : "+spageNumber);
			
			int pageNumber = 0;	// 파라미터 넘겨줄 페이지번호 변수
			int listpage = 0;	// 파라미터 넘겨줄 전체 페이지수 변수
			
			// goPage()로 받은 파라미터값이 존재할때
			if(spageNumber != null && !spageNumber.equals("") ){
				pageNumber = Integer.parseInt(spageNumber);
			}
			
			// 검색조건에 해당하는 공지글 리스트
			List<NoticeDto> list = dao.getPagingList(choice, searchWord, pageNumber);
			System.out.println("서블릿임 list : "+ list.size() );			
			
			// 전체 공지글 리스트
			int len = dao.getAllnotice(choice, searchWord);
			
			// 한 페이지 당 10개 글씩 설정
			listpage = len / 10;
			
			
			if(len % 10 > 0){
				listpage = listpage + 1;
			}
			
		
			req.setAttribute("listpage", listpage);
			req.setAttribute("pageNumber", pageNumber);
			req.setAttribute("list", list);
			
			req.getRequestDispatcher("./Notice/noticeList.jsp").forward(req, resp);
		}
		
		// 공지 상세보기
		else if( command.equals("noticeDetail") ){
			System.out.println("CustUserControl command = noticeDetail");
			
			int seq = Integer.parseInt(req.getParameter("seq"));
						
			NoticeDto dto = dao.getContent(seq);
			dao.readcount(seq);
			req.setAttribute("dto", dto);			
			req.getRequestDispatcher("./Notice/noticeDetail.jsp").forward(req, resp);						
		}
		
		// 공지 상세보기의 파일 다운로드
		else if( command.equals("filedown") ) {
			System.out.println("CustUserControl command = filedown");
			


			String filename = req.getParameter("filename");
			String sseq = req.getParameter("seq");
			System.out.println("sseq : "+sseq);			
			
			// down 횟수 증가(DB)
			BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream());
			
			String filePath = "";
			
			// tomcat 경로
			//filePath = mConfig.getServletContext().getRealPath("/noticefile");
			
			// 절대경로
			filePath = "D:\\jsp\\miniProject\\WebContent\\noticefile";
			
			filePath = filePath + "\\" + filename;
			System.out.println("다운로드 경로 filePath = " + filePath);
			
			File f = new File(filePath);
			
			if(f.exists() && f.canRead()) {	// 파일존재여부 && 읽기가능여부
				
				// window download 창
				resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";"); //파일이름
				resp.setHeader("Content-Transfer-Encoding", "binary;"); 
				resp.setHeader("Content-Length", "" + f.length());
				resp.setHeader("Pragma", "no-cache;"); 				
				resp.setHeader("Expires", "-1;");						

				// 파일 생성, 기입
				BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
				byte[] buffer = new byte[BUFFER_SIZE];
				int read = 0;
				while ((read = fileInput.read(buffer)) != -1) {
					
					out.write(buffer, 0, read);	//실제 다운로드 실행
				}
				fileInput.close();
				out.flush();			
			}
			
			// downcount 증가
			dao.downcount( Integer.parseInt(sseq) );
			
			// downcount 증가 후 dto생성 
			NoticeDto dto = dao.getContent( Integer.parseInt(sseq) );
			System.out.println( dto.toString());
			req.getRequestDispatcher("/miniProject/notice_servlet?command=noticeDetail&seq=" + Integer.parseInt(sseq));
			
		}
		
	}
	
	// 어드민에서 관리용 추가,수정만 포스트형식
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		NoticeDao dao = NoticeDao.getInstance(); // 공지(뉴스) 다오싱글턴호출
			
		String fupload = "D:\\jsp\\miniProject\\WebContent\\noticefile";
		//String fupload = req.getRealPath("/upload");
		//String fupload = mConfig.getServletContext().getRealPath("/noticefile");
		System.out.println("1파일업로드 folder : " + fupload);
		
		String yourTempDir = fupload;

		int yourMaxRequestSize = 100 * 1024 * 1024; // 1 MByte (파일 용량)
		int yourMaxMemorySize = 100 * 1024; 		// 1 KByte (순간메모리 사이즈)
		
		// form field
		String seq = "";
		String id = "";
		String title = "";
		String content = "";
		String oldfile = "";
		
		// file name
		String filename = "";
		
		boolean isMultipart = ServletFileUpload.isMultipartContent(req);
		if(isMultipart){	//System.out.println("isMultipart");
			
			DiskFileItemFactory factory = new DiskFileItemFactory(); // FileItem 생성
			
			factory.setSizeThreshold(yourMaxMemorySize);
			factory.setRepository(new File(yourTempDir));// 저장설정
			
			ServletFileUpload upload = new ServletFileUpload(factory);	//factory에 용량과 저장 디렉토리 경로 모두 모아 넘겨줌
			upload.setSizeMax(yourMaxRequestSize);
						
			List<FileItem> items;				
			try {
				items = upload.parseRequest(req);
				Iterator<FileItem> it = items.iterator();	//첫번재포인터 집어넣은것.. iterator 반복자
				
				while(it.hasNext()) {
					FileItem item = it.next();
					
					if(item.isFormField()) { 
						System.out.println("item.isFormField()");
						if(item.getFieldName().equals("id")){
							id = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("title")){
							title = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("content")){
							content = item.getString("utf-8");
							System.out.println(content);
						}	
						else if(item.getFieldName().equals("oldfile")){
							oldfile = item.getString("utf-8");
						}
						else if(item.getFieldName().equals("seq")){
							seq = item.getString("utf-8");
						}
					}
					
					// fileload
					else {	
						if(item.getFieldName().equals("fileload")){
							System.out.println("2fileload--------------------");
							if(item.getName() != null && !item.getName().equals("")){
								filename = processUploadFile(item, fupload);
								System.out.println("3fupload = " + fupload);							
							}
						}
					}
					
					if(filename == null || filename.equals("")){
						System.out.println("4fileload--------------------");
						filename = oldfile;
						System.out.println("5filename = " + filename);
					}
				}
				
			} catch (FileUploadException e) {				
				e.printStackTrace();
			}				
		}
		else {
			System.out.println("multipart로 들어오지 않음");
		}
		
		if(filename.equals("") || filename == null) {
			filename = "-";
		}
//		System.out.println(id +", "+ title +", "+ content +", "+ filename);
//		int sseq = Integer.parseInt(seq);
//		System.out.println("seq : " + Integer.parseInt(seq));
		
		
		// seq없으면 공지추가
		if(seq.equals("") || seq == null) {	
			boolean addisS = dao.addNotice( new NoticeDto(id, title, content, filename, null) );
			if(addisS) {
				System.out.println("공지추가성공");
				req.setAttribute("isS", addisS);
				req.getRequestDispatcher("./Notice/noticeUpload_Af.jsp").forward(req, resp);
			}
		}
		// seq값 있을 시 공지 업데이트
		else {	
			boolean isS = dao.updateNotice(new NoticeDto(id, title, content, filename, null), Integer.parseInt(seq));
			/*
			if(isS) {
				System.out.println("업데이트성공");
				JOptionPane.showMessageDialog(null, "수정완료");
				
				resp.sendRedirect("./Notice/noticeDetail_amd.jsp");
				//resp.sendRedirect("/miniProject/notice_servlet?command=noticeDetail_amd&seq=" + Integer.parseInt(seq));
			}
			*/
			if(isS) {
				System.out.println("업데이트성공");
				/*
				 NoticeDto dto = dao.getContent( Integer.parseInt(seq));
				 req.setAttribute("dto", dto);
				 req.getRequestDispatcher("./Notice/noticeDetail_adm.jsp").forward(req, resp);
				 */
				resp.sendRedirect("notice_servlet?command=notice_adm");
			
			}
			
			else {
				System.out.println("업데이트실패");
				JOptionPane.showMessageDialog(null, "수업데이트 실패");
			}
		}		
	}

	
	
	// 파일업로드용 함수
	public String processUploadFile(FileItem fileItem, String dir) throws IOException{
		String filename = fileItem.getName();
		long sizeInBytes = fileItem.getSize();
		
		// 파일이 정상일 경우
		if(sizeInBytes > 0) {
			int idx = filename.lastIndexOf("\\");
			if(idx == -1) { //idx가 없을 경우 
				idx =  filename.lastIndexOf("/"); 	// 자료조사 형식 조건추가			
			}
			
			// 경로 제외하고 파일명만 얻기
			filename = filename.substring(idx + 1);
			File uploadFile = new File(dir, filename);
			
			try {
				fileItem.write(uploadFile);
			}catch(Exception e){	}
		}
		return filename;
	}
	
}
