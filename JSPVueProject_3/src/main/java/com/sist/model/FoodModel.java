package com.sist.model;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// Model / JSP / DAO / VO 
@Controller
public class FoodModel {
   @RequestMapping("food/list.do")
   public String food_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../food/list.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("food/list_vue.do")
   public void food_list_vue(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   try
	   {
		  String page=request.getParameter("page");
		  int curpage=Integer.parseInt(page);
		  int start=(curpage*12)-12;
		  List<FoodVO> list=FoodDAO.foodListData(start);
		  int totalpage=FoodDAO.foodTotalPage();
		  
		  final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		  if(endPage>totalpage)
			  endPage=totalpage;
		  
		  Map map=new HashMap();
		  map.put("startPage", startPage);
		  map.put("endPage", endPage);
		  map.put("curpage", curpage);
		  map.put("totalpage", totalpage);
		  map.put("list", list);
		  
		  ObjectMapper mapper=new ObjectMapper();
		  String json=mapper.writeValueAsString(map);
		  // @RestController : 자동 jackson사용 => JSON 
		  
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(json);
	   }catch(Exception ex) {}
   }
   @RequestMapping("food/detail_vue.do")
   public void food_detail(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   try
	   {
		   String no=request.getParameter("no");
		   FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		   ObjectMapper mapper=new ObjectMapper();
		   String json=mapper.writeValueAsString(vo);
		   
		   response.setContentType("text/plain;charset=UTF-8");
		   PrintWriter out=response.getWriter();
		   out.write(json);
	   }catch(Exception ex) {}
   }
   @RequestMapping("food/find.do")
   public String food_find(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../food/find.jsp";
   }
   
   // @Controller(화면 변경) / @RestController (JavaScript => JSON)
   //                        @ResponseBody 메소드
   @RequestMapping("food/find_vue.do")
   public void food_find_vue(HttpServletRequest request,
		   HttpServletResponse response)
   {
	    // 1. page / column / 검색어 
	    String page=request.getParameter("page");
	    String column=request.getParameter("column");
	    String ss=request.getParameter("ss");
	    
	    // JSP => 서버 => 새로운 JSP 출력 (기존에 있는 JSP 자동으로 메모리 해제)
	    // Vue / Ajax ==> 화면 변경이 없이 그자리에서 처리 (JSP를 그대로 유지)
	    int curpage=Integer.parseInt(page);
	    int start=(curpage*12)-12;
	    Map map=new HashMap();
	    map.put("start", start);
	    map.put("column", column);
	    map.put("ss", ss);
	    List<FoodVO> list=FoodDAO.foodFindListData(map);
	    int totalpage=FoodDAO.foodFindTotalPage(map);
	    
	      final int BLOCK=10;
		  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		  
		  if(endPage>totalpage)
			  endPage=totalpage;
		  
		  map=new HashMap();
		  map.put("startPage", startPage);
		  map.put("endPage", endPage);
		  map.put("curpage", curpage);
		  map.put("totalpage", totalpage);
		  map.put("food_list", list);
		  
		 try
		 {
		  ObjectMapper mapper=new ObjectMapper();
		  String json=mapper.writeValueAsString(map);
		  // JSON 제작 => 자동화 : jackson => 반드시 변수와 키가 동일 
		  // 객체 단위로 제작 
		  // 브라우저 전송 
		  response.setContentType("text/plain;charset=UTF-8");
		  PrintWriter out=response.getWriter();
		  out.write(json);
		  // List => [] => {}
		  // VO   => {}
		 }catch(Exception ex) {}
	   
   }
   /*
    *   http://localhost/JSPVueProject_1/food/detail.do?no=31
    *   
    *   => URI : food/detail.do
    */
   @RequestMapping("food/detail.do")
   public String food_detail1(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../food/detail.jsp";
   }
}




