package com.sist.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

import com.sist.dao.DataBoardDAO;
import com.sist.vo.DataBoardVO;
// JSP+Servlet = Spring 
@WebServlet("/UploadServlet")
@MultipartConfig(
  fileSizeThreshold = 1024*1204, //1MB
  maxFileSize = 1024*1024*10, // 10MB
  maxRequestSize = 1024*1024*50
)

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR="uploads";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// getServletContext() => application
	   String uploadPath=getServletContext().getRealPath("")
		                  +File.separator+UPLOAD_DIR;
	   // File.separator => windows => \ ubuntu => /
	   File uploadDir=new File(uploadPath);
	   if(!uploadDir.exists())
	   {
		   uploadDir.mkdir();
	   }
	   /*
	    *  Part 1 : file 
	    *  Part 2 : text
	    */
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
		   String name=request.getParameter("name");
		   String subject=request.getParameter("subject");
		   String content=request.getParameter("content");
		   String pwd=request.getParameter("pwd");
		   DataBoardVO vo=new DataBoardVO();
		   vo.setName(name);
		   vo.setSubject(subject);
		   vo.setContent(content);
		   vo.setPwd(pwd);
		   
		   Part filePart=request.getPart("upload");
		   if(filePart==null || filePart.getSize()==0)
		   {
			   vo.setFilename("");
			   vo.setFilesize(0);
		   }
		   else // 업로드가 된 상태 => 중복 체크 
		   {
			   String fileName=filePart.getSubmittedFileName();
			   // 업로드
			   filePart.write(uploadPath+File.separator+fileName);
			   
			   vo.setFilename(fileName);
			   File f=new File(uploadPath+File.separator+fileName);
			   vo.setFilesize((int)f.length());
		   }
		   DataBoardDAO dao=DataBoardDAO.newInstance();
		   dao.databoardInsert(vo);
		   
		   response.sendRedirect("main/main.jsp?mode=3");
		   // ..을 사용하면 안된다 
		   // => 중복 처리 / 다운로드 
		   // 댓글 올리기 
		   // 결재 창 
		   // 회원가입 : 우편번호 => daum  MV / MVC => Spring구조
		   
	   }catch(Exception ex) {}
	}

}
