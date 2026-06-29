package com.sist.commons;

import java.io.PrintWriter;

import jakarta.servlet.http.HttpServletResponse;

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
