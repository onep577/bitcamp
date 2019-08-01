package pds;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet(urlPatterns="/filedown")
// xml 파일의 servlet 설정과 같이 쓰면 안된다
public class FileDownLoader extends HttpServlet {
	
	ServletConfig mConfig = null;			// 업로드한 경로를 취득한다
	static final int BUFFER_SIZE = 8192;	// 8kb, 버퍼의 크기


	@Override
	public void init(ServletConfig config) throws ServletException {
		// 서블릿 부분에서 이니셜라이즈 해 줄 수 있는 부분
		// config : 파일이 올려진 경로를 가지고 있다
		super.init(config);
		
		// 파일 경로를 mConfig에 넣었다 왜? doGet에서 사용하기 위해서이다
		mConfig = config;
	}

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FileDownLoader doGet");
		
		String filename = req.getParameter("filename");
		int seq = Integer.parseInt(req.getParameter("seq"));
		
		// down 회수 증가(DB)
		PdsDao dao = PdsDao.getInstance();
		boolean b = dao.downcount(seq);
		System.out.println("down count : " + b);
		
		BufferedOutputStream out = new BufferedOutputStream(resp.getOutputStream());
		
		String filePath = "";
		
		// tomcat 경로
		filePath = mConfig.getServletContext().getRealPath("/upload");
		
		// 지정 폴더 경로
		//filePath = "d:\\tmp";
		
		filePath = filePath + "\\" + filename;
		
		System.out.println("다운로드 경로 : " + filePath);
		
		File f = new File(filePath);
		
		// 윈도우 다운로드 창이다
		if(f.exists() && f.canRead()) {
			// 있는지와 읽을 수 있는지
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
			resp.setHeader("Content-Transfer-Encoding", "binary;");
			resp.setHeader("Content-Length", "" + f.length());
			resp.setHeader("Pragma", "no-cache;");
			// Pragma 저장을 할것인지
			resp.setHeader("Expires", "-1;");
			// Expires 유효기한, -1은 무한대이다
			
			// 파일 생성, 기입
			BufferedInputStream fileInput = new BufferedInputStream(new FileInputStream(f));
			
			byte buffer[] = new byte[BUFFER_SIZE];
			// 버퍼의 사이즈만큼 배열을 잡는다
			
			int read = 0;
			while((read = fileInput.read(buffer)) != -1 ) {
				out.write(buffer, 0, read);		// 실제 다운로드 되는 지점
			}
			
			fileInput.close();
			out.flush();			
		}else {
			System.out.println("업로드할 파일이 없습니다");
		}
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("FileDownLoader doPost");
		
	}

}
