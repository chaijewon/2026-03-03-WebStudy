package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MyPageModel {
   @RequestMapping("mypage/mypage_main.do")
   public String mypage_main(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/mypage_home.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("mypage/jjim_list.do")
   public String mypage_jjim(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/jjim_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("mypage/cart_list.do")
   public String mypage_cart(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/cart_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("mypage/buy_list.do")
   public String mypage_buy(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   request.setAttribute("mypage_jsp", "../mypage/buy_list.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
}
