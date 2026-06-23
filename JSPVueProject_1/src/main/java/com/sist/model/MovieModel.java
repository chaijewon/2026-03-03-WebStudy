package com.sist.model;

import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MovieModel {
  private String[] links= {
	 "",
	 "searchMainDailyBoxOffice.do",
	 "searchMainRealTicket.do",
	 "searchMainDailySeatTicket.do"
  };
  private final String baseUrl="https://www.kobis.or.kr/kobis/business/main/";
  @RequestMapping("movie/list.do")
  public void movie_list(HttpServletRequest request,
		      HttpServletResponse response)
  {
	  try
	  {
		  // 브라우저에서 전송한 값을 받는다 
		  String no=request.getParameter("no");
		  String url=baseUrl+links[Integer.parseInt(no)];
		  Document doc=Jsoup.connect(url).get();
		  //System.out.println(doc.toString());
		  String data=doc.toString();
		  data=data.substring(data.indexOf("["),data.lastIndexOf("]")+1);
		  System.out.println(data);
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(data);
	  }catch(Exception ex){}
  }
}
