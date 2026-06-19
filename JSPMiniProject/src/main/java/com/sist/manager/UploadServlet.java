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
/*
 *   class A
 *   {
 *   }
 *   
 *   A a=new A()
 */

@WebServlet("/UploadServlet")
// JSP에서는 실행이 안됨 = Servlet으로 실행 => 스프링 => web.xml
@MultipartConfig(
  fileSizeThreshold = 1024*1024, //1MB => 메모리에 저장할 최소 단위 임시 저장
  maxFileSize = 1024*1024*100, // 100MB => 업로드 파일 최대 크기
  maxRequestSize = 1024*1024*50 // 요청에 포함 된 파일  데이터의 최대 크기
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR="uploads";
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath=getServletContext().getRealPath("")
				          +File.separator+UPLOAD_DIR;
		
		// getServletContext() : JSP=> application
		// application => 서버와 관련 데이터 관리 => ServletContext
		//System.out.println(uploadPath);
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists()) // 폴더가 없는 경우
		{
			uploadDir.mkdir();
		}
		/*
		 *   Part 1 : file
		 *   Part 2 : text
		 */
		
		try
		{
			//1. 한글 깨짐 방지 
			request.setCharacterEncoding("UTF-8");
			//2. 사용자가 보내준 데이터 받기 
			String name=request.getParameter("name");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String pwd=request.getParameter("pwd");
			
			DataBoardVO vo=new DataBoardVO();
			vo.setName(name);
			vo.setSubject(subject);
			vo.setContent(content);
			vo.setPwd(pwd);
			
			//3. File 제어 
			// <input type=file name=files size=20 class="input-sm">
			Part filePart=request.getPart("files");
			if(filePart==null || filePart.getSize()==0)
			{
				// 파일이 업로드가 안된 상태
				vo.setFilename("");
				vo.setFilesize(0);
			}
			else
			{
				// 파일 업로드가 된 상태 
				// 실제 보낸 파일 
				String fileName=filePart.getSubmittedFileName();
				filePart.write(uploadPath+File.separator+fileName);
				// 업로드 완료 
				File f=new File(uploadPath+File.separator+fileName);
				vo.setFilename(f.getName());
				vo.setFilesize((int)f.length());
			}
			// Database에 저장 
			DataBoardDAO.boardInsert(vo);
			// 화면 이동 
			response.sendRedirect("board/list.do");
		}catch(Exception ex) {}
	}

}





