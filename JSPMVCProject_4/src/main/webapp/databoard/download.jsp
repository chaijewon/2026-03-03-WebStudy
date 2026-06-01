<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.io.*,java.net.*"%>
<%
    try
    {
    	String fn=request.getParameter("fn");
    	String path=application.getRealPath("")
    			    +File.separator+"uploads"
    			    +File.separator+fn;
    	// File.separator => AWS / Ubuntu => 경로 / 
    	File file=new File(path);
    	BufferedInputStream bis=
    			new BufferedInputStream(new FileInputStream(file));
    	BufferedOutputStream bos=
    			new BufferedOutputStream(response.getOutputStream());
    	//response.getOutputStream() => 클라이언트 폴더 (다운로드)
    	// 1. 파일명 => 파일 다이얼로그
    	response.setHeader("Content-Disposition", 
    			"attachment;filename="+URLEncoder.encode(fn, "UTF-8"));
    	
    	// 2. 프로그래스바 => 파일 크기 전송 
    	response.setContentLength((int)file.length());
    	
    	// 3. 실제 데이터 전송 
    	int i=0; // 읽은 바이트 수 
    	byte[] buffer=new byte[1024];
    	while((i=bis.read(buffer, 0, 1024))!=-1)
    	{
    		// -1 EOF 
    		bos.write(buffer,0, i);
    	}
    	
    	bis.close();
    	bos.close();
    	
    }catch(Exception ex){}
%>
