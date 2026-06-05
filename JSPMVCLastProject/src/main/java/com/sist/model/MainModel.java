package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class MainModel {
  @RequestMapping("main/main.do")
  public String main_main(HttpServletRequest request,HttpServletResponse response)
  {
	  // 화면 목록 
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  
	  // 현재 페이지 지정 
	  int curpage=Integer.parseInt(page);
	  // 데이터베이스에서 출력할 데이터를 가지고 온다 
	  int start=(curpage*12)-12;
	  List<FoodVO> list=FoodDAO.foodListData(start);
	  int totalpage=FoodDAO.foodTotalPage();
	  
	  // 블록별 페이지 처리
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  if(endPage>totalpage)
		  endPage=totalpage;
	  
	  // 데이터를 브라우저로 전송 
	  request.setAttribute("list", list);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  // include 
	  return "../main/main.jsp";
  }
}
