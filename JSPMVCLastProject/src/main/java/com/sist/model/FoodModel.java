package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.FoodDAO;
import com.sist.vo.FoodVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
// .do => Model이 받는다 
@Controller
public class FoodModel {
	  @RequestMapping("food/detail.do")
	  public String food_detail(HttpServletRequest request,HttpServletResponse response)
	  {
		  String no=request.getParameter("no");
		  // 상세보기 데이터 
		  FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(no));
		  
		  // 브라우저 전송 
		  request.setAttribute("vo", vo);
		  request.setAttribute("main_jsp", "../food/detail.jsp");
		  // include 
		  return "../main/main.jsp";
	  }
}
