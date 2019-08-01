<%@page import="pds.PdsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
// 업로드
public String processUploadFile(FileItem fileItem, String dir) throws IOException{
	String filename = fileItem.getName();	// 경로 + 파일명
	
	// 업로드 할때 경로는 빼고 파일명만 올리기 때문에 분리한다
	long sizeInBytes = fileItem.getSize();	// 파일의 크기이다
	
	// 파일이 정상
	if(sizeInBytes > 0){
		// tmp폴더에 abc파일이다 하면 이렇게 넘어온다
		// d:\\tmp\\abc.txt		// d:/tmp/abc.txt
		
		int idx = filename.lastIndexOf("\\");
		// 뒤에서부터 센다 abc.txt 바로 앞의 \\의 위치가 넘어온다
		if(idx == -1){
			// -1은 못찾았다는 것
			idx = filename.lastIndexOf("/");
		}
		
		filename = filename.substring(idx + 1);
		// 파일명을 얻는다 즉, filename = abc.txt이다
		
		File uploadFile = new File(dir, filename);
		// 경로는 서버에서 올릴거다 톰캣서버 내부에 올릴거다
		
		try{
			fileItem.write(uploadFile);	// 실제 업로드 부분
		}catch(Exception e){}
	} // 파일이 정상인 경우
	
	return filename;	// 확인용이라서 void로 끝나도 괜찮다
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// 서버를 껐다 켜면 자료가 없어질 수 있다 왜? 서버를 껐다 켜면 자동 refresh된다
// tomcat 배포
String fupload = application.getRealPath("/upload");
// application은 내장객체이다 request, response와 동료이다
// application setAttribute는 잘 안쓴다 왜? request setAttribute가 있기 때문이다
// 하지만 파일 업로드 할때는 꼭 쓴다
// jsp는 서버에서 컨테이너에서 작업중이다

// 저정 폴더
//String fupload = "d:\\tmp";

System.out.println("파일 업로드 폴더 : " + fupload);

String yourTempDir = fupload;
// 디렉토리명을 바꾸겠다

int yourMaxRequestSize = 100 * 1024 * 1024; // 1 MByte
int yourMaxMemorySize = 100 * 1024;			// 1 KByte
// 1 MByte로 전송, yourMaxMemorySize는 메모리에 잠깐 저장

// form field의 데이터를 저장할 변수
String id = "";
String title = "";
String content = "";

// file name
String filename = "";

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
// request 요청해서 파라미터 받는 것
// 지금은 Multipart이기 때문에 request만 쓰는 게 아니라 한단계 더 걸린다
// 파일도 넘어오고 폼도 넘어온다

if(isMultipart){
	
	// FileItem을 생성
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	//--- factory를 다시 업로드
	factory.setSizeThreshold(yourMaxMemorySize);
	factory.setRepository(new File(yourTempDir));
	// repository는 저장소이다
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	//---	
	upload.setSizeMax(yourMaxRequestSize);
	
	// list 저장 왜? id, title, file, content가 list로 넘어온다
	List<FileItem> items = upload.parseRequest(request);
	Iterator<FileItem> it = items.iterator();
	// Iterator 반복자, it은 포인터이다
	// list를 다 받아들였다
	
	while(it.hasNext()){
		FileItem item = it.next();
		// item은 String일지 byte일지 모른다
		
		if(item.isFormField()){		// id, title, content가 여기로 넘어온다
			if(item.getFieldName().equals("id")){
				id = item.getString("utf-8"); // utf-8형식으로 넘겨라
				
			}else if(item.getFieldName().equals("title")){
				title = item.getString("utf-8");
				
			}else if(item.getFieldName().equals("content")){
				content = item.getString("utf-8");
				
			}			
		}else{						// fileload가 여기로 넘어온다
			if(item.getFieldName().equals("fileload")){
				// 지금은 하나만 있어서 빼도 된다
				filename = processUploadFile(item, fupload);
				System.out.println("fupload : " + fupload);
			}
		}
		
	} // while문
	
}else{
	System.out.println("multipart 아님");
}

// DB
PdsDao dao = PdsDao.getInstance();
boolean b = dao.addPds(id, title, content, filename);

if(b){
	%>
	<script type="text/javascript">
	alert("파일 추가 성공");
	location.href="pdslist.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("파일 추가 실패");
	location.href="pdslist.jsp";
	</script>
	<%
}

%>














</body>
</html>