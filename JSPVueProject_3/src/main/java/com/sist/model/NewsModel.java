package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.vo.*;
import com.sist.manager.*;
@Controller
public class NewsModel {
   @RequestMapping("news/find.do")
   public String news_news(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String fd=request.getParameter("fd");
	   if(fd==null)
		   fd="축구";
	   List<NewsVO> list=NewsManager.newsFindData(fd);
	   request.setAttribute("list", list);
	   request.setAttribute("main_jsp", "../news/find.jsp");
	   return "../main/main.jsp";
   }
}
