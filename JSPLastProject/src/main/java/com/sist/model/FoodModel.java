package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class FoodModel {
   @RequestMapping("food/food_main.do")
   public String food_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   int start=(curpage*12)-12;
	   List<FoodVO> list=FoodDAO.foodListData(curpage);
	   int totalpage=FoodDAO.foodTotalPage();
	   
	   final int BLOCK=10;
	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	   if(endPage>totalpage)
		   endPage=totalpage;
	   
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("endPage", endPage);
	   request.setAttribute("startPage", startPage);
	   
	   
	   request.setAttribute("food_jsp", "../food/list.jsp");
	   request.setAttribute("main_jsp", "../food/food_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("food/detail.do")
   public String food_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String no=request.getParameter("no");
	   FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
	   request.setAttribute("vo", vo);
	   // 댓글 => vue / find => vue 
	   request.setAttribute("food_jsp", "../food/detail.jsp");
	   request.setAttribute("main_jsp", "../food/food_main.jsp");
	   return "../main/main.jsp";
   }
   
}
