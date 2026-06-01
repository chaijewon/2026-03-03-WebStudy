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

// insert.jsp => <form action="UploadServlet">
@WebServlet("/UploadServlet") // URL Mapping 결로 설정 
// JSP로 처리 한다면 => web.xml에 등록 
@MultipartConfig(
  fileSizeThreshold = 1024*1024, // 1MB => 메모리에 저장할 최소단위 설정 임시 저장된다
  maxFileSize = 1024*1024*100, // 100MB => 업로드 허용된 실제 파일의 크기
  maxRequestSize = 1024*1024*50 // 50MB
  // 요청에 포함된 모든 파일 및 데이터의 전체 최대 크기 
  // Part => 1 . file , 2. text 
)
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR="uploads";
    // doGet => 405(GET / POST) 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uploadPath=getServletContext().getRealPath("")
				          +File.separator+UPLOAD_DIR;
		// File.separator=> 운영체제별로 경로 구분 (window => \ , max.ubuntu => /) 자동 처리 
		// application.getRealPath("") => getServletContext()
		// ServletContext application=getServletContext()
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists()) // 폴더가 없다면 
		{
			uploadDir.mkdir(); // 실제 파일 저장할 폴더를 만든다 
		}
		// 파일 저장 
		/*
		 *   Part 1 : file 
		 *   Part 2 : text
		 */
		try
		{
			// 1. 한글 깨짐 방지 
			request.setCharacterEncoding("UTF-8");
			// 인코딩 => 디코딩
			// %EC%9E%90%EB%B0%94(인코딩) => 디코딩 (자바)
			// 인코딩 / 디코딩은 window 11에서 자동 변환 
			// Jquery 4 => 크롬 => IE 제외 
			// => 에지 
			// 사용자가 보내준 데이터를 받는다 : name,subject,content,pwd
			String name=request.getParameter("name");
			String subject=request.getParameter("subject");
			String content=request.getParameter("content");
			String pwd=request.getParameter("pwd");
			
			// DB에 전송 
			DataBoardVO vo=new DataBoardVO();
			vo.setName(name);
			vo.setContent(content);
			vo.setSubject(subject);
			vo.setPwd(pwd);
			
			// <input type=file name=upload>
			Part filePart=request.getPart("upload");
			if(filePart==null || filePart.getSize()==0)
			{
				// 업로드가 안된 상태 
				vo.setFilename("");
				vo.setFilesize(0);
			}
			//cos.jar => 라이브러리 존재 => update(X) => javax
			else
			{
				// 실제 보낸 파일 정보
				String fileName=filePart.getSubmittedFileName();
				filePart.write(uploadPath+File.separator+fileName);
				// 업로드 
				File f=new File(uploadPath+File.separator+fileName);
				vo.setFilename(fileName);
				vo.setFilesize((int)f.length());
			}
			// DAO 연결 
			DataBoardDAO.databoardInsert(vo);
			response.sendRedirect("databoard/list.do");
			// => 수정본 : 이름 중복
		}catch(Exception ex) {ex.printStackTrace();}
		
	}

}
