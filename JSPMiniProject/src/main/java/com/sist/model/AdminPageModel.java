package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class AdminPageModel {
	   @RequestMapping("adminpage/admin_main.do")
	   public String adminpage_main(HttpServletRequest request,
			   HttpServletResponse response)
	   {
		   request.setAttribute("admin_jsp", "../adminpage/admin_home.jsp");
		   
		   return "../adminpage/admin_main.jsp";
	   }
}
