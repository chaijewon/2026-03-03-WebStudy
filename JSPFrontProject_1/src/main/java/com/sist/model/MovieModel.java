package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// Spring / Spring-Boot
// 클래스 구분자 
import java.net.*;
import java.io.*;
@Controller
/*
 *  searchMainDailyBoxOffice.do
	  searchMainRealTicket.do
	  searchMainDailySeatTicket.do
	  https://www.kobis.or.kr/kobis/business/main/
 */
public class MovieModel {
   private String baseURL="https://www.kobis.or.kr/kobis/business/main/";
   private String[] movie={
		 "",
		 "searchMainDailyBoxOffice.do",
		 "searchMainRealTicket.do",
		 "searchMainDailySeatTicket.do" 
   };
   @RequestMapping("js/movie_list.do")
   public void movie_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   try
	   {
		   URI uri=new URI(baseURL+movie[Integer.parseInt(no)]);
		   URL url=uri.toURL();
		   HttpURLConnection conn=
				   (HttpURLConnection)url.openConnection();
		   String json="";
		   if(conn!=null)//사이트에 연결이 되었다면 
		   {
			   BufferedReader in=
					new BufferedReader(
							new InputStreamReader(conn.getInputStream()));
			   while(true)
			   {
				   String s=in.readLine();
				   if(s==null)
					   break;
				   json+=s;
			   }
			   conn.disconnect();
		   }
		   //System.out.println(json);
		   //  브라우저로 전송 
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter(); // 요청 브라우저 
		   out.write(json);
	   }catch(Exception ex){}
	   
   }
}





