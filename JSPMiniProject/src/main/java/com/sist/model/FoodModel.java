package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class FoodModel {
  @RequestMapping("food/list.do") // 중복되면 실행이 안됨 => 
  // 메소드 => 형식 3가지 
  /*
   *   Ajax ========> void
   *   ----------------- 
   *   SendRedirect() => "redirect:../list.do"
   *   Forward()
   *   ----------------- String "../main/main.jsp"
   *   
   *   핵심 
   *   공통 => 모아서 관리 
   */
  public String food_list(HttpServletRequest request,HttpServletResponse response)
  {
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  final int ROWSIZE=12;
	  int start=(curpage*ROWSIZE)-ROWSIZE;
	  List<FoodVO> list=FoodDAO.foodListData(start);
	  int totalpage=FoodDAO.foodTotalPage();
	  
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  request.setAttribute("list", list);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  
	  request.setAttribute("main_jsp", "../food/list.jsp");
	  return "../main/main.jsp";
  }
}
