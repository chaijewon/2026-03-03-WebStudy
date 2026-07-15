package com.sist.model;

import java.util.List;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.ReserveDAO;
import com.sist.vo.ReserveVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
   @RequestMapping("mypage/mypage_reserve.do")
   public String mypage_reserve(HttpServletRequest request,
		   HttpServletResponse response)
   {
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   List<ReserveVO> list=ReserveDAO.reservemyPageListData(id);
	   request.setAttribute("list", list);
	   request.setAttribute("mypage_jsp", "../mypage/mypage_reserve.jsp");
	   request.setAttribute("main_jsp", "../mypage/mypage_main.jsp");
	   return "../main/main.jsp";
   }
}
