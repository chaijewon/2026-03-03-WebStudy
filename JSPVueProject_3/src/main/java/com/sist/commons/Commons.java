package com.sist.commons;

import java.io.PrintWriter;
import jakarta.servlet.http.HttpServletResponse;
/*
 *   1. 소스 확인 => github 주소 
 *      = 변수명 / 메소드명 
 *      = 중복처리 => 공통 모듈 
 *      = CRUD 
 *   ----------------------------
 *   2. github에서 가장 많이 보는 부분 
 *      
 */
public class Commons {
   public static void sendData(HttpServletResponse response,
		                       String type,String data)
   {
	   try
	   {
		   response.setContentType(type+";charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(data);
	   }catch(Exception ex) {}
   }
   
   
}
