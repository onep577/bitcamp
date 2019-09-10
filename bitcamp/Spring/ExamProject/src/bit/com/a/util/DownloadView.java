package bit.com.a.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

public class DownloadView extends AbstractView {

   @Override
   protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
         HttpServletResponse response) throws Exception {
      
      System.out.println("DownloadView renderMergedOutputModel");
      
      File file = (File)model.get("downloadFile");		// == getAttribute
      response.setContentType(this.getContentType());
      response.setContentLength((int)file.length());
      
      // IE/chrome
      String userAgent = request.getHeader("user-Agent");
      boolean ie = userAgent.indexOf("MSIE") > -1;	// 마이크로 소프트 인터넷 익스플로러
      
      String filename = null;
      if(ie) {
    	  filename = URLEncoder.encode(file.getName(), "utf-8");
      }else {
    	  filename = new String(file.getName().getBytes("utf-8"), "iso-8859-1");
      }
      
      // window download 창
      response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");
      response.setHeader("Content-Transfer-Encoding", "binary;");
      response.setHeader("Content-Length", "" + file.length());
      response.setHeader("Pragma", "no-cache;"); 
      response.setHeader("Expires", "-1;");
      
      OutputStream out = response.getOutputStream();
      FileInputStream fi = null;
      
      fi = new FileInputStream(file);
      FileCopyUtils.copy(fi, out);

      // download count 증가
      if(fi != null) {
    	  fi.close();
      }   
   }




}
