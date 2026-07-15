package com.sist.model;

import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReserveDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 데이터 JSP로 전송  => @Controller가 있는 클래스만 => DispatcherServlet
/*
 *   ajax : 비도동기식 
 *     | 화면 변환이 없다 
 *     
 *     | => return "a.jsp"; : 화면 변경 => 변경된 데이터 전송 
 *                            => forward
 *     | => return "redirect:" : 화면만 변경 sendRedirect
 *     ------------------------------------------------ Spring
 *     | 화면변경이 없다 
 *       : void => Spring : 데이터만 전송  
 *     |
 *       @RequestMapping("") => 요청 받은 경우 
 *        => if문 대신에 사용 
 *        public void aaa(){}
 *       ---------------------
 *       
 *       @RequestMapping("")
 *       @ResponseBody
 *       public void aaa(){}
 *       -------------------------- @RestController 
 *       
 *     서버 
 *      | => Back / Front
 *      
 *     서버  =======  Front
 *                   vue / react / next
 *     | spring-boot/nodejs 
 *       
 */
@Controller  // DispatcherServlet (요청 = 응답) Controller => Servlet
public class ReserveModel {
   @RequestMapping("reserve/reserve_main.do")
   public String reserve_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../reserve/reserve_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("reserve/reserve_food.do")
   public String reserve_food(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   String type=request.getParameter("type");
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   int start=(curpage*20)-20;
	   Map<String,Object> map=new HashMap<String,Object>();
	   map.put("type", type);
	   map.put("start",start);
	   List<FoodVO> list=ReserveDAO.reserveFoodListData(map);
	   int totalpage=ReserveDAO.reserveFoodTotalPage(type);
	   
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("type", type);
	   return "../reserve/reserve_food.jsp";
   }
} 







