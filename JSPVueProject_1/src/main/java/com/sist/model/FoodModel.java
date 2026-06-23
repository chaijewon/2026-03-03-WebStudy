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
@Controller
public class FoodModel {
   @RequestMapping("food/list.do")
   public String food_list(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   return "../food/list.jsp";
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
		  map.put("food_list", list);
		  
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
   
}




