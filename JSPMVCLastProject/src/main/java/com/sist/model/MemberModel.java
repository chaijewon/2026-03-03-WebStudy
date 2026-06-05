package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MemberModel {
	  @RequestMapping("member/login.do")
	  public String member_login(HttpServletRequest request,HttpServletResponse response)
	  {
		  // DB연동
		  request.setAttribute("main_jsp", "../member/login.jsp");
		  // include 
		  return "../main/main.jsp";
	  }
}
