package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class BoardModel {
   @RequestMapping("board/list.do")
   public String board_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	
	      String page=request.getParameter("page");
		  if(page==null)
			  page="1";
		  int curpage=Integer.parseInt(page);
		  final int ROWSIZE=10;
		  int start=(curpage*ROWSIZE)-ROWSIZE;
		  List<DataBoardVO> list=DataBoardDAO.boardListData(start);
		  int count=DataBoardDAO.boardRowCount();
		  int totalpage=(int)(Math.ceil(count/(double)ROWSIZE));
		  count=count-((curpage*ROWSIZE)-ROWSIZE);
		  
		  // 전송 
		  request.setAttribute("list", list);
		  request.setAttribute("totalpage", totalpage);
		  request.setAttribute("curpage", curpage);
		  request.setAttribute("count", count);
		  
	      request.setAttribute("main_jsp", "../board/list.jsp");
	      return "../main/main.jsp";
   }
   @RequestMapping("board/insert.do")
   public String board_insert(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../board/insert.jsp");
	   return "../main/main.jsp";
   }
}
