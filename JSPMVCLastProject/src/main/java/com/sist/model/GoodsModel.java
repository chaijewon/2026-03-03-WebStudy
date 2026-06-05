package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class GoodsModel {
	  @RequestMapping("goods/list.do")
	  public String goods_list(HttpServletRequest request,HttpServletResponse response)
	  {
		  request.setAttribute("main_jsp", "../goods/list.jsp");
		  // include 
		  return "../main/main.jsp";
	  }
}
